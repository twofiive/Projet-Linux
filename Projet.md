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

    ~$ chmod 4711 mail

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

    ~$ chmod 4711 envoi_message_ryan

### Question 4

Le script verifier_autorisation_destinataire.sh sert à verifier si l'utilisateur qui essaie d'envoyer un mail se trouve dans le fichier contact.txt

```bash
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

    # ENVOIE DE MAIL

    Pour m'envoyer un mail, suivez ces étapes :

    1. Utiliser le script **envoyer_mail.sh**.
    2. Passez votre message à la suite du script.
    **Example:**
    > /home/ryan/envoyer_mail.sh " hi, wassup? "

    ### Pour vous simplifiez la tache

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
        #!/bin/bash

        awk -F ';' '{print $1" - "$3}' /home/ryan/exercice_2/fake-users-base.csv
```

    ~/exercice_2$ chmod +x resume.sh
    ~/exercice_2$ ./resume.sh

### Question 4

    nano tri_age.sh

```bash
    age="$1"
    fichier=/home/ryan/exercice_2/fake-users-base.csv
    awk -F ';' -v awk_var="$age" '$4 ~ awk_var { print }' $fichier

```

    chmod +x tri_age.sh

### Question 5

    nano remplacer.sh

```bash
    sed -i 's/Male/H/gI' ./fake-users-base.csv
    sed -i 's/Female/F/gI' ./fake-users-base.csv
```

    chmod +x remplacer.sh

### Question 6

    nano unif_tel.sh
```bash
    fichier=./fake-users-base.csv
    sed -i 's/+33/0/g' $fichier
```
    chmod +x unif_tel.sh
