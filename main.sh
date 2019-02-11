#!/bin/bash
# we are using port 6000 listening and sending respectively
PORT=6000
declare -A dictionary=(["actually"]=1	["again"]=2	["all"]=3	["aloevera"]=4	["alone"]=5	["always"]=6	["am"]=7	["and"]=8	["apple"]=9	["are"]=10	["ask"]=11	["asus"]=12	["atom"]=13	["back"]=14	["bad"]=15	["banana"]=16	["bar"]=17	["bend"]=18	["blend"]=19	["blooded"]=20	["boy"]=21	["brb"]=22	["breaker"]=23	["brnach"]=24	["bups"]=25	["bus"]=26	["but"]=27	["call"]=28	["car"]=29	["careless"]=30 ["cat"]=31	["chem"]=32	["chest"]=33	["circle"]=34	["code"]=35	["cold"]=36	["come"]=37	["commit"]=38	["compiles"]=39	["complete"]=40["computer"]=41	["control"]=42	["copy"]=43	["count"]=44	["cow"]=45	["crawl"]=46	["cringe"]=47	["cs"]=48	["csc"]=49	["cu"]=50	["cup"]=51	["cut"]=52	["data"]=53	["deal"]=54	["delete"]=55	["delhi"]=56	["dell"]=57	["desk"]=58	["dictionary"]=59	["difficult"]=60	["ding"]=61	["do"]=62	["docs"]=63	["does"]=64	["dog"]=65	["done"]=66	["dont"]=67	["dub"]=68	["easy"]=69	["eight"]=70	["election"]=71	["end"]=72	["face"]=73	["fat"]=74	["find"]=75	["five"]=76	["four"]=77	["fox"]=78	["friend"]=79	["get"]=80	["girl"]=81	["glass"]=82	["go"]=83	["going"]=84	["good"]=85	["gout"]=86	["grand"]=87	["granpa"]=88	["great"]=89	["green"]=90	["had"]=91	["hair"]=92	["halt"]=93	["harm"]=94	["have"]=95	["hcl"]=96	["he"]=97	["heads"]=98	["heavy"]=99	["height"]=100	["hen"]=101	["here"]=102	["hole"]=103	["home"]=104	["hopeless"]=105	["hostel"]=106	["house"]=107	["how"]=108	["huh"]=109	["hurt"]=110	["i"]=111	["idk"]=112	["iit"]=113	["im"]=114	["in"]=115	["is"]=116	["its"]=117	["js"]=118	["just"]=119	["kitkat"]=120	["know"]=121	["laptop"]=122	["leaves"]=123	["lets"]=124	["like"]=125	["lily"]=126	["lol"]=127	["long"]=128	["love"]=129	["lovely"]=130	["lubba"]=131	["mac"]=132	["maker"]=133	["man"]=134	["me"]=135	["meet"]=136	["mess"]=137	["mistakes"]=138	["morty"]=139	["mouse"]=140	["mouth"]=141	["move"]=142	["msi"]=143	["my"]=144	["naah"]=145	["need"]=146	["netcat"]=147	["never"]=148	["nine"]=149	["no"]=150	["nobody"]=151	["node"]=152	["not"]=153	["now"]=154	["of"]=155	["oh"]=156	["one"]=157	["onep"]=158	["onetyone"]=159	["ooh"]=160	["orange"]=161	["out"]=162	["pain"]=163	["paste"]=164	["patty"]=165	["pc"]=166	["peepee"]=167	["pie"]=168	["plate"]=169	["please"]=170	["politics"]=171	["pot"]=172	["ppt"]=173	["pretty"]=174	["put"]=175	["questions"]=176	["receive"]=177["red"]=178	["rest"]=179	["rice"]=180	["rick"]=181	["right"]=182	["room"]=183	["root"]=184	["rose"]=185	["safe"]=186	["said"]=187	["screen"]=188	["secrets"]=189	["send"]=190	["set"]=191	["seven"]=192	["she"]=193	["shit"]=194	["shoot"]=195	["short"]=196	["shot"]=197	["should"]=198	["shouldnt"]=199	["shout"]=200	["six"]=201	["slice"]=202	["sling"]=203	["some"]=204	["somethig"]=205	["sorry"]=206	["soul"]=207	["spend"]=208	["start"]=209	["stealer"]=210	["stop"]=211	["table"]=212	["tails"]=213	["tall"]=214	["tea"]=215	["tell"]=216	["that"]=217	["the"]=218	["their"]=219	["there"]=220	["they"]=221	["this"]=222	["three"]=223	["threetythree"]=224	["through"]=225	["to"]=226	["toilet"]=227	["toits"]=228	["tough"]=229	["transfer"]=230	["tree"]=231	["truth"]=232	["two"]=233	["twotytwo"]=234	["understand"]=235	["until"]=236	["up"]=237	["useless"]=238	["we"]=239	["when"]=240	["where"]=241	["which"]=242	["who"]=243	["whom"]=244	["why"]=245	["with"]=246	["woah"]=247	["woman"]=248	["wont"]=249	["wow"]=250	["wrot"]=251	["wubba"]=252	["ya"]=253	["yellow"]=254	["you"]=255	["your"]=0)


ip=$(ifconfig | grep Bcast | cut -f2 -d':' | cut -f1 -d' ')
if [[ $(echo $ip | cut -f1 -d'.') -eq 10 ]]; then
  echo "Welcome to file transfer"

  # Process files till user wants
  while [[ true ]]; do
    read -r -p "Do You want to [r]eceive/[s]end a file or [e]xit?[r/s/e]:" response

    # SEND PROTOCOL
    if [[ "$response" =~ ^([sS]|[sS][eE][nN][dD])$ ]]
    then
      i=0
      while [[ $i -lt 4 ]]; do
      targetip="10";
      read -r -p "Enter the code from receiver: " enkey
      # verify is key is a valid key
      if [[ "$enkey" =~ ^[a-z]+\-[a-z]+\-[a-z]+$ ]]; then
        for (( i = 1; i <= 3 ; i++ )); do
          key=$(echo $enkey| cut -f$i -d'-')
          if [[ "${dictionary[$key]}" =~ ^$ ]]; then
            echo "[ ERROR ] - this key is corrupted. try again"
            break
          else
            targetip="$targetip.${dictionary[$key]}"
          fi
        done
      else
        echo "[ ERROR ] - this key is corrupted. try again"
      fi
    done
    ## Can include code for checking if the receiver is the one as well
    echo $enkey | nc -w 3 "$targetip" $PORT


    cdir=$(pwd)
    dir=$1
    cd $dir/..
    # ip_receiver=192.168.0.7
    dirName=$( basename $dir )
    tar cfp - $dirName | compress -c | nc -w 3 $targetip $PORT
    echo "sent succesfully"
    cd $cdir

    # RECEIVE PROTOCOL
    else if [[ "$response" =~ ^([rR]|[rR][eE][cC][eE][iI][vV][eE])$ ]]
    then
      echo "Receive a file:" #receive protocol
      # way of encrypting ip
      phrase=""
      for (( i = 2; i <= 4; i++ )); do
        num=$(echo $ip | cut -f$i -d'.')
          for key in "${!dictionary[@]}"
            do
              if [[ ${dictionary[$key]} -eq $num ]]; then
                if [[ $i -eq 2 ]]; then
                  phrase="$key"
                else
                  phrase="$phrase-$key"
                fi;
                break
              fi
          done
      done
      # echo key to terminal
      echo "Pass this key to the Sender: $phrase"
      sleep 3s # sleep for processing effect
      echo "Waiting for Sender to connect..."
      verifykey=$(nc -l -p $PORT)
      #Checks if the sender is the desired one
      if [[ "$verifykey" =~ "$phrase" ]]; then
        echo "Sender connected succesfully!"
        cd ~/Downloads
        nc -l -p $PORT | uncompress -c | tar xvfp -
        echo "receive items heres"
      else
        echo "[ WARN ] - Some random sender is trying to approach"
      fi

    # EXIT
    else
      echo "Thanks for using P2PFileSend."
      exit
    fi
    fi
  done

# IF USER IS NOT ON IITD Network.
else
  echo "[ ERROR ] - You're not on the IITD Intranet currently!"
  exit
fi
