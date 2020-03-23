# Deploy to Netlify

A Github Action to deploy to Netlify the contents of a directory. This action
requires that the files to be deployed are built inside a `build` directory.
This is where the action picks the files up from to upload them further to Netlify.

## Inputs

This Action requires a few inputs:

| Name | Required | Default | Description |
|:----:|:--------:|:-------:|:-----------:|
| `AUTH_TOKEN` | `true` | - | The Netlify token. One can be ([generated here](https://app.netlify.com/user/applications#personal-access-tokens)). |
| `SITE_ID` | `true` | - | The Netlify site where the files will be deployed to. It can be found in the Netlify Site Settings. |
| `DEPLOY_PROD` | `false` | `false` | Trigger a production deploy or not. More info here: https://docs.netlify.com/site-deploys/overview/#branch-deploy-controls |

## Example

Deploy to production from the `master` branch. Remember that this action needs
to build, copy or checkout the files to be deployed into a local `./build` dir.
That is what this action will upload to Netlify.

> The secrets are defined in your repo's settings

```yml
name: 'Deploy to Netlify'

on:
  push:
    branches:
    - master

jobs:
  deploy:
    name: 'Deploy'
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Build the website
        run: <commands_to_build_the_site_and_store_the_output_in_'./build'>
      - name: Deploy Netlify
        uses: danachim/gh-action-deploy-netlify@master
        with:
          AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
          SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
          DEPLOY_PROD: true
```

## More
For more info on how to reference Actions in your workflow files, please check [this article by Github](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow)
