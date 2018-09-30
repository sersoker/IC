;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;;INDICE;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;1.-Hechos iniciales, plantillas y sintomas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;
;;2.-Menu Principal.;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.-Modulo 1.- Preguntar al experto, Sintomas mas normales que le digan para hacer un listado para que puedan ser elegidos al inicio del programa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;(1 o 2 a elegir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.-Modulo 2.- A traves de un conjunto de reglas, sacar una hipotesis.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sintomas NO ENFERMEDAD
	;; NO DOLOR DE CABEZA y NO FIEBRE.- No entra dentro del margen de ninguna enfermedad, Hipotesis Ninguna -SALIR-
;; Sintomas GRIPE 
	;; No fiebre alta, no rigidez nuca, no mucho tiempo con sintomas, -HIPOTESIS GRIPE- (Por defecto)
;; Sintomas AH1N1
	;; No meningitis o dengue, fiebre muy alta o muy persistente, sin ronchas -HIPOTESIS AH1N1-
;; Sintomas Meningitis
	;; Sintomas gripales(todos los que tienen fiebre y dolor de cabeza), rigidez nuca o dolor en la nuca -HIPOTESIS MENINGITIS-
;; Sintomas Dengue
	;; No meningitis, sintomas gripales (fuertes/persistentes) y ronchas. -HIPOTESIS DENGUE-
	;; Si hay ronchas/sintomas fuertes/persistentes O hay una epidemia -HIPOTESIS DENGUE-
	;; Vomitos en ocasiones(menos determinante)
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;
;5.-Modulo 3.- Diferencial.
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hipotesis Gripe
		;; Si no he descartado meningitis se pone como diagnostico diferencial - MENINGITIS-
		;; Si se ha descartado la meningitis, y no hay informacion de epidemia de dengue o ronchas -AHN1-
		;; Si hay sintomas del dengue, o hay epidemia seria dengue -DENGUE-
;; Hipotesis Dengue
		;; Normalmente el diferencial es -AH1N1-
;; Hipotesis AH1N1
		;; Normalmente el diferencial es -Dengue-
;; Hipotesis meningitis
		;;Si hay persistencia en los sintomas o especialmente fuertes si no hay indicios de dengue(sintomas caracteristico del dengue y no de otros como ronchas) -AH1N1-
		;;Si hay persistencia en los sintomas o especialmente fuertes si hay indicios de dengue -DENGUE-
		;;Si no hay persistencia en los sintomas o no son especialmente fuertes -GRIPE-

		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;6.-MODULO FINAL PARA DAR DIAGNOSTICO;;;;
;;;;;;;;;;; O PREGUNTAR MAS;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cuando salir, si se han descartado todas menos 1, se sale por esa
;; Si no tenemos diferencial, o coincide con la hipotesis, confirmar hipotesis.
;; En el caso de que no se tenga persistencia ni fiebre especialmente alta y se descarte meningitis -GRIPE-
;; Si tengo hipotesis de AH1N1 y son negativos los indicios de dengue -AH1N1-
;; Si tengo hipotesis y diferencial. Y hay un sintoma comun en el diferencial del que no tengo informacion, se pregunta por ese sintoma.
		;; ACLARACION.- Buscamos un sintoma de diferencial que no tenga la hipotesis y preguntamos por el.
;; Si tengo dos sintomas caracteristicos de la hipotesis que no sean del diagnostico diferencial, salgo devolviendo la hipotesis.
;; Si tengo hipotesis y diagnostico, y tengo un sintoma caracteristico de los dos, pero con diferente intensidad, preguntar por la intensidad. (- prioridad que el superior SALIENCE)

;; DESCARTAR
;; Si no hay rigidez de nuca, y tampoco hay dolor en la nuca, descartar meningitis
;; SI no hay ronchas de la piel, descartamos dengue
;; Si no hay fiebre alta ni persistencia de sintomas, descartamos gripeA y denge
;; Cuando establezco una nueva hipotesis (que no sea gripe), se descarta a gripe;
;; Si se descarta algo, borrarlo de hipotesis y diferencial. 

;;Persistencia
;; Si tengo como hipotesis gripe y como diferencial dengue o AH1N1, pregunto por la persistencia de los sintomas.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;5.-Salida confirmando hipotesis, por diagnostico especifico y opcion salir de menu principal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-------------------------------------------------------------------------------------------------------------
;;-----------------------------------------------FIN DEL INDICE------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------


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
		(enfermedad (nombre "ah1n1")(sintoma "vomitos")(intensidad "baja"))
		(enfermedad (nombre "meningitis")(sintoma "ronchas")(intensidad "media"))
		(enfermedad (nombre "meningitis")(sintoma "fiebre")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "fiebre")(intensidad "media"))
		(enfermedad (nombre "meningitis")(sintoma "fiebre")(intensidad "baja"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de cabeza")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "rigidez de nuca")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de nuca")(intensidad "alta"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de nuca")(intensidad "media"))
		(enfermedad (nombre "meningitis")(sintoma "dolor de nuca")(intensidad "baja"))
		(enfermedad (nombre "meningitis")(sintoma "vomitos")(intensidad "baja"))
		(enfermedad (nombre "dengue")(sintoma "fiebre")(intensidad "alta"))
		(enfermedad (nombre "dengue")(sintoma "ronchas")(intensidad "alta"))
		(enfermedad (nombre "dengue")(sintoma "ronchas")(intensidad "media"))
		(enfermedad (nombre "dengue")(sintoma "ronchas")(intensidad "baja"))
		(enfermedad (nombre "dengue")(sintoma "vomitos")(intensidad "alta"))
		(enfermedad (nombre "dengue")(sintoma "dolor de cabeza")(intensidad "baja"))	
		(enfermedad (nombre "dengue")(sintoma "dolor de cabeza")(intensidad "media"))	
		(enfermedad (nombre "dengue")(sintoma "dolor de cabeza")(intensidad "alta"))	
	)
;; Plantilla de sintomas	
	(deftemplate sintomas
		(slot nombre (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
		(slot tiene (type SYMBOL) (allowed-symbols si no ns))
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
		(hipotesis (tipo "gripe"))
		(diferencial(tipo "nulo"))
	)
;; Sintomas iniciales para preguntar	
	(deffacts sintomasIniciales
		(sintomas (nombre "dolor de cabeza") (intensidad "ns") (tiene ns))
		(sintomas (nombre "dolor de nuca") (intensidad "ns") (tiene ns))
		(sintomas (nombre "tos")(intensidad  "ns") (tiene ns))	
		(sintomas (nombre "dolor muscular")(intensidad  "ns") (tiene ns))
		(sintomas (nombre "fiebre")(intensidad  "ns") (tiene ns))
		(sintomas (nombre "rigidez de nuca")(intensidad "ns" )(tiene ns))
		(sintomas (nombre "ronchas")(intensidad "ns")(tiene ns))
		(sintomas (nombre "vomitos")(intensidad "ns")(tiene ns))
		
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
	  (sintomas (nombre ?x) (intensidad ?y) (tiene ns))
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
		(modify ?s (tiene si))
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
		(modify ?s (tiene si))
		(assert (hipo))
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

;;*********** PARA TODOS ************
;; Cuando establezco una nueva hipotesis (que no sea gripe), se descarta a gripe;

;;NO ENFERMO ;;
	(defrule hipotesisNoEnfermo
	(declare (salience 500))
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene ns))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene ns))
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-1-")
	(retract ?f)
	(retract ?h)
	(assert (noEnfermo))	
	)
;; SINTOMAS GRIPALES ;; Fiebre y dolor de cabeza con cualquier intensidad ;;
	(defrule hipotesisSintomaGripal
	?f<-(hipo)
	(desconoceGripal)
	(sintomas(nombre "fiebre")(intensidad ?y)(tiene si))
	(sintomas(nombre "dolor de cabeza")(intensidad ?z)(tiene si))
	?g<-(desconoceGripal)
	=>
	(printout t "-2-")
	(retract ?g)
	(assert (sintomasgripales))
	)
;; SINTOMAS DENGUE ;;
	(defrule hipotesisSintomaDengue
	(not(noDengue))
	?f<-(hipo)
	(sintomas(nombre "ronchas")(intensidad ?y)(tiene si))
	(sintomas (nombre "vomitos")(intensidad ?y)(tiene si))
	?g<-(desconoceDengue)
	=>
	(printout t "-3-")
	(retract ?g)
	(assert (sintomadengue))
	)

;; GRIPE ;;		
	;; No fiebre alta, no rigidez nuca, no mucho tiempo con sintomas, -HIPOTESIS GRIPE- (Por defecto sallience)

	(defrule hipotesisGripe
	(not(noGripe))
	?f<-(hipo)
	?h<-(hipotesis(tipo ?w))
	(not(sintomas (nombre "fiebre") (intensidad "alta"	) (tiene si)))
	(not(sintomas (nombre "rigidez de nuca")(intensidad ?z)(tiene si)))
	(not(persistentes))
	=>
	(printout t "-4-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "gripe")))
	(assert (dif))
	)
	
;; AH1N1 ;;	
	;; No meningitis o dengue, fiebre muy alta o muy persistente, sin ronchas -HIPOTESIS AH1N1-

	(defrule hipotesisAh1
	(not(noAh1n1))
	?f<-(hipo)
	(noMeningitis)
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-5-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "ah1n1")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisAh2
	(not(noAh1n1))
	?f<-(hipo)
	(noDengue)
	?h<-(hipotesis(tipo ?w))
	(persistentes)
	=>
	(printout t "-6-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "ah1n1")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisAh3
	(not(noAh1n1))
	?f<-(hipo)
	(sintomas(nombre "fiebre")(intensidad "alta")(tiene si))
	(sintomas(nombre "ronchas")(intensidad ?l)(tiene no))
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-7-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "ah1n1")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisAh4
	(not(noAh1n1))
	?f<-(hipo)
	(noMeningitis)
	(noDengue)
	(sintomas(nombre "fiebre")(intensidad ?k)(tiene si))
	(sintomas(nombre "ronchas")(intensidad ?l)(tiene no))
	(persistentes)
	=>
	(printout t "-8-")
	(retract ?f)
	(assert (hipotesis (tipo "ah1n1")))
	(assert (noGripe))
	(assert (dif))
	)
	
;; MENINGITIS ;;
	;; Sintomas gripales(todos los que tienen fiebre y dolor de cabeza), rigidez nuca o dolor en la nuca -HIPOTESIS MENINGITIS-

	(defrule hipotesisMenin
	(not(noMeningitis))
	?f<-(hipo)
	(sintomasgripales)
	(sintomas (nombre "rigidez de nuca")(intensidad ?z)(tiene si))
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-9-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "meningitis")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisMenin2
	(not(noMeningitis))
	?f<-(hipo)
	(sintomasgripales)
	(sintomas (nombre "dolor de nuca")(intensidad ?x)(tiene si))
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-10-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "meningitis")))
	(assert (noGripe))
	(assert (dif))
	)
	
;; DENGUE ;;
	;; No meningitis, sintomas gripales (fuertes/persistentes) y ronchas. -HIPOTESIS DENGUE-
	;; Si hay ronchas/sintomas fuertes/persistentes O hay una epidemia -HIPOTESIS DENGUE-
	;; Vomitos en ocasiones(menos determinante)
	
	(defrule hipotesisDengue1
	(not(noDengue))
	?f<-(hipo)
	(noMeningitis)
	(sintomasgripales)
	(sintomas(nombre "fiebre")(intensidad "alta")(tiene si))
	(sintomas(nombre "dolor de cabeza")(intensidad "alta")(tiene si))
	(sintomas (nombre "ronchas") (intensidad "alta") (tiene si))
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-11-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)
	

	(defrule hipotesisDengue2
	(not(noDengue))
	?f<-(hipo)
	(noMeningitis)
	(sintomasgripales)
	(sintomas (nombre "ronchas") (intensidad ?y) (tiene si))
	(persistentes)
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-12-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisDengue3
	(not(noDengue))
	?f<-(hipo)
	(epidemiaDengue)
	?h<-(hipotesis(tipo ?w))
	=>
	(printout t "-13-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisDengue4
	(not(noDengue))
	?f<-(hipo)
	?h<-(hipotesis(tipo ?w))
	(sintomas(nombre "vomitos")(intensidad ?y) (tiene si))
	=>
	(printout t "-14-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)	

	(defrule hipotesisDengue5
	(not(noDengue))
	?f<-(hipo)
	?h<-(hipotesis(tipo ?w))
	(sintomas (nombre "ronchas") (intensidad ?y) (tiene si))
	=>
	(printout t "-15-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule hipotesisDengue6
	(not(noDengue))
	?f<-(hipo)
	?h<-(hipotesis(tipo ?w))
	(persistentes)
	=>
	(printout t "-16-")
	(retract ?f)
	(retract ?h)
	(assert (hipotesis (tipo "dengue")))
	(assert (noGripe))
	(assert (dif))
	)
	
	(defrule ningunah
	?f<-(hipo)
	=>
	(printout t "-17-")
	(retract ?f)
	(assert (dif))
	)


;;***********************************
;;***********************************
;;*Modulo2.- Establecer Diferencial.*
;;***********************************
;;***********************************
;; DIFERENCIAL GRIPE ;;
	;; Si no he descartado meningitis se pone como diagnostico diferencial - MENINGITIS-
	;; Si se ha descartado la meningitis, y no hay informacion de epidemia de dengue o ronchas -AHN1-
	;; Si hay sintomas del dengue, o hay epidemia seria dengue -DENGUE-

	(defrule diferencialGripe
	(not(noMeningitis))
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-18-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "meningitis")))
	(assert (final))
	)
	
	(defrule diferencialGripe2
	(not(noAh1n1))
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(noMeningitis)
	(not(epidemiaDengue))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-19-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)

	(defrule diferencialGripe3
	(not(noAh1n1))
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(nomeningitis)
	(sintomas (nombre "ronchas")(intensidad ?y)(tiene no))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-20-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialGripe4
	(not(noDengue))
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(epidemiaDengue)
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-21-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
	(defrule diferencialGripe5
	(not(noDengue))
	?f<-(dif)
	(hipotesis (tipo "gripe"))
	(sintomadengue)
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-22-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
;;	DIFERENCIAL DENGUE ;;
	;; Normalmente el diferencial es -AH1N1-

	(defrule diferencialDengue
	(not(noDengue))
	?f<-(dif)
	(hipotesis (tipo "dengue"))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-23-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
;;	DIFERENCIAL AH1N1 ;;
	;; Normalmente el diferencial es -DENGUE-

	(defrule diferencialAh1
	(not(noAh1n1))
	?f<-(dif)
	(hipotesis (tipo "ah1n1"))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-23-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
;; DIFERENCIAL MENINGITIS
	;;Si hay persistencia en los sintomas o especialmente fuertes si no hay indicios de dengue(sintomas caracteristico del dengue y no de otros como ronchas) -AH1N1-
	;;Si hay persistencia en los sintomas o especialmente fuertes si hay indicios de dengue -DENGUE-
	;;Si no hay persistencia en los sintomas o no son especialmente fuertes -GRIPE-
	
	(defrule diferencialMeningitis
	(not(noAh1n1))
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(persistentes)
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-24-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis1
	(not(noAh1n1))
	?f<-(dif)
	(sintomas(nombre ?u)(intensidad "alta")(tiene si))
	(hipotesis (tipo "meningitis"))
	(not(sintomadengue))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-25-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "ah1n1")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis2
	(not(noGripe))
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(not(persistentes))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-26-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "gripe")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis3
	(not(noGripe))
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(not(sintomas(nombre ?j)(intensidad "alta")))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-27-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "gripe")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis4
	(not(noDengue))
	?f<-(dif)
	(hipotesis (tipo "meningitis"))
	(persistentes)
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-28-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
	(defrule diferencialMeningitis5
	(not(noDengue))
	?f<-(dif)
	(sintomadengue)
	(hipotesis (tipo "meningitis"))
	(sintomas(nombre "ronchas")(intensidad "alta")(tiene si))
	?h<-(diferencial(tipo ?w))
	=>
	(printout t "-29-")
	(retract ?f)
	(retract ?h)
	(assert (diferencial (tipo "dengue")))
	(assert (final))
	)
	
	(defrule ningund
	?f<-(hipo)
	=>
	(printout t "-30-")
	(retract ?f)
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
	(noDengue) 	(noMeningitis) 	(noAh1n1)
	=>
	(printout t "-31-")
	(assert (default))
)
(defrule finalPregunta1
	?f<-(final)
	(noGripe) 	(noMeningitis) 	(noAh1n1)
	=>
	(printout t "-32-")
	(assert (dengue))
)
(defrule finalPregunta2
	?f<-(final)
	(noDengue) 	(noMeningitis) 	(noGripe)
	=>
	(printout t "-33-")
	(assert (ah1n1))
)
(defrule finalPregunta3
	?f<-(final)
	(noDengue) 	(noGripe) 	(noAh1n1)
	=>
	(printout t "-34-")
	(assert (meningitis))
)


;; Si no tenemos diferencial, o coincide con la hipotesis, confirmar hipotesis.
	(defrule diferencialCoincide
		(hipotesis (tipo ?x))
		(diferencial (tipo ?x))
		=>
		(assert (confirmaHipotesis))
	)
	(defrule noDiferencial
		(not(diferencial (tipo ?x)))
		=>
		(assert (confirmaHipotesis))
	)


;; Si tengo como hipotesis gripe y como diferencial dengue o AH1N1, pregunto por la persistencia de los sintomas.
	(defrule persistentes1
		?f<-(final)
		(not(persistentes))
		(hipotesis(tipo "gripe"))
		(diferencial(tipo "dengue"))
		 =>
		 (printout t "-35-")
		(printout t crlf"*****si o no******" crlf crlf)
		(printout t "¿LOS SINTOMAS SON PERSISTENTES[Mas de una semana]?"crlf)
		(assert (apersistentes (read)))	
	)
	(defrule persistentes2
		?f<-(final)
		(not(persistentes))
		(hipotesis(tipo "gripe"))
		(diferencial(tipo "ah1n1"))
		 =>
		 (printout t "-36-")
		(printout t crlf"*****si o no******" crlf crlf)
		(printout t "¿LOS SINTOMAS SON PERSISTENTES[Mas de una semana]?"crlf)
		(assert (apersistentes (read)))	
	)

	(defrule aPersistente
		?f <-(apersistentes ?x)
		(test (eq ?x si))
	=>
	(printout t "-37-")
		(retract ?f)
		(assert (persistentes))
		(assert(hipo))
	)

;; En el caso de que no se tenga persistentes ni fiebre especialmente alta y se descarte meningitis -GRIPE-
 (defrule descartarMeningitis
		?f<-(final)
		(not(persistentes))
		(not(sintomas (nombre "fiebre")(intensidad "alta")(tiene si)))
		(noMeningitis)
		=>
		(printout t "-38-")
		(assert (default))
	)

;; Si tengo hipotesis de AH1N1 y son negativos los indicios de dengue -AH1N1-
	(defrule salirah1n	
		?f<-(final)
		(not(sintomadengue))
		(hipotesis(tipo "ah1n1"))
		=>
		(printout t "-39-")
		(assert (ah1n1))
	)

;; Si tengo hipotesis y diferencial. Y hay un sintoma comun en el diferencial del que no tengo informacion, se pregunta por ese sintoma.
		;; ACLARACION.- Buscamos un sintoma de diferencial que no tenga la hipotesis y preguntamos por el.

	(defrule buscando
	(declare (salience 300))
		?f<-(final)
		(hipotesis(tipo ?y))
		(diferencial(tipo ?x))
		(enfermedad (nombre ?x)(sintoma ?c) (intensidad ?v))
		(not(enfermedad (nombre ?y)(sintoma ?c)))
		(sintomas (nombre ?c)(tiene ns))
		?s<-(sintomas (nombre ?c)(tiene ns))
		=>
		(printout t "-40-")
		(retract ?s)
		(printout t crlf"ENFERMEDAD?:" ?y)
		(printout t crlf"DIFERENCIAL?:" ?x)
		(printout t crlf"SINTOMA BUSCADO?:" ?c)
		(assert (pregunta (nombre ?c)(intensidad ?v)))
	)
	
	(defrule preguntando
		(declare (salience 300))
		?b<-(pregunta (nombre ?z)(intensidad ?v))
		=>
		(printout t "-41-")
			(printout t crlf"*****si o no******:" crlf crlf)
			(printout t crlf"¿Tienes el sintoma?: [ " ?z " ] ")
			(printout t crlf )
		(bind ?response (read))
		(assert (respuesta (valor ?response)(nombre ?z)(intensidad "ns")))
		(retract ?b)
	)
	
	(defrule insertaNuevoSintoma
		(declare (salience 300))
		?b<-(final)
		?f<-(respuesta (valor ?i)(nombre ?z)(intensidad ?v))
		=>
		(printout t "-42-")
		(assert (sintomas (nombre ?z)(intensidad ?v)(tiene ?i)))
		(retract ?f)
		(retract ?b)
		(assert (hipo))
	)
	
;; Si tengo hipotesis y diagnostico, y tengo un sintoma caracteristico de los dos, pero con diferente intensidad, preguntar por la intensidad. (- prioridad que el superior SALIENCE)
	(defrule buscando2
		(declare (salience 200))
		?f<-(final)
		(hipotesis(tipo ?y))
		(diferencial(tipo ?x))
		(test (neq ?y ?x ))
		(enfermedad (nombre ?y)(sintoma ?c) (intensidad ?b))
		(enfermedad (nombre ?x)(sintoma ?c) (intensidad ?v))
		(test(neq ?b ?v))
		(sintomas(nombre ?c)(intensidad "ns"))
		?s<-(sintomas(nombre ?c)(intensidad "ns"))
		=>
		(printout t "-43-")
		(printout t crlf"** Entre Comillas**:" crlf crlf)
		(printout t crlf"La intensidad de :" ?c)
		(printout t crlf" Es: " ?b " ")
		(printout t "o: " ?v " ")
		(printout t crlf )
		(modify ?s (intensidad (read)))
		(assert (hipo))
		(retract ?f)

	)
		

;; Si tengo dos sintomas caracteristicos de la hipotesis que no sean del diagnostico diferencial, salgo devolviendo la hipotesis.
	(defrule sintomasCaracteristicos
		?f<-(final)
		(hipotesis(tipo ?y))
		(diferencial(tipo ?x))
		(enfermedad (nombre ?y)(sintoma ?z))
			(sintomas (nombre ?z)(intensidad ?p)(tiene si))
		(enfermedad (nombre ?y)(sintoma ?j))
			(sintomas (nombre ?j)(intensidad ?o)(tiene si))
		(not(enfermedad (nombre ?x)(sintoma ?z)))
		(not(enfermedad (nombre ?x)(sintoma ?j)))
		(test (neq ?z ?j))
		=>
		(printout t "-44-")
		(retract ?f)
		(assert (confirmaHipotesis))
	)

;; Si no hay rigidez de nuca, y tampoco hay dolor en la nuca, descartar meningitis
	(defrule descartaMeningitis
	?f<-(final)
		(not(noMeningitis))
		(sintomas (nombre "rigidez de nuca")(intensidad ?o)(tiene no))
		(sintomas (nombre "dolor de nuca")(intensidad ?o)(tiene no))
		=>
		(printout t "-45-")
	(retract ?f)
		(assert (noMeningitis))
		(assert (hipo))
	)
;; SI no hay ronchas de la piel, descartamos dengue
	(defrule descartaDengue
	?f<-(final)
		(not(noDengue))
		(sintomas (nombre "ronchas")(intensidad ?o)(tiene no))
		=>
		(printout t "-46-")
	(retract ?f)
		(assert (hipo))
		(assert(noDengue))
	)
;; Si no hay fiebre alta ni persistencia de sintomas, descartamos Ah1n1
	(defrule descartaAh1n1
	?f<-(final)
		(not(noAh1n1))
		(not(noDengue))
		(sintomas (nombre "fiebre")(intensidad ?o)(tiene no))
		(not(persistencia))
		=>
		(printout t "-47-")
	(retract ?f)
		(assert (hipo))
		(assert(noAh1n1))
		(assert(noDengue))
	)
	
;; Si se descarta algo, borrarlo de hipotesis y diferencial. 
	(defrule quitarDifDengue
		(noDengue)
		?f<-(diferencial (tipo "dengue"))
		=>
		(retract ?f)	
	)
	(defrule quitarHipDengue
		(noDengue)
		?f<-(hipotesis (tipo "dengue"))
		=>
		(retract ?f)	
	)
	(defrule quitarDifGripe
		(noDengue)
		?f<-(diferencial (tipo "gripe"))
		=>
		(retract ?f)	
	)
	(defrule quitarHipGripe
		(noDengue)
		?f<-(hipotesis (tipo "gripe"))
		=>
		(retract ?f)	
	)
	(defrule quitarDifAh1
		(noDengue)
		?f<-(diferencial (tipo "ah1n1"))
		=>
		(retract ?f)	
	)
	(defrule quitarHipAh1
		(noDengue)
		?f<-(hipotesis (tipo "ah1n1"))
		=>
		(retract ?f)	
	)
	(defrule quitarDifMeningitis
		(noDengue)
		?f<-(diferencial (tipo "meningitis"))
		=>
		(retract ?f)	
	)
	(defrule quitarHipMeningitis
		(noDengue)
		?f<-(hipotesis (tipo "meningitis"))
		=>
		(retract ?f)	
	)

 ;;****************************************
 ;;******SALIDA POR HIPOTESIS ACTUAL*******
 ;;****************************************	
	(defrule confirmandoHipotesis
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "gripe"))
	=>
	(printout t "-48-")
	(retract ?f)
	(assert (default))
	)
	(defrule confirmandoHipotesis2
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "ah1n1"))
	=>
	(printout t "-49-")
	(retract ?f)
	(assert (ah1n1))
	)	
	(defrule confirmandoHipotesis3
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "dengue"))
	=>
	(printout t "-50-")
	(retract ?f)
	(assert (dengue))
	)	
	(defrule confirmandoHipotesis4
	?f <-(confirmaHipotesis)
	(hipotesis(tipo ?y))
	(test(eq ?y "meningitis"))
	=>
	(printout t "-51-")
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
  

