#!/bin/bash

# to run the script, type ./create-vsi.sh servername
# where servername is the hostname of your server
# this script assumes you have a VPC created, including subnet and ssh key.
# You must also have the ibmcloud CLI installed and working. 

# set the IBM Cloud region for your VPC - e.g. eu-gb, eu-de, us-south etc

echo "set region to eu-gb"
ibmcloud target -r eu-gb
ibmcloud is target --gen 2 

# set the name of your resource group

ibmcloud target -g VPC-RG

# set the ID of your VPC
# you can find this through the command:
# ibmcloud is vpcs

echo "set vpc"
vpc=r018-b2f56ce6-xxxx-xxxx-xxxx-021870460c75
echo $vpc

# set the id of your subnet
# you can find this through the command:
# ibmcloud is subnets

echo "set subnet"
subnet=0787-2bc68468-xxxx-xxxx-xxxx-674312c07641
echo $subnet 

# set the ID of your SSH Key
# you can find this through the command
# ibmcloud is keys

echo "set key"
key=r018-76b6fa68-xxxx-xxxx-xxxx-c56a8ba31ae0
echo $key

# this gets the ID of the OS image to be used, in this case centos8

echo "set image"
image=$(ibmcloud is images | grep "centos-8-amd64" | cut -d" " -f1)
echo $image

# set the ID of the security group that you want to use
# you can find this through the command:
# ibmcloud is security-groups

echo "Set the security Group"
sg=r018-bce36f6b-xxxx-xxxx-xxxx-9e4f8f240870


echo "Creating VSI named $x"

## this command creates the VSI
## note the --user-data argument 

ibmcloud is instance-create $1 $vpc eu-gb-1 cx2-2x4 $subnet --image-id $image --security-group-ids $sg --key-ids $key --user-data @webserver-userdata.sh --resource-group-name VPC-RG

echo "image created. Check Console for status"
