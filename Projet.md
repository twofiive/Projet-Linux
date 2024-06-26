# Projet

## Excercice 1

### Question 1

Avant tout dans cette exercice, il faut verifier qu'on se retrouve bien dans son repertoire personnel.

    ~$ pwd

**NOTE :** Si vous n'êtes pas dans votre repertoire personnel utilisez cette commande pour y acceder.

    ~$ cd

Pour créer le répertoire "mail" il faut taper la commande :

    ~$ mkdir mail

### Question 2

Il faut définir les droits du propriétaire

    ~$ chmod 4710 mail

Verifier qu'ils ont bien été attribués

    ~$ ls -l

Création du fichier contact.txt

    ~$ nano contact.txt
    ~$ chmod 700 contact.txt
    ~$ ls -l

Le fichier contact.txt contient les noms des personnes qui peuvent m'envoyer un mail

    prof
    hugoc
    hugoe
    joseph
    bachar
    ismael
    marimoun
    william
    seydina

### Question 3

Il faut modifier les droits attribués au groupe

    ~$ chmod 4710 envoi_message_ryan

### Question 4

Le script verifier_autorisation_destinataire.sh sert à verifier si l'utilisateur qui essaie d'envoyer un mail se trouve dans le fichier contact.txt

```bash
    # Rechercher uniquement le nom de l'utilisateur dans le fichier  
    if  grep -q "$USER" /home/ryan/contact.txt ; then
        exit 0
    else
        exit 1
    fi
```

    ~$ chmod 711 verifier_autorisation_destinataire.sh

### Question 5

Le script dans la question 4 est lancer dans le script envoyer\_\_mail.sh

```bash
    message="$1"

    /home/ryan/verifier_autorisation_destinataire.sh

    # La variable verif récupère le exit du script
    verif=$?

    if [[ $verif == 0 ]]; then
            /home/ryan/envoi_message_ryan   $message
    else
            echo "Vous ne pouvez pas envooyer de mail."
    fi
```

    ~$ chmod 711 envoyer_mail.sh

Création du fichier envoyer_mail.md le README

    ~$ nano envoyer_mail.md
    ~$ chmod 744 envoyer_mail.md

Le fichier envoyer_mail.md contient la procédure pour pouvoir m'envoyer un mail

    ENVOIE DE MAIL

    Pour m'envoyer un mail, suivez ces étapes :

    1. Utiliser le script envoyer_mail.sh.
    2. Passez votre message à la suite du script.
    Example:
    ~$ /home/ryan/envoyer_mail.sh " hi, wassup? "

    Pour vous simplifiez la tache

    Utilisez _envoyer_mail.sh "Votre message"_
    Vous replacez votre message par ce que vous souhaitez envoyer.

## Exercice 2

### Question 1

    ~$ cp /usr/local/share/file/fake-users-base.csv exercice_2

### Question 2

    ~$ head -n 1 exercice_2/fake-users-base.csv

    ID;prenom;nom;age;sexe;email;Téléphone

### Question 3

    ~/exercice_2$ nano resume.sh

```bash
    fichier=/home/ryan/exercice_2/fake-users-base.csv
    
    # J'affiche l'index et le nom de chaque colonne en les séparant par un '-' et le -F est utilisé pour signigié que le séparateur dans le fichier est ';'
    awk -F ';' 'NR==1 {for (i=0; i<=NF; i++){ print i" - "$i} }' $fichier
```

    ~/exercice_2$ chmod +x resume.sh

### Question 4

    ~/exercice_2$ nano tri_age.sh

```bash
    fichier=/home/ryan/exercice_2/fake-users-base.csv

    # Ensuite toutes les informations sont trier à partir des ages en ordre croissante
    awk -F ';' 'NR==1 { print } NR>1 { print $4"="$0 }' $fichier | sort -n | cut -d '=' -f 2
```

    ~/exercice_2$ chmod +x tri_age.sh

### Question 5

    ~/exercice_2$ nano remplacer.sh

```bash
        fichier=/home/ryan/exercice_2/fake-users-base.csv
    sed -i 's/Male/H/gI' $fichier
    sed -i 's/Female/F/gI' $fichier
```

    ~/exercice_2$ chmod +x remplacer.sh

### Question 6

    ~/exercice_2$ nano unif_tel.sh
```bash
#    sed est utilisé pour directement mettre les numéros sous un même format
    fichier=/home/ryan/exercice_2/fake-users-base.csv
    sed -i 's/+33/0/g' $fichier
    sed -i 's/ /./g' $fichier
```
    ~/exercice_2$ chmod +x unif_tel.sh

### Question 7
    ~/exercice_2$ nano stats_email.sh
```bash
  awk -F ';' 'NR>1 { gsub(/.*@/, "", $6); print $6 }' fake-users-base.csv | sort | uniq -c | sort
```

    ~/exercice_2$ chmod +x stats_email.sh

### Question 8

    ~/exercice_2$ nano promotion_mail.sh
```bash
    #!/bin/bash
    fichier=/home/ryan/exercice_2/fake-users-base.csv
    sujet="Promotion mail"
    
    awk -F ';' '$4 >= 20 && $4 <= 30  {print $2";"$3";"$6}' $fichier > utilisateur_mail.csv
    
    mail.csv=/home/ryan/exercice_2/utilisateur_mail.csv
    
    while IFS=';' read -r prenom nom mail;
    do
            echo "Bonjour $prenom $nom, il y a une promotion qui concerne les personnes agées entre 20 a 30 ans" | mail -s $sujet $mail
    done < $mail.csv 
```
    ~/exercice_2$ chmod +x promotion_mail.sh

### Question 9

    

## Exercice 3

Un moyen d'obfusquer tous les mots de passes qui se trouvent dans les logs est de produit un hashage pour chacun d'eux en utilisant une commande (déjà installé ou à installer ) et stocker le résulats dans un fichier pour qu'il soit le moins visible possible.
Tout en sachant qu'il ne sera pas possible par la suite d'inverser le hashage pour revenir au mot de passe initial.

Ou encore on peut le faire en utilisant des fonctions et bibliotèques particulières dans des différents langages de programmation.
Tel que bcrypt en Python, et crypt() en C... 