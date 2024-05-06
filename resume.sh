    
read -p "Saisissez l'ID: " id


# J'affiche la colonne ID et la colonne nom, en les séparant par un '-' et le -F est utilisé pour signigié que le séparateur dans le fichier est ';'
awk -F ';' -v awk_var="$id" '$1 == awk_var {print $1" - "$3}' fake-users-base.csv