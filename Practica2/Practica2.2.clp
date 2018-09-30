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
	(defrule hipotesis
	?f<-(hipo)
	(sintomas (nombre "dolor de cabeza") (intensidad ?y) (tiene no))
	(sintomas (nombre "fiebre") (intensidad ?y) (tiene no))
	=>
	(assert (noEnfermo))	
	)
  
  
  
  
  ;************************
  ;******HIPOTESIS*********
  ;************************
(defrule fire-first
	(declare (salience 50))
	(noEnfermo)
	=>
	(printout t "SALIDA SIN ENFERMEDAD" crlf)
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
  

