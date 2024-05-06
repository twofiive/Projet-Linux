#!/bin/bash

fichier=./fake-users-base.csv

stat_fr=$(grep -i '.fr;' $fichier | wc -l)
stat_com=$(grep -i '.com;' $fichier | wc -l)
stat_edu=$(grep -i '.edu;' $fichier | wc -l)

emails=("fr" "com" "edu" "Quitter")
PS3="Faites votre choix : "
les_adresses="gmail aol outlook hotmail yahoo icloud proton"
echo "Listes des extensions: "
select mail in "${emails[@]}"
do 
	case $mail in 
		"fr")
			echo "Il y a $stat_fr adresss mail en .fr sur 1000."
			read -p "Quel domain recherchez vous ? " adress
			adrss_mini=$(echo "$adress" | tr '[:upper:]' '[:lower:]')
			if [[ ! "$les_adresses" =~ "$adrss_mini" ]]; then
				echo "Choisissez parmi (gmail,outlook,protonmail,icloud,yahoo,aol,hotmail) en miniscule."
			else
				stat=$(egrep -i "\\b${adrss_mini}\\.${mail};\\b" "$fichier" | wc -l)
				echo "Il y a ${stat} adressses mail avec ${adrss_mini} en (.${mail})."
			fi
			;;
		"com")
			echo "Il y a $stat_com adresss mail en .com sur 1000."
			read -p "Quel domain recherchez vous ? " adress
			adrss_mini_mini=$(echo "$adress" | tr '[:upper:]' '[:lower:]')
			if [[ ! "$les_adresses" =~ "$adrss_mini" ]]; then
				echo "Choisissez parmi (gmail,outlook,protonmail,icloud,yahoo,aol,hotmail) en miniscule."
			else
				stat=$(egrep -i "\\b${adrss_mini}\\.${mail};\\b" "$fichier" | wc -l)
				echo "Il y a ${stat} adressses mail avec ${adrss_mini} en (.${mail})."
			fi
			;;
		"edu")
			echo "Il y a $stat_edu adresss mail en .edu sur 1000."
			read -p "Quel domain recherchez vous ? " adress
			adrss_mini_mini=$(echo "$adress" | tr '[:upper:]' '[:lower:]')
			if [[ ! "$les_adresses" =~ "$adrss_mini" ]]; then
				echo "Choisissez parmi (gmail,outlook,protonmail,icloud,yahoo,aol,hotmail) en miniscule."
			else
				stat=$(egrep -i "\\b${adrss_mini}\\.${mail};\\b" "$fichier" | wc -l)
				echo "Il y a ${stat} adressses mail avec ${adrss_mini} en (.${mail})."
			fi
			;;
		"Quitter")
			echo "A la prochaine."
			break
			;;
		*)
			echo "Choix invalide. Réessayer !"
			;;
	esac
done