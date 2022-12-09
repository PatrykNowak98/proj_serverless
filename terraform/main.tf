resource "aws_s3_bucket" "b" {
  bucket = "patryk-nowak-terraform-bucket"

  tags = {
    Name        = "Patryk bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "ACL example" {
  bucket = patryk-nowak-terraform-bucket
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = patryk-nowak-terraform-bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "patryk-nowak-terraform-bucket"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = "patryk-nowak-terraform-bucket"
  acl    = "private"
}

resource "aws_s3_bucket" "example" {
  bucket = "patryk-nowak-terraform-bucket"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = patryk-nowak-terraform-bucket
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}


