# msfnokogiri-fixed

Hola a todos los que estan leyendo este documento de ser asi
significa que al igual que yo tenéis problemas con la
instalacion de la gema nokogiri en metasploit.

Pues la buena noticia es que desarrolle este scrept precisamente
para solucionar este problema, despues de tanto buscar en
infinidad de informacion la cual me aporto mucho pero como tal
nada me daba una solucion ideal decidí tratar de encontrar una
forma de corregir el problema pues lo logre y hoy quiero
compartir con ustedes la solucion que realice .

Este sencillo programa automatiza la correccion de errores en el
codigo de metasploit el cual como tal no esta diseñado para
termux, si es asi esto solo funciona para termux dada la nueva
incompatibilidad de las versiones de la gema nokogiri en termux
esta es la solucion simplemente actualizar la gema a una versión
compatible en termux pero esto no es posible sin corregir el
codigo de programacion de el mismo metaspoit.

No voy a profundizar en como realiza el proceso el scrept pero
si os digo que una vez ejecutado la gema se va a instalar y si
ya la instalada pero igual os da error no hay problemas se va a
solucionar. tambien se corrigen los errores de compatibilidad
con la libreria libxml2 y otras que puden surgir en el proceso.


============ NOTA IMPORTANTE =================
                        

Al clonar el repositorio asegurase de que sea en la carpeta de
HOME de no ser asi el programa os va a pedir que ingresen
la ruta donde lo haveis clonado esto es importante al igual que
no se debe renombrar la carpeta que lo contiene.


============= ATENCIÓN =================
                            


Este scrept solo esta pensado y diseñado para usuarios de
termux por lo cual solo funcionara en termux

============= Modo de Empleo ================
                     

una vez clonado el repositorio de GitHub acceder a el usando
el comando 


```
cd msfnokogiri-fixed 
```


una vez en ella usamos el comado


```
chmod 700 metasploit-nokogiri-fixed.sh 
```

para dar permisos de
ejecucion.

Una vez realizado esto usamos

```
./metasploit-nokogiri-fixed.sh
```


o de igual manera bash metasploit-nokogiri-fixed.sh
ya eso es a gusto de cada cual ggggg.

Pues de aqu en adelante es esperar a que el scrept lo haga todo, sin mas, es eso.

====== Dicho esto Disfrutad de metasploit-framework =========
             
