## Installation

### Install terraform on Mac (version 0.11.8)
```
$ curl -O https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_darwin_amd64.zip
$ unzip terraform_0.11.8_darwin_amd64.zip
$ mv terraform /usr/local/bin/
$ terraform -v 
Terraform v0.11.8
```

### Install azure-cli on Mac (latest)
```
$ brew install azure-cli
$ az --version
azure-cli (2.0.45)
```

### Azure Login
```
$ git clone https://github.com/nagao-masaki-oisix/terraform.git
```

## Configuration

### Azure Login
```
$ az login
```

### create a new Storage Container
```
Location List
$ az account list-locations

Create Resource Group
$ az group create --name terraformValueGroup --location "Japan East"

Create Storage Account
$ az storage account create --location "Japan East" --name "oiradaichi" --resource-group "terraformValueGroup" --sku "Standard_GRS"

Create Storage Container
$ az storage container create --account-name "oiradaichi" --name "oisix"

Get Storage Key
$ az storage account keys list --account-name oiradaichi
[
  {
    "keyName": "key1",
    "permissions": "Full",
    "value": "XXXXXXXXXXXXXXXXXXXXXXXX"
  },
  {
    "keyName": "key2",
    "permissions": "Full",
    "value": "YYYYYYYYYYYYYYYYYYYYYYY"
  }
]
```
