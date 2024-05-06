age="$1"
    fichier=/home/ryan/exercice_2/fake-users-base.csv

    # Ensuite toutes les informations sont données à partir de l'age correspondante
    awk -F ';' -v awk_var="$age" '$4 == awk_var { print }' fake-users-base.csv