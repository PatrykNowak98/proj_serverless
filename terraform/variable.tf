variable "bucketName" {
	type = string
	default = "patryk-nowak-bucket"
}

variable "aclType" {
	type = string
	default = "private"
}

variable "objectKey" {
	type = string
	default = "test"
}

variable "indexWebFile" {
	type = string
	default = "index.html"
}

variable "errorWebFile" {
	type = string
	default = "error.html"
}

variable "awsSource" {
	type = string
	default = "hashicorp/aws"
}

variable "awsVersion" {
	type = string
	default = "-> 3.27"
}

variable "policyDocPrincipalsType" {
	type = string
	default = "aws"
}

variable "policyDocPrincipalsIdentifiers" {
	type = list(string)
	default = ["123456789012"]
}

variable "policyDocPrincipalsActions" {
	type = list(string)
	default = [
	"s3:GetObject",
	"s3:ListBucket",
	]
}
	
