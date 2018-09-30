;;*********************************************
;;Hechos iniciales y Plantilla de sintomas
;;*********************************************
;; Para preguntar por un sintoma concreto
	(deftemplate pregunta
		(slot nombre (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
	)
;; Para almacenar respuesta y el sintoma correspondiente
	(deftemplate respuesta
		(slot valor (type SYMBOL) (allowed-symbols si no))
		(slot nombre (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
	)
;; Template de lista de enfermedades y sus sintomas caracteristicos
	(deftemplate enfermedad
		(slot nombre (type STRING))
		(slot sintoma (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
	)
;; Lista de enfermedades y sus sintomas caracteristicos	
	(deffacts sintomasComunesEnfermedad
		(enfermedad (nombre "gripe")(sintoma "fiebre")(intensidad "media"))
		(enfermedad (nombre "gripe")(sintoma "dolor de cabeza")(intensidad "alta"))
		(enfermedad (nombre "ah1n1")(sintoma "fiebre")(intensidad "baja"))
		(enfermedad (nombre "ah1n1")(sintoma "dolor de cabeza")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "fiebre")(intensidad "ns"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de cabeza")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "rigidez de nuca")(intensidad "ns"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de nuca")(intensidad "ns"))
		(enfermedad (nombre "dengue")(sintoma "fiebre")(intensidad "alta"))
		(enfermedad (nombre "dengue")(sintoma "ronchas")(intensidad "ns"))
		(enfermedad (nombre "dengue")(sintoma "vomitos")(intensidad "alta"))
		(enfermedad (nombre "dengue")(sintoma "dolor de cabeza")(intensidad "ns"))	
	)
;; Plantilla de sintomas	
	(deftemplate sintomas
		(slot nombre (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
		(slot tiene (type SYMBOL) (allowed-symbols si no))
	)
;; Plantilla hipotesis	
	(deftemplate hipotesis
		(slot tipo (type STRING))
	)
;; Plantilla diferencial
	(deftemplate diferencial
		(slot tipo (type STRING))	
	)
;; Insertar hipotesis y diferencial inicial (por defecto un valor nulo, para que se elimine al tener la primera hipotesis y diferencial validos.)
	(deffacts hipodif
		(hipotesis (tipo "nulo"))
		(diferencial(tipo "nulo"))
	)
;; Sintomas iniciales para preguntar	
	(deffacts sintomasIniciales
		(sintomas (nombre "dolor de cabeza") (intensidad "ns") (tiene no))
		(sintomas (nombre "tos")(intensidad  "ns") (tiene no))	
		(sintomas (nombre "dolor muscular")(intensidad  "ns") (tiene no))
		(sintomas (nombre "fiebre")(intensidad  "ns") (tiene no))
		(sintomas (nombre "rigidez de nuca")(intensidad "ns" )(tiene no))
		(sintomas (nombre "ronchas")(intensidad "ns")(tiene no))
	)

;; Hechos que dicen si se sabe si es o no gripal y si hay epidemia de dengue.	
	(deffacts suposicionesDefecto
		(desconoceGripal)
		(desconoceDengue)
	)
	
;;**********************************
;;**********************************
;;********Menu Principal.***********
;;**********************************
;;**********************************
	(deffacts init
	  (troubleshoot-mode engine)
	  (menu-level engine main)
	)
	  
	;Inicio
	(defrule inicio
	  (declare (salience 500))  
	  (troubleshoot-mode engine)
	  ?ml <- (menu-level engine main)
	  =>
	  (retract ?ml)
	  (printout t crlf "Sistema experto para el diagnostico de Gripe, GripeA, Dengue y Meningitis:" crlf)
	  (printout t crlf crlf crlf)
	  (printout t
	  "        Elegir una de las opciones" crlf
	  "                  1.- Iniciar Sistema de Hipotesis." crlf
	  "                  2.- Epidemia de Dengue en curso. " crlf
	  "                  0.- Salir." crlf crlf
	  "        Eleccion: " )
	  (bind ?response (read))
	  (assert (problem-response engine ?response))
	  (printout t crlf)
	)
	  
	
;;**********************************
;;**********************************
;;*Modulo1.- Preguntar al paciente.*
;;**********************************
;;********************************** 

;;**************************************************
;; Opcion "1" del menu Iniciar Sistema de Hipotesis*
;;**************************************************
	(defrule mensajeSintomas
	  (troubleshoot-mode engine)
	  (problem-response engine 1)
	=>
	  (printout t crlf"¿Tiene alguno de los siguientes Sintomas?:" crlf crlf)
	) 
	 
	(defrule nuevoSintoma
	  (troubleshoot-mode engine)
	  (problem-response engine 1)
	  (sintomas (nombre ?x) (intensidad ?y) (tiene no))
	=>
	  (printout t "[ " ?x " ] ")
	 )
	 
	(defrule finMensajeSintomas
	  (troubleshoot-mode engine)
	  (problem-response engine 1)
	=>
	  (printout t crlf crlf)
		(assert (insertar))
	) 
  
	(defrule pregunta
	  ?f<-(insertar)
	  =>
	  (retract ?f)
	  (printout t " Poner nombre del sintoma entre comillas: ")
	  (assert (nombre_sintoma (read)))
	)

	(defrule sintomaLeido
		?f <-(nombre_sintoma ?x)
		?s <- (sintomas (nombre ?x) (intensidad ?y) (tiene ?z))
		=>
		(retract ?f)
		(printout t " Defina intensidad del sintoma: ")
		(printout t " {ns}{alta}{media}{baja}: ")
		(modify ?s (intensidad (read)) (tiene si))
		(assert (insertar2))
	)
	
	(defrule pregunta2
	  ?f<-(insertar2)
	  =>
	  (retract ?f)
	  (printout t " Poner nombre del sintoma entre comillas: ")
	  (assert (nombre_sintoma2 (read)))
	)

	(defrule sintomaLeido2
		?f <-(nombre_sintoma2 ?x)
		?s <- (sintomas (nombre ?x) (intensidad ?y) (tiene ?z))
		=>
		(retract ?f)
		(printout t " Defina intensidad del sintoma: ")
		(printout t " {ns}{alta}{media}{baja}: ")
		(modify ?s (intensidad (read)) (tiene si))
		(assert (hipo))
		(assert (pf))
	)
	
;; PREGUNTAR POR PERSISTENTES Y FUERZA EN SINTOMAS
	(defrule persistentes
		?f<-(pf)
		 =>
		(printout t crlf"*****si o no******:" crlf crlf)
		(printout t " ¿LOS SINTOMAS SON PERSISTENTES[Mas de una semana] "crlf)
		(assert (apersistentes (read)))	
		(printout t " ¿LOS SINTOMAS SON FUERTES? "crlf)
		(assert (afuertes (read)))	
		(retract ?f)
	)

	(defrule fuertes2
		?f<-(afuertes ?x)
		(test (eq ?x si))
	=>
		(retract ?f)
		(assert (fuertes))
	)
	(defrule persistentes2
		?f <-(apersistentes ?x)
		(test (eq ?x si))
	=>
		(retract ?f)
		(assert (persistentes))
	)

;;**************************************************
;; Opcion "2" del menu epidemia Dengue*
;;**************************************************
(defrule initi
 (troubleshoot-mode engine)
 (problem-response engine 2)
 =>
 (printout t " **************************"crlf)
 (printout t " EPIDEMIA DE DENGUE ACTIVA: "crlf)
 (printout t " **************************"crlf crlf)
 (assert (epidemiaDengue))
 (assert (troubleshoot-mode engine))
 (assert (menu-level engine main))
)
 
 
;;***********************************
;;***********************************
;;*Modulo2.- Establecer Hipotesis.***
;;***********************************
;;***********************************
;;NO ENFERMO ;;
	(defrule hipotesisNoEnfermo
	(declare (salience 500))
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene no))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene no))
	=>
	(retract ?f)
	(assert (noEnfermo))	
	)
;; SINTOMAS GRIPALES ;; 
	(defrule hipotesisSintomaGripal
	?f<-(hipo)
	(desconoceGripal)
	(sintomas(nombre "fiebre")(intensidad ?y)(tiene si))
	(sintomas(nombre "dolor de cabeza")(intensidad ?z)(tiene si))
	?g<-(desconoceGripal)
	=>
	(retract ?g)
	(assert (sintomasgripales))
	)
;; SINTOMAS DENGUE ;;
	(defrule hipotesisSintomaDengue
	?f<-(hipo)
	(sintomas(nombre "ronchas")(intensidad ?y)(tiene si))
	?g<-(desconoceDengue)
	=>
	(retract ?g)
	(assert (sintomadengue))
	)

;; GRIPE ;;		
	(defrule hipotesisGripe
	?f<-(hipo)
	?h<-(hipotesis(tipo ?w))
	(not(sintomas (nombre "dolor de cabeza") (intensidad "alta"	) (tiene si)))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	(sintomas (nombre "rigidez de nuca")(intensidad ?z)(tiene no))
	(not(persistentes))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "gripe")))
	(assert (dif))
	)
	
;; AH1N1 ;;	
	(defrule hipotesisAh
	?f<-(hipo)
	(noMeningitis)
	(noDengue)
	(sintomas(nombre "fiebre")(intensidad "alta")(tiene si))
	(sintomas (nombre "ronchas")(intensidad ?y)(tiene no))
	?h<-(hipotesis(tipo ?w))
	(persistentes)
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "ah1n1")))
	(assert (dif))
	)
	
;; MENINGITIS ;;
	(defrule hipotesisMenin
	?f<-(hipo)
	(sintomasgripales)
	(sintomas (nombre "rigidez de nuca")(intensidad ?z)(tiene si))
	?h<-(hipotesis(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "meningitis")))
	(assert (dif))
	)
	
	(defrule hipotesisMenin2
	?f<-(hipo)
	(sintomasgripales)
	(sintomas (nombre "dolor de nuca")(intensidad ?x)(tiene si))
	?h<-(hipotesis(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "meningitis")))
	(assert (dif))
	)
	
;; DENGUE ;;
	(defrule hipotesisDengue1
	?f<-(hipo)
	(epidemiaDengue)
	?h<-(hipotesis(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (dif))
	)

	(defrule hipotesisDengue2
	?f<-(hipo)
	(nomeningitis)
	(sintomasgripales)
	(sintomas (nombre "ronchas") (intensidad ?y) (tiene si))
	(fuertes)
	?h<-(hipotesis(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (dif))
	)
	(defrule hipotesisDengue3
	?f<-(hipo)
	(nomeningitis)
	(sintomasgripales)
	(sintomas (nombre "ronchas") (intensidad ?y) (tiene si))
	(persistentes)
	?h<-(hipotesis(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (dif))
	)
	



;;***********************************
;;***********************************
;;*Modulo2.- Establecer Diferencial.*
;;***********************************
;;***********************************
;; DIFERENCIAL GRIPE ;;
	(defrule diferencialGripe
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(not(nomeningitis))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "meningitis")))
	(assert (final))
	)
	
	(defrule diferencialGripe2
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(nomeningitis)
	(not(epidemiaDengue))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)

	(defrule diferencialGripe3
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(nomeningitis)
	(not(sintomas (nombre "ronchas")(intensidad ?y)(tiene ?z)))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialGripe4
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(epidemiaDengue)
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
	(defrule diferencialGripe5
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(sintomadengue)
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
;;	DIFERENCIAL DENGUE ;;
	(defrule diferencialDengue
	?f<-(dif)
	(hipotesis (tipo "dengue"))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
;; DIFERENCIAL MENINGITIS
	(defrule diferencialMeningitis
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(persistentes)
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis1
	?f<-(dif)
	(fuertes)
	(hipotesis (tipo "meningitis"))
	(not(sintomadengue))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis2
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(not(persistentes))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "gripe")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis3
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(not(fuertes))
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "gripe")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis4
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(persistentes)
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis5
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(fuertes)
	(sintomadengue)
	?h<-(diferencial(tipo ?w))
	=>
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)


;;***********************************
;;***********************************
;;*Modulo final para dar diagnostico*
;;******O continuar preguntando******
;;***********************************
;;***********************************
;; TRES DESCARTADOS; SALIDA POR EL RESTANTE
(defrule finalPregunta0
	?f<-(final)
	(noDengue)
	(noMeningitis)
	(noAh1n1)
	=>
	(assert (gripe))
)
(defrule finalPregunta1
	?f<-(final)
	(noGripe)
	(noMeningitis)
	(noAh1n1)
	=>
	(assert (dengue))
)
(defrule finalPregunta2
	?f<-(final)
	(noDengue)
	(noMeningitis)
	(noGripe)
	=>
	(assert (ah1n1))
)
(defrule finalPregunta3
	?f<-(final)
	(noDengue)
	(noGripe)
	(noAh1n1)
	=>
	(assert (meningitis))
)

;; En el caso de que no se tenga persistentes ni fiebre especialmente alta y se descarte meningitis -GRIPE-
 (defrule descartarMeningitis
	?f<-(final)
	(not(persistentes))
	(not(sintomas (nombre "fiebre")(intensidad "alta")(tiene si)))
	(noMeningitis)
	=>
	(assert (gripe))
	)

;; Si tengo hipotesis de AH1N1 y son negativos los indicios de dengue -AH1N1-
	(defrule salirah1n	
		?f<-(final)
		(not(sintomadengue))
		(hipotesis(tipo "ah1n1"))
		=>
		(assert (ah1n1))
	)

;; Si tengo hipotesis y diferencial. Y hay un sintoma comun en el diferencial del que no tengo informacion, se pregunta por ese sintoma.
		;; ACLARACION.- Buscamos un sintoma de diferencial que no tenga la hipotesis y preguntamos por el.

	(defrule buscando
		?f<-(final)
		(hipotesis(tipo ?y))
		(diferencial(tipo ?x))
		(test (neq ?y ?x ))
		(enfermedad (nombre ?y)(sintoma ?z)(intensidad ?i))
		(enfermedad (nombre ?x)(sintoma ?c)(intensidad ?v))
		(test (neq ?z ?c))
		(not(sintomas (nombre ?c) (intensidad ?v)(tiene si)))
		=>
		(assert (pregunta (nombre ?c)(intensidad ?v)))
	)
	
	(defrule preguntando
		?f<-(final)
		?b<-(pregunta (nombre ?z)(intensidad ?v))
		(not(sintomas (nombre ?z) (intensidad ?v)(tiene si)))
		=>
		(retract ?f)
			(printout t crlf"*****si o no******:" crlf crlf)
			(printout t crlf"¿Tienes el sintoma?:" )
			(printout t "[ " ?z " ] ")
			(printout t crlf crlf )
			(printout t crlf"¿Con intensidad?:" )
			(printout t "[ " ?v " ] ")
			(printout t crlf crlf )
		(bind ?response (read))
		(assert (respuesta (valor ?response)(nombre ?z)(intensidad ?v)))
		(retract ?b)
	)
	
	(defrule insertaNuevoSintoma
		?f<-(respuesta (valor ?i)(nombre ?z)(intensidad ?v))
		=>
		(assert (sintomas (nombre ?z)(intensidad ?v)(tiene ?i)))
		(retract ?f)
		(assert (hipo))
	)

;; Si tengo dos sintomas caracteristicos de la hipotesis que no sean del diagnostico diferencial, salgo devolviendo la hipotesis.
	(defrule sintomasCaracteristicos
		?f<-(final)
		(hipotesis(tipo ?y))
		(diferencial(tipo ?x))
		(test (neq ?y ?x ))
		(enfermedad (nombre ?y)(sintoma ?z))
			(sintomas (nombre ?z)(intensidad ?p)(tiene si))
		(enfermedad (nombre ?y)(sintoma ?j))
			(sintomas (nombre ?j)(intensidad ?o)(tiene si))
		(not(enfermedad (nombre ?x)(sintoma ?z)))
		(not(enfermedad (nombre ?x)(sintoma ?j)))
		(test (neq ?y ?x))
		(test (neq ?z ?j))
		=>
		(retract ?f)
		(assert (confirmaHipotesis))
	)
	
	

	
	
	


 ;;****************************************
 ;;******SALIDA POR HIPOTESIS ACTUAL*******
 ;;****************************************	
	(defrule confirmandoHipotesis
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "gripe"))
	=>
	(retract ?f)
	(assert (default))
	)
	(defrule confirmandoHipotesis2
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "ah1n1"))
	=>
	(retract ?f)
	(assert (ah1n1))
	)	
	(defrule confirmandoHipotesis3
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "dengue"))
	=>
	(retract ?f)
	(assert (dengue))
	)	
	(defrule confirmandoHipotesis4
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "meningitis"))
	=>
	(retract ?f)
	(assert (meningitis))
	)
	


 ;;***********************************
 ;;******SALIDA POR DIAGNOSTICO*******
 ;;***********************************
(defrule fire-uno
	(noEnfermo)
	=>
	(printout t "SALIDA SIN ENFERMEDAD" crlf)
)

(defrule fire-dos
	(default)
	=>
	(printout t "SALIDA GRIPE" crlf)
)

(defrule fire-tres
	(ah1n1)
	=>
	(printout t "SALIDA AH1N1" crlf)
)
  
 (defrule fire-cuatro
	(meningitis)
	=>
	(printout t "SALIDA MENINGITIS" crlf)
)

 (defrule fire-cinco
	(dengue)
	=>
	(printout t "SALIDA DENGUE" crlf)
)
  
;;***************************************
;; Opcion "0" del menu   SALIR*
;;***************************************
(defrule salir
  (troubleshoot-mode engine)
  (problem-response engine 0)
=>
  (printout t "Saliendo...." crlf crlf crlf crlf)
  (halt))
  

