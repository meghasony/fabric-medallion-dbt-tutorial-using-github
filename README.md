# fabric-medallion-dbt-tutorial

# Build a medallion architecture pipeline with dbt in Microsoft Fabric (Preview)

This repository contains source data and a complete dbt project used to build a Bronze to Gold data pipeline in Microsoft Fabric. It combines Copy Job, Lakehouse, Warehouse, pipelines, and dbt into a single orchestrated flow.

## Overview

The repository demonstrates a Medallion architecture:

- Bronze → raw data ingested into a Lakehouse  
- Silver → cleaned and standardized models built with dbt  
- Gold → aggregated, analytics-ready outputs in a Warehouse  

The flow is designed to stay simple, reproducible, and aligned with real production patterns.

## Architecture flow

GitHub → Copy Job → Lakehouse (Bronze) → dbt (Silver, Gold) → Warehouse

- Copy Job ingests data from raw file URLs  
- Lakehouse stores Bronze tables  
- dbt builds Silver and Gold models in the Warehouse  
- Pipeline orchestrates the full execution  

## Prerequisites

- Microsoft Fabric workspace  
- Permission to create Lakehouse, Warehouse, pipeline, Copy Job, and dbt Job  
- GitHub personal access token for dbt integration

## Data ingestion

The sample data is hosted in this repository to keep the setup minimal.

Copy Job reads the raw CSV files using the GitHub raw URLs:
GitHub is used as a simple public source. Replace it with any supported source in production and follow the same pattern to land data in the Lakehouse Bronze layer.

## dbt project

The dbt project includes:

- Source definitions for Bronze tables  
- Silver models for cleaning and standardization  
- Gold models for aggregation and reporting  

The project follows a layered approach:
- Silver handles type casting, null handling, and deduplication  
- Gold focuses on business-level transformations and metrics  

## Pipeline orchestration
The pipeline executes in this sequence:

1. Copy Jobs load raw data into Bronze tables  
2. dbt Job runs Silver models (`tag:silver`)  
3. dbt Job runs Gold models (`tag:gold`)  

The same dbt Job runs multiple times using selectors, which keeps execution flexible and reusable.

## Expected outputs

After execution:

- Bronze tables exist in the Lakehouse  
- Silver tables contain cleaned data  
- Gold tables contain aggregated results ready for analysis

## Key capabilities demonstrated

- End-to-end orchestration using Fabric pipelines  
- HTTP-based ingestion with Copy Job  
- Lakehouse to Warehouse transformation pattern  
- dbt execution inside Fabric  
- Reusable dbt runs with selectors  

## Extend this project

- Replace CSV sources with a production data source  
- Add tests in dbt for data quality validation  
- Introduce incremental models for large datasets  
- Add CI/CD for dbt deployment  

## References

- https://learn.microsoft.com/fabric/data-factory/what-is-copy-job  
- https://learn.microsoft.com/fabric/data-factory/dbt-job-activity  
- https://learn.microsoft.com/fabric/onelake/onelake-medallion-lakehouse-architecture  


