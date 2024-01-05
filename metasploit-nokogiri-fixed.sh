
#!/data/data/com.termux/files/usr/bin/bash

metasploitPath1="/data/data/com.termux/files/home/metasploit-framework"      
metasploitPath2="/data/data/com.termux/files/usr/opt/metasploit-framework"
Msfnokogiri_fixedPath="/data/data/com.termux/files/home/msfnokogiri-fixed"
msfPath=""
fixedPath=""

animation() {
    local start=$(date +%s)
    local symbols="|/-\\"
    local dashes="----------------------------------------------------------------"
    local i=0
    while true; do
        printf "%s\r" "${dashes:i%32:32} ${symbols:i%4:1}"
        sleep 0.1
        local now=$(date +%s)
        if (( now - start > 5 )); then
            printf "\r"
            return
        fi
        ((i++))
    done
}

documentacion(){
        clear
	sleep 1
	printf "\n\n"
        echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
        echo -e "\033[0;32m×                     ~  metasploit-nokojiri_gem-fixed ~                           ×\033[0m"
        echo -e "\033[0;32m×××××××××××××××××××××××××××××××××××× By HaR3s ××××××××××××××××××××××××××××××××××××××\033[0m"
        printf "\n\n"
        animation
}

checkMsfnokogiri_fixedPath (){
    if [ -d "$Msfnokogiri_fixedPath" ]; then
	   export fixedPath=$Msfnokogiri_fixedPath
            else
	  echo -e "\033[0;32m×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××x\033[0m"
          echo -e "\033[0;32mx             Porfavor introduzca la ruta donde a clonado el repositorio           x\033[0m"
          echo -e "\033[0;32m×                                        o                                         ×\033[0m"
          echo -e "\033[0;32m×  	                       presione 'q' para salir                             ×\033[0m"
	  echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
	  printf "\n\n"
	  read  inputPath
        if [ "$inputPath" == "q" ]; then
	    clear
            exit
        fi
        if [ -d "$inputPath" ]; then
           export fixedPath=$inputPath         
	   clear
           documentacion
        else
	    clear
           documentacion
	    printf "\n\n"
            echo -e "\033[0;31mmsfnokogiri-fixed: No such file or directory\033[0m"
	    printf "\n\n"
            exit
        fi
fi
 }

 checkMetasploitPath (){
    if [ -d "$metasploitPath1" ] || [ -d "$metasploitPath2" ]; then
	if [ -d "$metasploitPath1" ]; then
           export msfPath=$metasploitPath1    
	cd $msfPath        
   else
           export msfPath=$metasploitPath2
          cd  $msfPath         
       fi
	    else
          echo -e "\033[0;32m×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××x\033[0m"
          echo -e "\933[0;32mx                    Porfavor introduzca la de  metasploit-framework               x\033[0m"
          echo -e "\033[0;32m×                                          o                                       ×\033[0m"
          echo -e "\033[0;32m×                                presione 'q' para salir                           ×\033[0m"
	  echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
	read inputPath
        if [ "$inputPath" == "q" ]; then
            exit
        fi
        if [ -d "$inputPath" ]; then
	   export msfPath=$inputPath
	   cd $msfPath
	   clear
           documentacion
        else
	    clear
	    printf "\n\n"
            echo -e "\033[0;31mmetasploit-framework: No such file or directory\033[0m"
	    printf "\n\n"
            exit
	fi 
fi
 }

 checkGemfiles(){
	 echo -e "\033[0;32mComprobando dependencias                 \033[0m"
	 printf "\n\n"
	 animation
    if [ ! -f "metasploit-framework.gemspec" ]; then
        echo -e "\033[0;31mEl programa no puede continuar ya que los archivos requeridos no existen.\033[0m"
        echo -e "\033[0;32mSe requiere  metasploit-framework.gemspec en la siguiente ruta:\033[0m"
	echo "$(pwd)"
        exit
    fi
}



updateGemfiles () {
	if
		if [ -e Gemfile.lock ]; then
  if grep -q 'nokogiri (~> 1.14.0)' Gemfile.lock  || grep -q 'nokogiri (1.14.0)' Gemfile.lock  ; then
    sed -i 's/nokogiri (~> 1.14.0)/nokogiri (~> 1.16.0.rc1)/' Gemfile.lock
    sed -i 's/nokogiri (1.14.0)/nokogiri (1.16.0.rc1)/' Gemfile.lock 
   	 fi
  fi

  if grep -q "'nokogiri' , '~> 1.14.0'" metasploit-framework.gemspec; then
    sed -i "s/'nokogiri', '~> 1.14.0'/'nokogiri', '~> 1.16.0.rc1'/" metasploit-framework.gemspec
  fi; then

  if [ $? -eq 0 ]; then
	  animation
    echo -e "\033[0;32mSe han corregido los archivos satisfactoriamente.\033[0m"
  else
	  animation
    echo -e "\033[0;31mNo se efectuaron cambios o ha ocurrido un error inesperado.\033[0m"
  fi
fi
}

bundleInstall(){
	printf "\n\n"
	echo -e "\033[0;32mEjecutando bundle\033[0m"
	printf "\n\n"
	animation
    bundle install
    if [ "$?" -ne "0" ]; then
        echo -e "\033[0;31mError en la instalación de bundle \033[0m"
        exit
    else
	    printf "\n\n"
	echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
        echo -e "\033[0;32m                          bundle ejecutado satisfactoriamente.                      \033[0m"
	printf "\n\n\n"
	sleep 4
    fi
}
   

checkDNSResolver() {
    if [ -f "$msfPath/lib/net/dns/resolver.rb" ]; then
        rm "$msfPath/lib/net/dns/resolver.rb"
    fi

    cp "$fixedPath/.configfile.txt" "$msfPath/lib/net/dns/resolver.rb" 2>/dev/null || { printf "\n";echo -e "\033[0;31mError al instalar dependencias\033[0m";printf "\n";echo -e "$fixedPath/.configfile.txt : \033[0;31mNo such file or directory\033[0m";printf "\n"; exit; }
    printf "\n"
    echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
    echo -e "\033[0;32m                      Dependencias actualizadas correctamente                       \033[0m"
}


mainProgram(){
    documentacion
    checkMsfnokogiri_fixedPath
    checkMetasploitPath
    checkGemfiles
    updateGemfiles
    checkDNSResolver
    bundleInstall
    clear
    printf "\n\n\n"
    echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
    echo -e "\033[0;32m×                         ~ Ejecutando metasploit-framework ~                      ×\033[0m"
    echo -e "\033[0;32m××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\033[0m"
    printf "\n\n"
    animation
    msfconsole
}

mainProgram

