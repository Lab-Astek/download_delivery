# download_delivery

Ce script permet de récupérer les rendus des étudiants sur jenkins. Très utile lors des TAM.

## Utilisation

```
./download_delivery.sh module projet group student
```
Exemple : 
```
./download_delivery.sh B-MUL-100 myhunter PAR-1-1 nao.marvin
```

Il faut également spécifier dans les variables **JENKINS_USER** et **JENKINS_PASSW** les credentials pour Jenkins.

## Crédits
_Création de Henri Roumegoux_