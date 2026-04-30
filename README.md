# Logistics Data Warehouse

**Course:** Data Warehousing and Visualisation  
**Author:** Soelema Remenda Pieka  
**University:** Università della Calabria  
**Academic Year:** 2025/2026  

## About
ETL pipeline and data warehouse for logistics operations.
Built in Python using pandas. Visualised in Power BI.

## Data
Download the dataset from Kaggle:
https://www.kaggle.com/datasets/yogape/logistics-operations-database

Place the CSV files in `data/raw/`.

## Structure
logistics-dw/
├── data/
│   ├── raw/        ← source CSV files (not tracked by Git)
│   └── output/     ← final star schema CSVs (not tracked by Git)
├── notebook.ipynb  ← ETL pipeline
└── README.md

## Requirements
pip install pandas numpy matplotlib seaborn