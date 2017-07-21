#!/bin/bash

set -e # -x

echo "-----> `date`: Upload stemcell"
bosh -n upload-stemcell "https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent?v=3421.4" \
  --sha1 e7c440fc20bb4bea302d4bfdc2369367d1a3666e \
  --name bosh-warden-boshlite-ubuntu-trusty-go_agent \
  --version 3421.4

echo "-----> `date`: Delete previous deployment"
bosh -n -d pravega delete-deployment --force

echo "-----> `date`: Deploy"
( set -e; cd ./..; bosh -n -d pravega deploy ./manifests/pravega.yml -o ./manifests/dev.yml )

echo "-----> `date`: Recreate all VMs"
bosh -n -d pravega recreate

echo "-----> `date`: Exercise deployment"
bosh -n -d pravega run-errand smoke-tests

echo "-----> `date`: Restart deployment"
bosh -n -d pravega restart

echo "-----> `date`: Report any problems"
bosh -n -d pravega cck --report

echo "-----> `date`: Delete random VM"
bosh -n -d pravega delete-vm `bosh -d pravega vms --column vm_cid|sort|head -1`

echo "-----> `date`: Fix deleted VM"
bosh -n -d pravega cck --auto

echo "-----> `date`: Delete deployment"
bosh -n -d pravega delete-deployment

echo "-----> `date`: Done"
