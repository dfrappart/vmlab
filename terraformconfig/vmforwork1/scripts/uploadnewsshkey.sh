#!/bin/bash
az keyvault secret set --vault-name kvlabxl51 --name linuxvmsshkey --file /Users/df/Documents/myrepo/vmlab/terraformconfig/vmforwork1/scripts/avm-lab2server2.pem --encoding ascii