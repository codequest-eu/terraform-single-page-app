provider "aws" {
  region = "eu-west-1" # Ireland
}

module "spa" {
  # You should use ?ref={commit_hash} instead, we're only using ?ref={branch}
  # here to avoid constant examples update whenever we push a new commit
  source = "github.com/codequest-eu/terraform-single-page-app?ref=master"
}
