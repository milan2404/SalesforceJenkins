# Salesforce DX Project: Next Steps

## Use prettier

Use below commands for installing prettier

```shell
npm init
npm install prettier
npm install prettier prettier-plugin-apex
```

## Build profile

We are using DXB plugin to convert profiles into json. (https://github.com/davidbrowaeys/DXB)

Install dxb using below commands

```shell
sfdx dxb:install
```

Retrive profiles using below command

```shell
sfdx force:source:retrieve -m "CustomObject:Account,Profile:Admin,Profile:Standard"
```

Use below commands to convert your profile from XML to JSON

To convert one profile

```shell
sfdx dxb:profile:convert -p ProfileName
```

To convert all Profile

```shell
sfdx dxb:profile:convert
```


## Test class
Create test suite for each Apex class, Trigger and Flow with same same name

Add all relevent test class to test suite

Deployment will automatically pick up required test classes from test suite and run only those.

## Validate your FeatureBranch

Run Below command to validate your featurebranch

```shell
sh deploy/scripts/validateMyFeatureBranch.sh
```

## Read All About It

-   [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
-   [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
-   [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
-   [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
