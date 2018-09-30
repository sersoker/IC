;;*********************************************
;;Hechos iniciales y Plantilla de sintomas
;;*********************************************
	(deftemplate sintomas
		(slot nombre (type STRING))
		(slot intensidad (type STRING) (allowed-strings "ns" "alta" "baja" "media"))
		(slot tiene (type SYMBOL) (allowed-symbols si no))
	)

	(deffacts sintomasIniciales
		(sintomas (nombre "dolor de cabeza") (intensidad "ns") (tiene no))
		(sintomas (nombre "tos")(intensidad  "ns") (tiene no))	
		(sintomas (nombre "dolor muscular")(intensidad  "ns") (tiene no))
		(sintomas (nombre "fiebre")(intensidad  "ns") (tiene no))
	)

;;**********************************
;;**********************************
;;********Menu Principal.***********
;;**********************************
;;**********************************
	(deffacts init
	  (troubleshoot-mode engine)
	  (menu-level engine main))
	  
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
	  "                  1.) Iniciar Sistema de Hipotesis." crlf
	  "                  0.) Salir." crlf crlf
	  "        Eleccion: " )
	  (bind ?response (read))
	  (assert (problem-response engine ?response))
	  (printout t crlf))
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
	)



;;**********************************
;;**********************************
;;*Modulo2.- Establecer Hipotesis.**
;;**********************************
;;********************************** 
	(defrule hipotesis1
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene no))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene no))
	=>
	(retract ?f)
	(assert (noEnfermo))	
	)
	
	(defrule hipotesisGripe
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad media) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert preguntarRigidezNuca)
	)
	
	(defrule hipotesisGripe2
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad baja) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert (preguntarRigidezNuca))
	)
	
	(defrule hipotesis2
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad media) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	(sintomas (nombre "rididez de nuca") (intensidad ?y)(tiene si))
	=>
	(retract ?f)
	(assert (default))
	)

	(defrule hipotesis3
	?<-(hipo)
	(noMen)
	(noDen)
	(sintomas(nombre "fiebre")(intensidad alta)(tiene si))
	(sintomas (nombre "ronchas")(intensidad ?y)(tiene no))
	=>
	(retract ?f)
	(assert (gripea))
	)

		
	(defrule hipotesisMen
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert (preguntarRigidezDolorNuca))
	)
	
	(defrule hipotesis4
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	(sintomas (nombre "rigidez de nuca") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert (menin))	
	)
	
	(defrule hipotesis5
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	(sintomas (nombre "dolor de nuca") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert (menin))	
	)
	
	(defrule hipotesis6
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene si))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene si))
	(sintomas (nombre "rigidez de nuca") (intensidad ?y) (tiene si))
	(sintomas (nombre "dolor de nuca") (intensidad ?y) (tiene si))
	=>
	(retract ?f)
	(assert (menin))	
	)

	(defrule hipotesisDen
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad alta) (tiene si))
	(sintomas (nombre "fiebre") (intensidad alta) (tiene si))
	=>
	(retract ?f)
	(assert (preguntaRonchas))
	)
	(defrule hipotesisDen2
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad alta) (tiene si))
	(sintomas (nombre "fiebre") (intensidad alta) (tiene si))
	=>
	(retract ?f)
	(assert (preguntaEpidemia))
	)
	
	(defrule hipotesis7
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad alta) (tiene si))
	(sintomas (nombre "fiebre") (intensidad alta) (tiene si))
	(sintomas (nombre "ronchas")(intensidad ?y)(tiene si))
	=>
	(retract ?f)
	(assert (dengue))
	)
	
	(defrule hipotesis6
	?f<-(hipo)
	(epidemiaDengue)
	=>
	(retract ?f)
	(assert (dengue))
	)	
	









 
  
 ;;************************
 ;;******Diagnostico*******
 ;;************************
(defrule fire-uno
	(declare (salience 50))
	(noEnfermo)
	=>
	(printout t "SALIDA SIN ENFERMEDAD" crlf)
)

(defrule fire-dos
	(declare (salience 40))
	(default)
	=>
	(printout t "SALIDA GRIPE" crlf)
)

(defrule fire-tres
	(declare (salience 30))
	(gripea)
	=>
	(printout t "SALIDA AH1N1" crlf)
)
  
 (defrule fire-cuatro
	(declare (salience 20))
	(menin)
	=>
	(printout t "SALIDA MENINGITIS" crlf)
)

 (defrule fire-cinco
	(declare (salience 10))
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
  

