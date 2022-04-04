# ANNUAL INCOME FOR NEWZEALAND
A data engineering Project 

At this project, i've tried to download a CSV file from the website of the newzealand gouvernemant to create a dashboard that resume the income of this country from 2013 to 2020.
For this project we're going to use :
  - Terraform : Infrastructure-as-Code tool more info  here : https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/week_1_basics_n_setup/1_terraform_gcp/1_terraform_overview.md
  - Airflow :https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/week_2_data_ingestion/airflow/docs/1_concepts.md

  - Dbt :dbt stands for data build tool. It's a transformation tool: it allows us to transform process raw data in our Data Warehouse to transformed data which can be later used by Business Intelligence tools and any other data consumers.

dbt also allows us to introduce good software engineering practices by defining a deployment workflow:
        - Develop models
        - Test and document models
        - Deploy models with version control and CI/CD.
        for more infos go check : https://github.com/ziritrion/dataeng-zoomcamp/blob/main/notes/4_analytics.md
        
  - BigQuery : is a Data Warehouse solution offered by Google Cloud Platform.
        -BQ is serverless. There are no servers to manage or database software to install; this is managed by Google and it's transparent to the customers.
        -BQ is scalable and has high availability. Google takes care of the underlying software and infrastructure.
        -BQ has built-in features like Machine Learning, Geospatial Analysis and Business Intelligence among others.
        -BQ maximizes flexibility by separating data analysis and storage in different compute engines, thus allowing the customers to budget accordingly and reduce            costs.
         -Some alternatives to BigQuery from other cloud providers would be AWS Redshift or Azure Synapse Analytics.
  
  - Data studio : A free datavisualisation tool

we’re going to design a pipeline based on GCP (Google Cloud Platform) with the use of :
  - Terraform to create resources in GCP
  -	Data studio for visualization 
  -	Airflow for Pipeline Orchestration
  -	BigQuery as a Warehouse
  -	Dbt : For tranforming data 

![DATA](https://user-images.githubusercontent.com/56431306/161545836-a9bc2bfc-c1e2-430f-8b58-97f7fd7cf668.jpg)

Terraform used to create ressources in GCP, two files :
  - maint.tf :the version of terraform and GCP credentials
  - variables.tf : all the ressources (bucket, bigquery datset, storage type ...)
 
![image](https://user-images.githubusercontent.com/56431306/161554116-0009dba2-8e3a-4b3d-ada6-3d7df440dcd6.png)

In this deposit you're going to find the data ingestion script in the folder airflow/dags + a docker-compose.yaml and a docker file in order to install airlow.
I've put some comments on the code
the results of airflow :

![Capture](https://user-images.githubusercontent.com/56431306/161546673-316d2f87-4cd2-4251-8266-7cedcec66718.PNG)
4 dags :
 - Download the data set (choose your dataset)
 - Format to park in order to change the type of document from csv to parquet size
 - local to gcs in order to put data in a DATA LAKE
 -  Bigquery in order to create the table in the DATA WAREHOUSE
result on GCP :

![image](https://user-images.githubusercontent.com/56431306/161554456-f152c0f7-5ac2-4fd7-890c-4c2d60a48a20.png)

![image](https://user-images.githubusercontent.com/56431306/161554581-027d99a5-bef6-4d5a-b505-5903128348b8.png)


After doing all that, we're going to use dbt tool (cloud version) in order to transform our data (raw data to transformed)
i've created a table named total income 

look at the code :
  - Schema.yml : Define our source code
  - mytransformation.sql : my first transfomation 
  - Total_income.sql : my second one with where statement in order to get only the income
 
![image](https://user-images.githubusercontent.com/56431306/161547771-5a91f18c-56eb-47dc-9a6c-94a65e2fddfa.png)

![dbt](https://user-images.githubusercontent.com/56431306/161552835-5efe0dfc-144e-4bbe-bc91-20b7c09563b5.PNG)

Our new table is ready to be visualisad on Data studio :

![image](https://user-images.githubusercontent.com/56431306/161555052-3c4c6401-b736-4c95-8946-e5c00fb98dde.png)

after we've created the table with dbt, i 've created tree tiles with Data studio :

![image](https://user-images.githubusercontent.com/56431306/161555358-add8ba6e-87c1-46f7-9d75-dda1e4cf7ab9.png)



