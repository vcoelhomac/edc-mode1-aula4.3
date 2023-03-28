#HCL - hashicorp Configuration language
# Linguagem declarativa
resource "aws_s3_bucket" "datalake" {
  #parametros de configuração do recurso escolhido
  bucket = "$(var.base_bucket_name)-$(var.ambiente)-$(var.numero_conta)"
  acl    = "private" #tipo de acesso
 server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default  {
        sse_algorithm = "AES256"
      }
    }
  }


  tags = {
    IES   = "IGTI"
    CURSO = "EDC"

  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../jobspark.py"
  etag   = filemd5("../jobspark.py") # para nao repetir os dados que foram carregados

}

provider "aws" {
  region = "us-east-2"
}