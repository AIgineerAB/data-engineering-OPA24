# Extract and load API to duckdb with dlt 

Video on dlt theory to extract and load from API to duckdb :point_down: [TO BE ADDED]

**Video on EDA of jobtech API** :point_down:

<a href="https://youtu.be/HB6Y8eMQ8w0" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/data_warehouse/EDA_job_ads_video.png?raw=true" alt="EDA jobtech" width="600">
</a>


**Video on extract and loading data from jobtech API to duckdb with dlt** :point_down:

<a href="https://www.youtube.com/watch?v=Sy0GxQ4xlgU&list=PLpHkXU1Ab_H-Gdq3OG0eBlDZTHUT4q3Z8&index=2" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/data_engineering/dlt_api.png?raw=true" alt="dlt api" width="600">
</a>

Read [dlthub documentation for loading data from API](https://dlthub.com/devel/tutorial/load-data-from-an-api). 

> [!NOTE]
> We will only do simple loading from API and won't go through incremental loading and pagination. Also we won't use API which requires a secret in the lecture, but there will be an exercise on it.


## Initalize project 

Run 

```bash
dlt init jobsearch duckdb
```


## Arbetsförmedlingen

We will be using jobtech API to get ads published in arbetsförmedlingen/platsbanken. Go into [this code examples repository](https://gitlab.com/arbetsformedlingen/job-ads/getting-started-code-examples/code-examples-start-here) to read documentation. 


## Other videos :video_camera:


## Read more :eyeglasses:

- [Create a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/create-a-pipeline)
- [How to add credentials - dlthub docs](https://dlthub.com/docs/walkthroughs/add_credentials)
- [Add a verified source - dlthub docs](https://dlthub.com/docs/walkthroughs/add-a-verified-source)
- [Run a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/run-a-pipeline)
- [Adjust a schema - dlthub docs](https://dlthub.com/docs/walkthroughs/adjust-a-schema)