import dlt
import requests
import json
from pathlib import Path

# for illustration purpose, we only request data for one occupation field
params = {"limit": 100, "occupation-field": "MVqp_eS8_kDZ"}


def _get_ads(url_for_search, params):
    headers = {"accept": "application/json"}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode("utf8"))

# this is for removing data in the default staging_staging scheme created by dlt
dlt.config["load.truncate_staging_dataset"] = True

@dlt.resource(table_name = "hits",
              write_disposition="merge",
              primary_key="id"
              )
def get_hits(params):

    url = "https://jobsearch.api.jobtechdev.se"
    url_for_search = f"{url}/search"
    limit = params.get("limit", 100)
    offset = 0

    while True:
        # build this page’s params
        page_params = dict(params, offset=offset)
        data = _get_ads(url_for_search, page_params)

        hits = data.get("hits", [])
        if not hits:
            # no more results
            break

        # yield each ad on this page
        for ad in hits:
            yield ad

        # if fewer than a full page was returned, we’re done
        if len(hits) < limit or offset > 1900:
            break

        offset += limit

# to work with dagster, we need to create a dlt source to include the dlt resource
@dlt.source
def jobads_source():
    return get_hits(params)
