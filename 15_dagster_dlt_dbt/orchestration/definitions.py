# ==================== #
#                      #
#        Set Up        #
#                      #
# ==================== #

#import dagster packages
import dagster as dg
from dagster_dbt import DbtCliResource, DbtProject, dbt_assets
from dagster_dlt import DagsterDltResource, dlt_assets

import dlt

from pathlib import Path

# import a standalone dlt python script outside the orchestration working directory
import sys
sys.path.insert(0, '../data_extract_load')
from jobads_pipeline import jobads_source
#sys.path.pop(0) #not necessary to clean up sys path because there is no more moduel to be imported
 
# data warehouse directory
db_path = str(Path(__file__).parents[1] / "data_warehouse/ads.duckdb")


# ==================== #
#                      #
#       dlt Asset      #
#                      #
# ==================== #

dlt_resource = DagsterDltResource()


@dlt_assets(
    dlt_source = jobads_source(),
    dlt_pipeline = dlt.pipeline(
        pipeline_name="jobads_hits",
        dataset_name="staging",
        destination=dlt.destinations.duckdb(db_path),
    ),
)
def dlt_load(context: dg.AssetExecutionContext, dlt: DagsterDltResource): #need context metadata to pass to dlt run
    yield from dlt.run(context=context) #yield all items from running the pipeline


# ==================== #
#                      #
#       dbt Asset      #
#                      #
# ==================== #

# Points to the dbt project path
dbt_project_directory = Path(__file__).parents[1] / "data_transformation"
# Define the path to your profiles.yml file (in your home directory)
profiles_dir = Path.home() / ".dbt"  

#instantiate a dagster dbt project object with the paths above
dbt_project = DbtProject(project_dir=dbt_project_directory,
                         profiles_dir=profiles_dir)

# References the dbt project object
dbt_resource = DbtCliResource(project_dir=dbt_project)

# Compiles the dbt project & allow Dagster to build an asset graph
dbt_project.prepare_if_dev()

# Yields Dagster events streamed from the dbt CLI
@dbt_assets(manifest=dbt_project.manifest_path,) #access metadata of dbt project so that dagster understand structure of the dbt project
def dbt_models(context: dg.AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream() #compile the project and collect all results


# ==================== #
#                      #
#         Job          #
#                      #
# ==================== #

job_dlt = dg.define_asset_job("job_dlt", selection=dg.AssetSelection.keys("dlt_jobads_source_get_hits"))
job_dbt = dg.define_asset_job("job_dbt", selection=dg.AssetSelection.keys("staging/original_headline"))

# ==================== #
#                      #
#       Schedule       #
#                      #
# ==================== #

#schedule for the first job
schedule_dlt = dg.ScheduleDefinition(
    job=job_dlt,
    cron_schedule="17 8 * * *" #UTC
)

# ==================== #
#                      #
#        Sensor        #
#                      #
# ==================== #

#sensor for the second job
@dg.asset_sensor(asset_key=dg.AssetKey("dlt_jobads_source_get_hits"),
                 job_name="job_dbt")
def dlt_load_sensor():
    yield dg.RunRequest()


# ==================== #
#                      #
#     Definitions      #
#                      #
# ==================== #

# Dagster object that contains the dbt assets and resource
defs = dg.Definitions(
                    assets=[dlt_load, dbt_models], 
                    resources={"dlt": dlt_resource,
                               "dbt": dbt_resource},
                    jobs=[job_dlt, job_dbt],
                    schedules=[schedule_dlt],
                    sensors=[dlt_load_sensor],
                    )


