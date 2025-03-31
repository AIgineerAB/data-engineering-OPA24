# Setup data load tool (dlt)

Video on dlt theory :point_down:

[![theory on dlt](https://github.com/kokchun/assets/blob/main/data_warehouse/dlt_intro_video.png?raw=true)](https://youtu.be/m4zrj5ZUWs4)

Video on dlt setup and loading csv file to duckdb :point_down:
[link](https://www.youtube.com/watch?v=qktFiYMYXbQ&t=1015s)

## Virtual environment

We'll be using a virtual environment with the [uv package](https://github.com/astral-sh/uv), which is a package installer and resolver for Python. Start by installing uv globally using this command

```bash
pip install uv
```

> [!NOTE]
> Make sure no virtual environment is activated when running that comamnd in order to install it globally. 


Navigate to your repository and run 

```bash
uv venv 
```
This creates a `.venv`  directory, which stores information of your virtual environment. Now you can activate this venv through 

```bash
# in windows
source .venv/Scripts/activate

# in mac/linux
source .venv/bin/activate
```

Installing packages into your uv virtual environment: 

```bash
uv pip install "dlt[duckdb]" ipykernel pandas "dlt[parquet]"
```

> [!NOTE]
> `"dlt[duckdb]"` means installing `dlt` and its dependencies for connecting to duckdb 

Now check that dlt is installed by typing `dlt --version` in your terminal. Also check the other packages using `uv pip list`. 


## Connect dlt to duckdb

Start downloading a csv file from Kaggle. We'll be using [Netflix Original Films & IMDB Scores](https://www.kaggle.com/datasets/luiscorter/netflix-original-films-imdb-scores). 

Navigate to your code directory and initialize a dlt project by typing 

```bash
dlt init load_duckdb duckdb
```

> [!NOTE]
> Alternatively, you can create all files from scratch without ```dlt init```

Place the csv data file in the data folder under the course repo. Then change the script file according to my code in `load_csv_pipeline.py`. As duckdb is a file database, we do not need to configure secrets and connections normally required for other database servers. We will be seeing extra configurations with these when we start to use snowflake as the data warehouse instead. 

When running the script `load_csv_pipeline.py` in the terminal with python, you can see that a duckdb database file is created according to the destination path configured in the python script. The duckdb database file is at the same time populated with data from the csv file. 

## Other videos :video_camera:

- [Data ingestion from APIs to warehouses - A. Brudaru (2024)](https://www.youtube.com/watch?v=oLXhBM7nf2Q&list=PLoHF48qMMG_R3Migi4SBLkqhkLHDzmEsL)



## Read more :eyeglasses:

- [Why we are building dlt and dlthub - dlthub docs](https://dlthub.com/why-dlt)
- [Getting started - dlthub docs](https://dlthub.com/docs/getting-started)
- [dlt connection with duckdb - dlthub docs](https://dlthub.com/docs/dlt-ecosystem/destinations/duckdb)
