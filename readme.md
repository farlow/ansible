# Dépôt pour les fichiers terraform permettant de déployer l'infrastructure pour le cours ansible

## Prérequis:  
- un compte AWS
- terraform  
- variables d'environnement :  
```shell
    export AWS_ACCESS_KEY_ID="access key aws"  
    export AWS_SECRET_ACCESS_KEY="secret de l'access key aws"  
    export TF_VAR_user_name="nom de l'utilisateur"  
    export TF_VAR_user_password="mot de passe de l'utilisateur"
```

## Usage:  
- Déploiement 
```shell
    git clone https://github.com/farlow/ansible.git
    cd ansible/terraform
    terraform init
    terraform plan
    terraform apply
```
- Contrôler l'état des VMs
```shell
    apt install python3 python3-venv -y
    python3 -m venv .env
    source .env/bin/activate
    pip3 install boto3
    python3 ../instance_state.py
```
