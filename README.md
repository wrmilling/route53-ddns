# route53-ddns

Documentation is under construction.

Simple docker container with a built in route53 update script. Originally designed to be used in a Kubernetes cronjob though could be used stand alone. Take a look at [scripts/update-route53](scripts/update-route53) for details of how it runs. 

## Basic Usage

```
docker run -e AWS_ACCESS_KEY_ID='' -e AWS_SECRET_ACCESS_KEY='' -e RECORDSET='' -e ZONEID='' ghcr.io/WRMilling/route53-ddns:latest 
```
* `AWS_ACCESS_KEY_ID` is the your IAM access key id with the proper permissions to manage route53
* `AWS_SECRET_ACCESS_KEY` is the corresponding secret key for the above key id
* `RECORDSET` is the FQDN you are trying to update
* `ZONEID` is the hosted zone ID for your domain

## Example Uage in K8S

You can find an example usage of this package in my GitOps repo here: [WRMilling/k3s-gitops/kube-system/dynamic-dns/cronjob.yaml](https://github.com/WRMilling/k3s-gitops/blob/master/kube-system/dynamic-dns/cronjob.yaml).
