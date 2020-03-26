# INFINANCE PROJECT

## Datos del proyecto

Proyecto realizado en la asignatura Diseño de Aplicaciones Telemáticas para el Máster en Ingeniería de Telecomunicaciones, Universidad Carlos III de Madrid, curso 2017-18.

## Descripción del proyecto

Este proyecto ha sido creado para la gestión de una cartera de acciones: una herramienta de apoyo para inversiones en el mercado de valores. Las características más destacables son:

* Registro y login de usuarios básicos y administradores
* Visualización de gráficos sobre el valor de las acciones del NASDAQ
* Simulación de compra y venta de acciones en una cartera virtual
* Exportación de los datos de la cartera virtual
* Descargar fichero WSDL para hacer uso de la Api SOAP

Las tecnologías usadas en este proyecto son:

* MySQL y JDBC
* XML y DOM
* JSON y Jackson/Gson
* SOAP y WSDL
* J2EE: Servlets y JSP
* AJAX y JavaScript
* Uso de APIs externas

## Guía de uso

Descomprimir la carpeta en el HOME de la máquina virtual en una carpeta llamada DAT. De no hacerlo asi cambiar la línea de añadir las librerías con la ruta correspondiente.

Tanto para la creación de la base de datos como para la compilación hay que añadir las librerías al CLASSPATH:<br>
`export CLASSPATH=$CLASSPATH:$HOME/Herramientas/apache-tomcat-7.0.50/lib/*:$HOME/DAT/lib/*`

**Crear usuario y base de datos para el proyecto.**

1. Ir a la carpeta datos en carpeta DAT<br>`cd $HOME/DAT/datos`
2. Entrar en mysql como root<br>`mysql -u root -pdat14`
3. Ejecutar el comando, esto creará un usuario nuevo y la base de datos para el proyecto<br>`\. createuser.sql`
4. Rellenar la base de datos con los datos de las empresas<br>`javac $HOME/DAT/datos/ReadCSV.java`<br>`java ReadCSV`

**Despliegue del proyecto**

*Opción A:*
Tras crear la base de datos y rellenarla se puede desplegar el proyecto de servlets copiando el archivo infinance.war contenido en la carpeta que acaba de descomprimir.<br>
Una vez hecho eso tras reiniciar el tomcat unicamente hay que ir a la dirección "localhost:8080/infinance/home"

*Opción B:*
Desplegar el proyecto compilando desde el código fuente siguiendo los siguientes pasos.
1. Compilar el proyecto:<br>
	a) Abrir un terminal en la en el directorio "$HOME/DAT/infinance/WEB-INF/classes"<br>
	b) Compilar el proyecto<br>`javac ./infinance/*.java ./model/*.java ./utils/*.java`
2. Desplegar el proyecto en el tomcat<br>
	a) Copiar la carpeta infinance en la carpeta webapps del tomcat<br>`cp -r $HOME/DAT/infinance $HOME/Herramientas/apache-tomcat-7.0.50/webapps/`
	b) Eliminar los ficheros java<br>`rm -r $HOME/Herramientas/apache-tomcat-7.0.50/webapps/infinance/WEB-INF/classes/*/*.java`
3. Reiniciar el tomcat<br>
NOTA: La página de inicio se encuentra en "localhost:8080/infinance/home"

**Servicio SOAP**

Con lo anterior ya estaría configurado el tomcat con el proyecto, ahora se procederá a configurar el servicio SOAP. Para ello se supone que el axis está configurado tal como se explica en la práctica.
* Añadir las librerías al CLASSPATH<br>`export CLASSPATH=$CLASSPATH:$HOME/Herramientas/apache-tomcat-7.0.50/lib/*:$HOME/DAT/lib/*:$HOME/Herramientas/axis-1_4/lib/*`


*Despliegue del servicio*<br>
1. Compilar el servicio<br>`javac $HOME/DAT/Servicio_SOAP/RequestPortfolio_pkg/*.java`
2. Copiar el proyecto en classes del WEB-INF en la carpeta axis del tomcat<br>`cp -r $HOME/DAT/Servicio_SOAP/RequestPortfolio_pkg/ $HOME/Herramientas/apache-tomcat-7.0.50/webapps/axis/WEB-INF/classes/RequestPortfolio_pkg`
3. Pegar las librerías necesarias para el servicio<br>`cp $HOME/DAT/lib/jdom-2.0.6.jar $HOME/Herramientas/apache-tomcat-7.0.50/webapps/axis/WEB-INF/lib`<br>`cp $HOME/DAT/lib/mysql-connector-java-5.1.46.jar $HOME/Herramientas/apache-tomcat-7.0.50/webapps/axis/WEB-INF/lib`
4. Usar el deploy.wsdd<br>`java org.apache.axis.client.AdminClient -p8080 $HOME/DAT/Servicio_SOAP/RequestPortfolio_pkg/deploy.wsdd`
5. Reiniciar el tomcat.

*Uso del cliente*
* Emplear el classpath<br>`export CLASSPATH=$CLASSPATH:$HOME/Herramientas/apache-tomcat-7.0.50/lib/*:$HOME/DAT/lib/*:$HOME/Herramientas/axis-1_4/lib/*:$HOME/Herramientas/apache-tomcat-7.0.50/webapps/axis/WEB-INF/classes/`

1. Compilar el cliente<br>`javac $HOME/DAT/Servicio_SOAP/Cliente_servicio/ClienteRequestPortfolio.java`
2. Ejecutar el cliente pasándole como primer argumento la clave del API que aparece en el apartado de exportación y como segundo argumento el nombre del fichero xml en el que se guardará el historial<br>`cd $HOME/DAT/Servicio_SOAP/Cliente_servicio/`<br>`java ClienteRequestPortfolio <APIKey> <nombre_fichero>`
3. Si la clave introducida corresponde con la clave de un usuario que ha hecho alguna transacción se creará un fichero xml con su historial. Para mostrarlo:<br>`cat <nombre_fichero>`

#### Acceso a la Base de Datos:
u: adminInfinance <br/>
p: proyectoDAT <br/>
