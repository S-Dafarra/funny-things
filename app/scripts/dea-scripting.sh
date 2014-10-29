#!/bin/bash
#######################################################################################
# FLATWOKEN ICON THEME CONFIGURATION SCRIPT
# Copyright: (C) 2014 FlatWoken icons
# Author:  Alessandro Roncone
# email:   alecive87@gmail.com
# Permission is granted to copy, distribute, and/or modify this program
# under the terms of the GNU General Public License, version 2 or any
# later version published by the Free Software Foundation.
#  *
# A copy of the license can be found at
# http://www.robotcub.org/icub/license/gpl.txt
#  *
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
# Public License for more details
#######################################################################################


#######################################################################################
# USEFUL FUNCTIONS:                                                                  #
#######################################################################################
usage() {
cat << EOF
***************************************************************************************
DEA SCRIPTING
Author:  Alessandro Roncone   <alessandro.roncone@iit.it> 

This script scripts through the commands available for the DeA Kids videos.

USAGE:
        $0 options

***************************************************************************************
OPTIONS:

***************************************************************************************
EXAMPLE USAGE:

***************************************************************************************
EOF
}

#######################################################################################
# FUNCTIONS:                                                                         #
#######################################################################################
speak() {
    echo "\"$1\"" | yarp write ... /iSpeak
}

blink() {
    echo "blink" | yarp rpc /iCubBlinker/rpc
    sleep 0.5
}

breathers() {
    # echo "$1"  | yarp rpc /iCubBlinker/rpc
    echo "$1" | yarp rpc /iCubBreatherH/rpc:i
    echo "$1" | yarp rpc /iCubBreatherRA/rpc:i
    sleep 0.4
    echo "$1" | yarp rpc /iCubBreatherLA/rpc:i
}

stop_breathers() {
    breathers "stop"
}

start_breathers() {
    breathers "start"
}

go_home_helper() {
    # This is with the arms close to the legs
    # echo "ctpq time $1 off 0 pos (-6.0 23.0 25.0 29.0 -24.0 -3.0 -3.0 19.0 29.0 8.0 30.0 32.0 42.0 50.0 50.0 114.0)" | yarp rpc /ctpservice/right_arm/rpc
    # echo "ctpq time $1 off 0 pos (-6.0 23.0 25.0 29.0 -24.0 -3.0 -3.0 19.0 29.0 8.0 30.0 32.0 42.0 50.0 50.0 114.0)" | yarp rpc /ctpservice/left_arm/rpc
    # This is with the arms over the table
    echo "ctpq time $1 off 0 pos (-30.0 36.0 0.0 60.0 0.0 0.0 0.0 19.0 29.0 8.0 30.0 32.0 42.0 50.0 50.0 114.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time $1 off 0 pos (-30.0 36.0 0.0 60.0 0.0 0.0 0.0 19.0 29.0 8.0 30.0 32.0 42.0 50.0 50.0 114.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 1.0 off 0 pos (0.0 0.0 10.0 0.0 0.0 5.0)" | yarp rpc /ctpservice/head/rpc
    sleep $1
    sleep 0.5
}

go_home() {
    breathers "stop"
    go_home_helper 2.0
    breathers "start"
}

greet_with_right_thumb_up() {
    breathers "stop"
    echo "ctpq time 1.0 off 0 pos (-44.0 36.0 54.0 91.0 -45.0 0.0 12.0 21.0 14.0 0.0 0.0 59.0 140.0 80.0 125.0 210.0)" | yarp rpc /ctpservice/right_arm/rpc
    sleep 1.5 && smile && sleep 1.5
    go_home_helper 1.5
    breathers "start"
}

greet_like_god() {
    breathers "stop"
    echo "ctpq time 1.5 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0 20.0 29.0 3.0 11.0 3.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 1.5 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0 20.0 29.0 3.0 11.0 3.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    sleep 1.0
    echo "ctpq time 0.7 off 0 pos (-70.0 50.0 -30.0 80.0 40.0 -5.0 10.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 0.7 off 0 pos (-70.0 50.0 -30.0 80.0 40.0 -5.0 10.0)" | yarp rpc /ctpservice/left_arm/rpc
    speak "Buongiorno capo!"
    echo "ctpq time 0.7 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 0.7 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0)" | yarp rpc /ctpservice/left_arm/rpc

    # echo "ctpq time 0.7 off 0 pos (-70.0 50.0 -30.0 80.0 40.0 -5.0 10.0)" | yarp rpc /ctpservice/right_arm/rpc
    # echo "ctpq time 0.7 off 0 pos (-70.0 50.0 -30.0 80.0 40.0 -5.0 10.0)" | yarp rpc /ctpservice/left_arm/rpc

    # echo "ctpq time 0.7 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0)" | yarp rpc /ctpservice/right_arm/rpc
    # echo "ctpq time 0.7 off 0 pos (-70.0 40.0 -7.0 100.0 60.0 -20.0 2.0)" | yarp rpc /ctpservice/left_arm/rpc
    sleep 1.5 && smile

    go_home_helper 2.0
}

hold_pennello() {
    echo "TODO"
}

smolla_pennello() {
    echo "TODO"
}

grasp_apple() {
    echo "grasp_apple TODO"
}

release_apple() {
    echo "release_apple TODO"
}

mostra_muscoli() {
    breathers "stop"
    echo "ctpq time 1.5 off 0 pos (-27.0 78.0 -37.0 33.0 -79.0 0.0 -4.0 26.0 27.0 0.0 29.0 59.0 117.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 1.5 off 0 pos (-27.0 78.0 -37.0 33.0 -79.0 0.0 -4.0 26.0 27.0 0.0 29.0 59.0 117.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 1.0 off 0 pos (-27.0 78.0 -37.0 93.0 -79.0 0.0 -4.0 26.0 67.0 0.0 99.0 59.0 117.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 1.0 off 0 pos (-27.0 78.0 -37.0 93.0 -79.0 0.0 -4.0 26.0 67.0 0.0 99.0 59.0 117.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/left_arm/rpc
    speak "Dei supereroi"
    sleep 3.0
    smile
    go_home_helper 2.0
    breathers "start"
}

graspa_volante() {
    echo "TODO"
}

smolla_volante() {
    echo "TODO"
}

graspa_pallina() {
    breathers "stop"
    echo "ctpq time 2.0 off 0 pos (-38.0 25.0 25.0 45.0 59.0 -11.0 -20.0 30.0 28.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 0.75 off 0 pos (-30.0 0.0 -15.0 -10.0 0.0 10.0)" | yarp rpc /ctpservice/head/rpc
    sleep 2.5
    echo "ctpq time 1.5 off 0 pos (-38.0 25.0 25.0 45.0 59.0 -11.0 -20.0 30.0 60.0 0.0 79.0 30.0 60.0 30.0 70.0 215.0)" | yarp rpc /ctpservice/right_arm/rpc
    sleep 1.5
    echo "ctpq time 1.5 off 0 pos (-38.0 48.0 7.0 71.0 -11.0 0.0  2.0 30.0 60.0 0.0 79.0 30.0 60.0 30.0 70.0 215.0)" | yarp rpc /ctpservice/right_arm/rpc
    echo "ctpq time 1.5 off 0 pos (-20.0 0.0 -25.0 -10.0 10.0 10.0)" | yarp rpc /ctpservice/head/rpc
    sleep 2.0
    echo "ctpq time 1.0 off 0 pos (0.0 0.0 0.0 0.0 0.0 5.0)" | yarp rpc /ctpservice/head/rpc
}

smolla_pallina() {
    echo "ctpq time 1.5 off 0 pos (-38.0 25.0 25.0 45.0 59.0 -11.0 -20.0 30.0 60.0 0.0 79.0 30.0 60.0 30.0 70.0 215.0)" | yarp rpc /ctpservice/right_arm/rpc
    sleep 1.5
    echo "ctpq time 1.5 off 0 pos (-38.0 25.0 25.0 45.0 59.0 -11.0 -20.0 30.0 28.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/right_arm/rpc
    go_home_helper 2.0
    breathers "start"
}

passa_e_chiudi() {
    speak "aicab passa e chiude."
    sleep 2.0 && blink
}

buongiorno_capo() {
    speak "Buongiorno? capo!"
    sleep 1.0 # && blink
    sleep 0.5 && smile
}

smile() {
    echo "set all hap" | yarp rpc /icub/face/emotions/in
}

surprised() {
    echo "set mou sur" | yarp rpc /icub/face/emotions/in
    echo "set leb sur" | yarp rpc /icub/face/emotions/in
    echo "set reb sur" | yarp rpc /icub/face/emotions/in
}

ciao() {
    speak "Ciao! Mi chiamo aicab."
}

vai_nello_spazio() {
    breathers "stop"
    echo "ctpq time 1.5 off 0 pos (-42.0 36.0 -12.0 101.0 -5.0 -5.0 -4.0 17.0 57.0 87.0 140.0 0.0 0.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/right_arm/rpc
    sleep 2.0
    smile
    go_home
}

meteo_bot() {
    breathers "stop"
    echo "ctpq time 1.5 off 0 pos (-55.0 49.0 -4.0 77.0 73.0   0.0 15.0 21.0 40.0 30.0 91.0 5.0 35.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 1.0 off 0 pos (0.0 0.0 30.0 0.0 -10.0 10.0)" | yarp rpc /ctpservice/head/rpc
    sleep 2.0
    echo "ctpq time 0.8 off 0 pos (-70.0 47.0 -3.0 55.0 81.0 -11.0  5.0 21.0 40.0 30.0 91.0 5.0 35.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 1.0 off 0 pos (0.0 0.0 30.0 0.0 -10.0 5.0)" | yarp rpc /ctpservice/head/rpc
    echo "ctpq time 0.8 off 0 pos (-55.0 49.0 -4.0 77.0 73.0   0.0 15.0 21.0 40.0 30.0 91.0 5.0 35.0 87.0 176.0 250.0)" | yarp rpc /ctpservice/left_arm/rpc
    sleep 1.0 && blink
    smile
    echo "ctpq time 1.0 off 0 pos (0.0 0.0 0.0 0.0 0.0 5.0)" | yarp rpc /ctpservice/head/rpc
    blink
    go_home
}

saluta() {
    breathers "stop"
    echo "ctpq time 1.5 off 0 pos (-60.0 44.0 -2.0 96.0 53.0 -17.0 -11.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    sleep 2.0 && speak "Salve colleghi."
    echo "ctpq time 0.5 off 0 pos (-60.0 44.0 -2.0 96.0 53.0 -17.0  25.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 0.5 off 0 pos (-60.0 44.0 -2.0 96.0 53.0 -17.0 -11.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 0.5 off 0 pos (-60.0 44.0 -2.0 96.0 53.0 -17.0  25.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    echo "ctpq time 0.5 off 0 pos (-60.0 44.0 -2.0 96.0 53.0 -17.0 -11.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0)" | yarp rpc /ctpservice/left_arm/rpc
    smile
    go_home
    smile
}

closing_remarks() {
    meteo_bot
    speak "Da aicab e' tutto. Fascicolo $1 terminato."
    sleep 1.5 && blink
    sleep 3.0 && blink && smile
    speak "In bocca al lupo meikers"
    smile
    greet_with_right_thumb_up   
    smile
}

#######################################################################################
# RUBRICA  1:                                                                         #
#######################################################################################
    rubrica1_1() {
        greet_like_god
        speak "Oggi, aicab e' andato a caccia di novita' sulle quattro ruote."
        sleep 2.0 # && blink
    }

    rubrica1_2() {
        speak "Capo, ci pensi?"
        sleep 2.0 # && blink
        smile     && sleep 1.0
        speak "E' stata usata una stampante 3D, proprio come quelle del laboratorio degli X meikers!"
        sleep 7.0 # && blink 
        speak " Solo, Un po' piu' grande."
        sleep 3.0 && smile # && blink
    }

    rubrica1_3() {
        graspa_volante
        speak "Cosi', anche chi guida potra' schiacciare un pisolino durante il viaggio."
        sleep 4.0
        smolla_volante
        speak "Per oggi dal dipartimento ricerca e' tutto."
        sleep 2.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  2:                                                                         #
#######################################################################################
    rubrica2_1() {
        greet_like_god
        speak "Oggi, aicab ha fatto un corso accelerato di cucina"
        sleep 4.0 # && blink
        speak "per saperne di piu' su quello che voi chiamate cibo."
        sleep 4.0 # && blink
        speak "Preparatevi a restare a bocca aperta!"
        sleep 2.0 # && blink
        sleep 1.0 && surprised
        sleep 2.0 && smile
    }

    rubrica2_2() {
        speak "aicab ha sentito dire che voi umani andate matti per questa cioccolata..."
        sleep 4.0 # && blink
        sleep 1.5 && smile
    }

    rubrica2_3() {
        grasp_apple
        speak "Pensa capo, un giorno questa mela potrebbe avere il gusto di ba na na!"
        sleep 2.0
        speak "Anche per oggi, dal reparto Ricerca e Innovazione e' tutto."
        sleep 6.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  3:                                                                         #
#######################################################################################
    rubrica3_1() {
        greet_like_god
        speak "Oggi, aicab ha scovato delle novita' che nel giro di qualche anno renderanno voi umani"
        sleep 3.0 # && blink
        mostra_muscoli
    }

    rubrica3_2() {
        speak "E ora Capo. il potere che tutti vorrebbero."
        sleep 4.0 && blink
        speak "La telecinesi. La capacita' di controllare gli oggetti con la mente."
        sleep 2.0 && blink
    }

    rubrica3_3() {
        speak "Certo che a quel punto, perdersi tra i pensieri potrebbe diventare un problema."
        sleep 6.0 # && blink
        speak "Anche per oggi, dal reparto Ricerca e Innovazione e' tutto."
        sleep 4.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  4:                                                                         #
#######################################################################################
    rubrica4_1() {
        greet_like_god
        speak "Oggi, aicab e' andato a caccia di primati robotici!"
        sleep 2.0 # && blink
        breathers "start"
    }

    rubrica4_2() {
        speak "Peraltro, non e' il solo ad aver battuto ogni record. Vi presento altri due fuoriclasse."
        sleep 1.0 && blink
    }

    rubrica4_3() {
        speak "Anche per questa volta e' tutto."
        sleep 3.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  5:                                                                         #
#######################################################################################
    rubrica5_1() {
        greet_like_god
        speak "Oggi aicab vi presentera' alcuni colleghi robotici che hanno delle doti da veri artisti."
        sleep 2.0 # && blink
        breathers "start"
    }

    rubrica5_2() {
        speak "Strepitosi. Ma ora si cambia disciplina."
        sleep 1.5 && blink
    }

    rubrica5_3() {
        speak "aicab e' gia' innamorato."
        sleep 3.0
        smile && sleep 1.0
        speak "Anche per questa volta e' tutto? capo."
        sleep 3.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  6:                                                                         #
#######################################################################################
    rubrica6_1() {
        greet_like_god
        speak "Oggi, aicab vi portera' alla scoperta delle citta' del futuro."
        sleep 2.0 # && blink
        breathers "start"
    }

    rubrica6_2() {
        speak "Ed ora un'innovazione che e' gia' diventata realta'."
        sleep 4.0 # && blink
    }

    rubrica6_3() {
        speak "Anche per questa volta e' tutto? capo."
        sleep 3.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  7:                                                                         #
#######################################################################################
    rubrica7_1() {
        greet_like_god
        speak "Oggi, aicab ha preparato un fascicolo sulle innovazioni nel mondo dello sport."
        sleep 2.0 # && blink
        breathers "start"
    }

    rubrica7_2() {
        graspa_pallina
        speak "Lo scopo e' correggere gli errori e migliorare. partita dopo partita."
        sleep 4.0 # && blink
        smolla_pallina
        speak "Per finire, aicab vuole presentarvi alcuni amici."
    }

    rubrica7_3() {
        speak "Capo, anche per oggi e' tutto."
        sleep 3.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  8:                                                                         #
#######################################################################################
    rubrica8_1() {
        greet_like_god
        speak "Oggi, aicab ha analizzato a fondo alcuni problemi di voi umani. e ha scoperto ottime soluzioni tecnologiche. Un esempio? Come riparare oggetti rotti ed evitare sprechi."
        sleep 1.0 && blink
        breathers "start"
        sleep 4.0 && blink
        sleep 4.0 && blink
    }

    rubrica8_2() {
        speak "Capo. c'e' un'altra cosa che aicab ha scoperto, studiando le abitudini di voi umani."
        sleep 6.0 # && blink
        speak "C'e' un passatempo che accomuna generazioni e generazioni di studenti. Gli aereoplanini di carta."
        sleep 6.0 # && blink
        speak "Beh, ci sono buone novita'"
    }

    rubrica8_3() {
        speak "Dal reparto ricerca e innovazione, e' tutto."
        sleep 3.0 && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA  9:                                                                         #
#######################################################################################
    rubrica9_1() {
        greet_like_god
        speak "Oggi, aicab vi dimostrera' che arte e tecnologia non sono due mondi poi cosi' distanti."
        sleep 1.0 && blink
        breathers "start"
    }

    rubrica9_2() {
        speak "Come un vero artista? Anche i- deevid firma le sue opere."
        sleep 2.0 && blink
        sleep 2.0 && blink
        speak "Per finire, una curiosita' sull'arte della parola"
        sleep 1.0 && blink
        sleep 2.0 && smile
    }

    rubrica9_3() {
        speak "Anche per oggi e' tutto."
        sleep 2.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# RUBRICA 10:                                                                         #
#######################################################################################
    rubrica10_1() {
        greet_like_god
        speak "Oggi, aicab vi porta nello spazio."
        sleep 1.0 && blink
        vai_nello_spazio
    }

    rubrica10_2() {
        speak "Ed ora? arriva il bello. Capo? hai mai pensato di fare le vacanze nello spazio?"
        sleep 2.0 && blink
        sleep 3.0 && blink
        speak "In America esistono diversi progetti di turismo spaziale."
        sleep 4.0 && blink
    }

    rubrica10_3() {
        speak "Dal reparto ricerca e innovazione, e' tutto."
        sleep 3.0 # && blink
        passa_e_chiudi
        greet_with_right_thumb_up
    }

#######################################################################################
# PUNTATA  1:                                                                         #
#######################################################################################
    puntata1_1() {
        saluta
        speak "aicab ha svolto una ricerca in rete. e ha intervistato centinaia di ragazzi per capire cosa desiderino e quali siano i loro problemi con i monopattini."
        sleep 3.0 && blink
        sleep 4.0 && blink
        sleep 2.5 && blink
        speak "Ecco i risultati."
        meteo_bot
    }

    puntata1_234() {

        speak "Il 40 percento dei ragazzi vorrebbe avere un monopattino speciale diverso da tutti gli altri. Quasi tutti vorrebbero che raccontasse qualcosa di loro."
        sleep 7.0 && blink
        sleep 5.0 && blink

        speak "l 70% dei ragazzi ha rilevato, nei normali monopattini"

        (I CUB INCLINA LA TESTA DA UN LATO E TORNA IN POSIZIONE)
        
        speak "un grosso difetto: utilizzarli a lungo è molto faticoso. aicab non conosce la fatica"

        (I CUB FA CENNO DI NO CON IL CAPO)
        
        "ma ha capito che non è una cosa bella."

        (ICUB CON ESPRESSIONE TRISTE)
    }

    puntata1_c() {
        closing_remarks "02 X 2 3"
    }

#######################################################################################
# PUNTATA  2:                                                                         #
#######################################################################################
    puntata2_1() {
        saluta
        speak "aicab ha chiesto a tutti i suoi amici sui social network d'immaginare come saranno i vestiti del futuro. E ha raccolto molti dati interessanti:"
        sleep 3.0 && blink
        sleep 4.0 && blink
        sleep 2.5 && blink
        speak "Ecco i risultati."
        meteo_bot
    }

    puntata2_c() {
        closing_remarks "0 3 FT2"  
    }

#######################################################################################
# PUNTATA  3:                                                                         #
#######################################################################################
    puntata3_1() {
        saluta
        speak "aicab ha svolto una ricerca molto approfondita sulle macchine telecomandate; e ha scoperto alcuni punti deboli che possono essere migliorati."
        sleep 3.0 && blink
        sleep 3.0 && blink
        sleep 1.0 && blink
        speak "Ecco i risultati."
        meteo_bot
    }

    puntata3_c() {
        closing_remarks "3 6 Tielle 2 4"
    }

#######################################################################################
# PUNTATA  4:                                                                         #
#######################################################################################
    puntata4_1() {
        saluta
        speak "aicab ha svolto un'indagine molto approfondita tra i ragazzi; e ha scoperto che la maggior parte di loro ha un televisore in cameretta. I vostri sforzi devono concentrarsi li'."
        sleep 3.0 && blink
        sleep 3.0 && blink
        sleep 2.5 && blink
        meteo_bot
    }

    puntata4_c() {
        closing_remarks "0 5 ics 1 2"  
    }

#######################################################################################
# PUNTATA  5:                                                                         #
#######################################################################################
    puntata5_1() {
        saluta
        speak "aicab ha confrontato migliaia di data beisz, e analizzato milioni di interviste. I dati? indicano che nei tablet ci sono ancora diverse cose che possono essere migliorate."
        sleep 3.0 && blink
        sleep 4.0 && blink
        sleep 3.0 && blink
        meteo_bot
    }

    puntata5_c() {
        closing_remarks "1 9 t 6 2"
    }

#######################################################################################
# PUNTATA  6:                                                                         #
#######################################################################################
    puntata6_1() {
        saluta
        speak "aicab ha svolto; la sua ricerca in rete? e ha intervistato migliaia di bambini, per la precisione 8306? per capire come debba essere la bicicletta ideale. Ecco i risultati."
        sleep 3.0 && blink
        sleep 4.0 && blink
        sleep 5.5 && blink
        meteo_bot
    }

    puntata6_c() {
        closing_remarks "0 4 y 5 4"  
    }

#######################################################################################
# PUNTATA  7:                                                                         #
#######################################################################################
    puntata7_1() {
        saluta
        speak "aicab ha raccolto milioni di Tera di dati? riguardo all'oggetto zzaino. E' uno degli oggetti piu' utilizzati dai ragazzi di tutto il mondo, e per molti e' come una seconda pelle."
        sleep 3.0 && blink
        sleep 4.0 && blink
        sleep 3.5 && blink
        meteo_bot
    }

    puntata7_c() {
        closing_remarks "s 3 uno t 4"
    }

#######################################################################################
# PUNTATA  8:                                                                         #
#######################################################################################
    puntata8_1() {
        saluta
        speak "aicab ha raccolto migliaia di tera baait di dati? e ha analizzato miliardi di siti specializzati per aiutarvi nella vostra missione."
        sleep 3.0 && blink
        sleep 3.5 && blink
        sleep 1.5 && blink
        meteo_bot
    }

    puntata8_c() {
        closing_remarks "r 3 b 7 2"
    }

#######################################################################################
# PUNTATA  9:                                                                         #
#######################################################################################
    puntata9_1() {
        saluta
        speak "aicab ha svolto una ricerca in rete? e ha intervistato centinaia di ragazzi, per capire cosa vogliono veramente da una sveglia."
        sleep 3.0 && blink
        sleep 3.5 && blink
        sleep 1.5 && blink
        speak "Ecco i risultati."
        meteo_bot
    }

    puntata9_c() {
        closing_remarks "0 5 xp2 3"
    }

#######################################################################################
# PUNTATA 10:                                                                         #
#######################################################################################
    puntata10_1() {
        saluta
        speak "aicab ha trovato molte lamentele sui siti e sui forum dei campeggiatori. A quanto pare, nelle tende piu' comuni ci sono molti difetti da migliorare."
        sleep 3.0 && blink
        sleep 3.5 && blink
        sleep 1.5 && blink
        meteo_bot
    }

    puntata10_c() {
        closing_remarks "r 3 t 9"
    }

#######################################################################################
# CUSTOM KAMMO
#######################################################################################
    gesto_kammo() {
        go_home
        #saluta
        #speak "aicab ha svolto una ricerca in rete. e ha intervistato centinaia di ragazzi per capire cosa desiderino e quali siano i loro problemi con i monopattini."
        #sleep 3.0 && blink
        #sleep 4.0 && blink
        #sleep 2.5 && blink
        speak "Ecco i risultati."
        meteo_bot
    }

#######################################################################################
# "MAIN" FUNCTION:                                                                #
#######################################################################################
echo "********************************************************************************"
echo ""

$1 "$2"

if [[ $# -eq 0 ]] ; then 
    echo "No options were passed!"
    echo ""
    usage
    exit 1
fi


