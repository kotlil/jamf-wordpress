# how to deploy cluster locally and start wordpress
- ```cd terraform```
- ```terraform init```
- ```terraform plan```
- ```terraform apply```
- ```kubectl port-forward service/wordpress 8080:80 -n wordpress```
