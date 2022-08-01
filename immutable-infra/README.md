## sample local state management

```{bash}
# rds/terraform.tfvars
profile="dev" # aws profile
password="7CA3e2ycFqMgmkG" # default db password
id="django-rds" # id of instance

# kubernetes/terraform.tfvars
database_url = "postgres://postgres:PasdfdsY3432@theRDSinstanceaddress:5432/contacts_db"

```

## password generation

```
brew install pwgen
pwgen -s 15 -1
```
