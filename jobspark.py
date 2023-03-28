from pyspark.sql.functions import mean, count, min, max, col
from payspark.sql import SparkSession

spark=(
    SparkSession\
    .buider\
    .appName("ExerciseSpark")\
    .getOrCreate()
)
    

enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("InferSchema", True)
    .option("delimiter",";")
    .load("s3://datalake-vcoelhomac-igti-edc/raw-data/enem/")
)

(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .save("s3://datalake-vcoelhomac-igti-edc/raw-data/staging/enem")
    
)