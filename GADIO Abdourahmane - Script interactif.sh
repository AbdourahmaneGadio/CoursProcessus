#!/bin/bash

PS3="Entrez le numéro de la slide -> "

echo "Que voulez vous regarder ?"

select slide in "Généralités" "Les différents états d’un processus" "Cycle de vie d’un processus mémoire vive et virtuelle" "Ses différents états" "Occupation de la mémoire et temps d'exécution" "Filiation" "Les jobs" "Rien" ; do


    if [ -z "$slide" ]; then
	echo "Erreur: entrez un des chiffres proposés." 1>&2
    elif [ "$REPLY" -eq 8 ]; then
	echo "Au revoir!"
	break
    else
	echo "Vous avez fait le choix numéro $REPLY...
"

	sleep 1


		# Choix 1 (Slide 1)
		if [ "$REPLY" -eq 1 ]; then
			echo "
	Un processus est la copie d'un exécutable en mémoire.
	Plusieurs copies d'un même exécutable peuvent
	cohabiter en mémoire mais chaque processus est différents des autres.
	"
			sleep 5
			echo "exemple : "
			sleep 2
			echo ""

			echo "1ère commande : "
			echo "sleep 1000"
			sleep 1000 &
			sleep 2
			echo ""

			echo "2ème commande : "
			echo "sleep 1000"
			sleep 1000 &
			sleep 2
			echo ""

			ps aux | head -1 ; ps aux | grep "sleep 1000"

			sleep 5

			echo "
	Le PID des processus sleep est bien différent
	Un processus est identifié par son PID (Process
	Identificator) qui est unique."

			sleep 5

			pkill -f "sleep 1000"

			echo ""

			echo "Le répertoire /proc contient 1 répertoire 
et environs 60 fichiers par processus. 
Cette filiation dynamique décrit toutes les spécificités de chaque processus."

			sleep 5
			
			echo ""
		
			echo "exemple : "
			sleep 2
			echo ""
			
			echo "sleep 1000"
			sleep 2

			sleep 1000 & pid=$!
			ps -$pid
			sleep 2
			echo ""
			echo "Fichiers du processus sleep 1000 qu'on a utilisé : "
			sleep 5
			ls -l /proc/$pid

			sleep 3

			echo ""
			echo "Ces fichiers, se situent dans /proc/N°duPID"
			echo "Donc : /proc/$pid dans notre cas"

			sleep 3

			kill $pid

		# Choix 2 (Slide 2)
			elif [ "$REPLY" -eq 2 ]; then
			echo "
	Un système multi-tâches est par définition multi-processus. 

	Ceci implique :

	→  que chaque exécution de processus soit divisée
	en plusieurs parties (quantum)

	→  que chaque partie de l’ensemble des processus
	soit exécutée à son tour. Principe du tourniquet
	appelé round-robin

	→  que chaque processus possède un cycle de vie
	constitué entres autres, d’exécutions (running) et
	d’attentes (sleeping)	
	"
			sleep 10

		# Choix 3 (Slide 5)
			elif [ "$REPLY" -eq 3 ]; then
			
			echo "Nous allons lancer une commande zombie.
Nous allons créer un sleep parent de 1 seconde, 
et un sleep enfant de 9 secondes.
Celui-ci sera en exécution, alors que le parent aura fini d'être exécuté."
			sleep 10
			echo ""
			echo "Le nombre de processus zombie est le suivant : 
	"
			( $(sleep 1 & exec /bin/sleep 10) ) &
			sleep 2
			top -n 1 | grep zombie
			sleep 5

		# Choix 4 (Slide 6)
			elif [ "$REPLY" -eq 4 ]; then
			echo "
	Le status d'une tâche peut être une des suivantes:

	D = uninterruptible sleep
	R = running
	S = sleeping
	T = stopped by job control signal
	t = stopped by debugger during trace
	Z = zombie
	"
			sleep 10

			ls -lR /
			while true ; do ps clax | head -1 ; ps clax | grep ls ; sleep 3; done


		# Choix 5 (Slide 7)
			elif [ "$REPLY" -eq 5 ]; then
			echo "
	Observons la place occupée en mémoire, avec la commande
	free -h (-h pour human, permet de voir les données à l'échelle humaine)
	"
			sleep 2
			free -h

			sleep 5

			echo "
	La mémoire virtuelle (swap) est une partie réservée du disque-dur.
	Elle permet le stockage temporaire d’images processus en
	exécution et d’éviter les surchages pouvant mettre le système
	hors d’usage.
	"
			sleep 5

		# Choix 6 (Slide 8)
			elif [ "$REPLY" -eq 6 ]; then
			echo "
	Tout processus est créé par un ascendant déja existant. 
	C'est le processus parent (PPID)
	"
			sleep 5

			ps aux | less
			#pstree

		# Choix 7 (Slide 13)
			else
			echo "
	Les jobs représentent tous les processus affiliés à un shell et 
	par conséquent affiliés à une fenêtre possédant un interpréteur.
	Ces jobs , du point de vue du shell, sont gérables 
	via une liste indicée commençant à 1.
	Du point de vue système, ils restent gérables via leur PID.
	"
			sleep 10
			jobs

		fi
    fi
    echo
done



