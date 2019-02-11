# terraform-single-page-app

Common infrastructure for single page applications

## Overview

Module creates:

- AWS S3 bucket for storing assets
- AWS CloudFront distribution for serving the assets

## Variants

The [`master`](https://github.com/codequest-eu/terraform-single-page-app/tree/master) branch should be used for public production deployments, for development environments you might want to use:

- [`basic-auth`](https://github.com/codequest-eu/terraform-single-page-app/tree/basic-auth)

  Adds a AWS Lambda@Edge which protects the `index.html` using basic auth.
  Should be used for development and staging environments.

- [`pull-request-router`](https://github.com/codequest-eu/terraform-single-page-app/tree/pull-request-router)

  Adds a AWS Lambda@Edge which routes traffic to Pull Request specific `index.html`

- [`basic-auth-and-pull-request-router`](https://github.com/codequest-eu/terraform-single-page-app/tree/basic-auth-and-pull-request-router)

  Combines `basic-auth` and `pull-request-router`. Should be used for preview environments.

## Variables

> TODO: variables

## Outputs

> TODO: outputs

## Examples

> TODO: examples
