from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName('ExerciseSpark')
    .getOrCreate()
)

# Ler os dados do ENEM 2020
enem = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://edc-igti-datalake1/raw-data/enem/')
)


(
    enem
    .write
    .mode('overwrite')
    .format('parquet')
    .partitionBy('enem')
    .save('s3://edc-igti-datalake1/staging/enem')
)