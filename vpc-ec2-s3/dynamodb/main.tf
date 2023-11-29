module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  version  = "3.3.0"
  name     = "my-table"
  hash_key = "id"

  
  
  
  
  
  attribute {
      name = "TestTable"
      type = "N"
    }
  

  tags = {
    Terraform   = "true"
    Environment = "staging"
    Name        = "azadeh-dynamodb"
  }
}

resource "aws_dynamodb_table" "example" {
  name             = "example"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }




  replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  }
}
Replica Tagging
You can manage global table replicas' tags in various ways. This example shows using replica.*.propagate_tags for the first replica and the aws_dynamodb_tag resource for the other.

provider "aws" {
  region = "us-west-2"
}

provider "awsalternate" {
  region = "us-east-1"
}

provider "awsthird" {
  region = "us-east-2"
}

data "aws_region" "current" {}

data "aws_region" "alternate" {
  provider = "awsalternate"
}

data "aws_region" "third" {
  provider = "awsthird"
}

resource "aws_dynamodb_table" "example" {
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "TestTableHashKey"
  name             = "example-13281"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }

  replica {
    region_name = data.aws_region.alternate.name
  }

  replica {
    region_name    = data.aws_region.third.name
    propagate_tags = true
  }

  tags = {
    Architect = "Eleanor"
    Zone      = "SW"
  }
}

resource "aws_dynamodb_tag" "example" {
  resource_arn = replace(aws_dynamodb_table.example.arn, data.aws_region.current.name, data.aws_region.alternate.name)
  key          = "Architect"
  value        = "Gigi"
}