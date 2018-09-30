;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;INDICE;;;;;;;;;;;INDICE;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;1.- Pregunta de enfermedad concreta
;;1.1.- Respuesta Afirmativa, iniciar sistema de pregunta
;;1.2.- Respuesta negativa, pregunta si se tienen sintomas
;;1.2.1.- Respuesta afirmatica, iniciar sistema de preguntas de actividades de riesgo y sintomas
;;1.2.2.- Respuesta negativa, Preguntar por actividades de riesgo
;;1.2.2.1.- Si se han realizado actividades de riesgo, preguntar por la esporidicidad de las mismas
;;
;; Template para la lista de actividades de riesgo y definicion de las mismas
(deftemplate riesgo
                (slot nombre (type STRING))
                (slot riesgo (type STRING) (allowed-strings "nulo" "alto" "bajo" "medio"))
)
(deffacts listaRiesgos
        (riesgo (nombre "Recepcion de sexo anal sin preservativo,con eyaculacion.")(riesgo "alto"))
        (riesgo (nombre "Recepcion de sexo vaginal sin preservativo, con eyaculacion")(riesgo "alto"))
        (riesgo (nombre "Recepcion de sexo anal sin eyaculacion")(riesgo "alto"))
        (riesgo (nombre "Recepcion de sexo vaginal sin eyaculacion")(riesgo "medio"))
        (riesgo (nombre "Penetracion anal sin preservativo")(riesgo "medio"))
        (riesgo (nombre "Penetracion vaginal sin preservativo")(riesgo "medio"))
        (riesgo (nombre "Recepcion de sexo Oro-Genital con eyaculacion")(riesgo "medio"))
        (riesgo (nombre "Sexo Oro-Genital sin eyaculacion")(riesgo "bajo"))
        (riesgo (nombre "Sexo Oro-Genital femenino")(riesgo "bajo"))
        (riesgo (nombre "Contacto con sangre contaminada")(riesgo "alto"))
        (riesgo (nombre "Recepcion Beso negro o annilingus sin barrera")(riesgo "nulo"))
        (riesgo (nombre "Magreos (Abrazos, besos, caricias, masajes)")(riesgo "nulo"))
        (riesgo (nombre "Mastubacion mutua")(riesgo "nulo"))
        (riesgo (nombre "BDSM sin intercambio de fluidos")(riesgo "nulo"))
        (riesgo (nombre "Felaciones o Cunnilingus con barrera")(riesgo "nulo"))
        (riesgo (nombre "Coito con barrera")(riesgo "nulo"))
        (riesgo (nombre "Compartir productos de higiene (maquinillas de afeitar, cepillos de dientes, etc.)")(riesgo "medio"))
        (riesgo (nombre "Compartir ropa")(riesgo "bajo"))
        (riesgo (nombre "Dormir en sitios nuevos o extraños")(riesgo "bajo"))
        (riesgo (nombre "Conductas monogamicas")(riesgo "nulo"))
        (riesgo (nombre "Conductas poligamicas")(riesgo "bajo"))
        (riesgo (nombre "Juguetes sin intercambio o con preservativo en cada intercambio")(riesgo "nulo"))
        (riesgo (nombre "Beso negro o annilingus sin barrera")(riesgo "alto"))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hechos por defecto para el inicio del sistema.   
        (deffacts suposicionesDefecto
                (preguntaNombre)
        )

;;**********************************
;;**********************************
;;********Menu Principal.***********
;;**********************************
;;**********************************
(defrule preguntaNombre
        ?p<-(preguntaNombre)
        =>
        (printout t crlf "Sistema experto para el asesoramiento de ETS & ITS:" crlf)
            (printout t
                " ¿Como te llamas?" crlf)

        (retract ?p)
        (assert (nombre (read)))
        (assert (troubleshoot-mode engine))
        (assert (menu-level engine main))
)

;Inicio
(defrule inicio
        (declare (salience 500))  
        (troubleshoot-mode engine)
        ?ml <- (menu-level engine main)
        ?nombre <- (nombre ?y)
        =>
        (retract ?ml)
        (printout t crlf "Hola "?y crlf)
        (printout t crlf crlf)
        (printout t
        "        Elegir una de las opciones" crlf
        "                  1.- Creo tener una enfermedad concreta." crlf
        "                  2.- Tengo sintomas. " crlf
        "                  3.- He tenido actividades de riesgo. " crlf
        "                  0.- Salir." crlf crlf
        "        Eleccion: " )
        (bind ?response (read))
        (assert (problem-response engine ?response))
        (printout t crlf)
)

;;**************************************************
;; Opcion "1" Enfermedad concreta*******************
;;**************************************************
(defrule menu1
          (troubleshoot-mode engine)
          (problem-response engine 1)
        =>
          (printout t crlf"¿Que enfermedad crees tener?:" crlf crlf)
          (printout t crlf "EN CONSTRUCCION " crlf)
        ) 

;;**************************************************
;; Opcion "2" Sintomas Concretos *******************
;;**************************************************
(defrule menu2
          (troubleshoot-mode engine)
          (problem-response engine 2)
        =>
          (printout t crlf"¿Has tenido alguna actividad de riesgo de la siguiente lista? (Numero de grupo mas alto):" crlf crlf)
          (assert (mostrarListaRiesgos))
        ) 

(defrule gr31 ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 3 ****" crlf))
(defrule mostrarListaRiesgos31
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "alto"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr21 ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 2 ****" crlf))
(defrule mostrarListaRiesgos21
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "medio"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr11 ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 1 ****" crlf))
(defrule mostrarListaRiesgos11
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "bajo"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr01 ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 0 ****" crlf))
(defrule mostrarListaRiesgos01
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "nulo"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule mostrarListaRiesgos2
           ?f <-(mostrarListaRiesgos)
        =>
           (printout t crlf crlf ":::> " )
           (assert (cantidad (read)))
           (assert (riesgoPorSintomas))
)
         

;;**************************************************
;; Opcion "3" Actividades de riesgo*****************
;;**************************************************
(defrule menu3
          (troubleshoot-mode engine)
          (problem-response engine 3)
        =>
          (printout t crlf"¿Has tenido alguna actividad de riesgo de la siguiente lista? (Numero de grupo mas alto):" crlf crlf)
          (assert (mostrarListaRiesgos2))
        ) 
(defrule gr32 ?f <-(mostrarListaRiesgos2) => (printout t crlf"****GRUPO 3 ****" crlf))
(defrule mostrarListaRiesgos32
           ?f <-(mostrarListaRiesgos2)
           ?r <-(riesgo (nombre ?x)(riesgo "alto"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr22 ?f <-(mostrarListaRiesgos2) => (printout t crlf"****GRUPO 2 ****" crlf))
(defrule mostrarListaRiesgos22
           ?f <-(mostrarListaRiesgos2)
           ?r <-(riesgo (nombre ?x)(riesgo "medio"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr12 ?f <-(mostrarListaRiesgos2) => (printout t crlf"****GRUPO 1 ****" crlf))
(defrule mostrarListaRiesgos12
           ?f <-(mostrarListaRiesgos2)
           ?r <-(riesgo (nombre ?x)(riesgo "bajo"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr02 ?f <-(mostrarListaRiesgos2) => (printout t crlf"****GRUPO 0 ****" crlf))
(defrule mostrarListaRiesgos02
           ?f <-(mostrarListaRiesgos2)
        =>
           (printout t crlf crlf ":::> " )
           (assert (cantidad (read)))
           (assert (riesgoPorActividad))
)


        







;;***************************************
;; Salidas sin actividad de riesgo*
;;***************************************
(defrule noRiesgoPorSintoma
        ?f<- (cantidad ?x)
        ?r<- (riesgoPorSintomas)
        (test (eq ?x 0))
        =>
        (printout t crlf "El grupo indicado no supone ningun riesgo para tu salud, tus sintomas pueden deberse a una enfermedad comun." crlf)
        (printout t  "No te preocupes y consulta con tu medico de cabecera."crlf)
        (assert (problem-response engine 0))
)

(defrule noRiesgoPorActividad
        ?f<- (cantidad ?x)
        ?r<- (riesgoPorActividad)
        (test (eq ?x 0))
        =>
        (printout t crlf "El grupo indicado no supone ningun riesgo dentro del margen de ninguna ETS/ITS." crlf)
        (printout t  "No obstante si dudas si has podido ser participe de alguna actividad de riesgo, puedes ir a un centro especializado para que te realicen pruebas adecuadas." crlf)
        (assert (problem-response engine 0))

)
;;***************************************
;; Opcion "0" del menu   SALIR*
;;***************************************
(defrule salir
  (troubleshoot-mode engine)
  (problem-response engine 0)
=>
(printout t " ******************************************************************************"crlf)
(printout t "                   Saliendo...................................................." crlf )
(printout t " ******************************************************************************"crlf crlf) 
(halt))
  