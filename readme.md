# Dépôt pour les fichiers terraform permettant de déployer l'infrastructure pour le cours ansible

## Prérequis:  
- terraform  
- variables d'environnement :  
```shell
    export AWS_ACCESS_KEY_ID="access key aws"  
    export AWS_SECRET_ACCESS_KEY="secret de l'access key aws"  
    export TF_VAR_username="nom de l'utilisateur"  
    export TF_VAR_user_password="mot de passe de l'utilisateur"
```

## Usage:  
```shell
    git clone https://github.com/farlow/ansible.git
    cd ansible/terraform
    terraform plan
    terraform apply
    python ../instance_state.py
```