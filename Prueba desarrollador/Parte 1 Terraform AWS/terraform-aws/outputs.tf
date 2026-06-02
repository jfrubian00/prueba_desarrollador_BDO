output "instance_id" {
  value = aws_instance.vm.id
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}