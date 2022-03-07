# GKE Terraform Script
This terraform script will provision a GKE cluster in a jiffy.\
When this script is applied, GKE will create an object that will serve as a control plane. \
By default, an initial 1 node will be created using e2-standard-2(2 vCPUs and 8 GB Memory) and the node size will be elastic up to 5 nodes.

## Requirements
- terraform cli - read [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to learn more how setup.
- gcloud cli - read [here](https://cloud.google.com/sdk/docs/install) to learn more how setup. 
- GCP account
- GCP service account keys - read [here](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) to learn more how create. If your just testing things out I suggest use "Owner" role first, and then after if you already know the roles that you need, you can apply least priviledge principle.
- GCS bucket

## Provisioning
1. Fill out the TFvars, use the `project1_dev.tfvars` as guide.
2. Inside the project1_dev dir, edit the `0_gke-cluster/provider.tf`, indicate the bucket name, prefix and credentials to use. Use the current provider.tf as guide.
3. Run `terraform init` and `terraform plan -var-file="../../project1_dev.tfvars"`.
4. If all looks good, then run `terraform apply -var-file="../../project1_dev.tfvars"`.
5. Wait for the k8s cluster to be provisioned.
6. If you want to learn to deploy an app using terraform use the `1_sample_app` dir as guide, here we did not only deployed the deployment and service of a sample app we also created an ingress to expose our app. This ingress utilizes Google Cloud load balancers, so we do not need to deploy an ingress nginx for this.
7. You can now play around with this newly provisioned k8s cluster!

Happy Hacking!

