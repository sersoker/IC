;; Template para la lista de actividades de riesgo y definicion de las mismas
(deftemplate riesgo
                (slot nombre (type STRING))
                (slot riesgo (type STRING) (allowed-strings "nulo" "alto" "bajo" "medio"))
)
(deffacts listaRiesgos
        (riesgo (nombre "Recepcion de sexo anal sin preservativo,con eyaculacion.")(riesgo "alto"))
        (riesgo (nombre "Penetracion vaginal sin preservativo, con eyaculacion")(riesgo "alto"))
        (riesgo (nombre "Recepcion de sexo anal sin eyaculacion")(riesgo "alto"))
        (riesgo (nombre "Penetracion anal sin preservativo")(riesgo "medio"))
        (riesgo (nombre "Penetracion vaginal sin preservativo")(riesgo "medio"))
        (riesgo (nombre "Recepcion de sexo Oro-Genital con eyaculacion")(riesgo "medio"))
        (riesgo (nombre "Sexo Oro-Genital sin eyaculacion")(riesgo "bajo"))
        (riesgo (nombre "Sexo Oro-Genital con eyaculación")(riesgo "alto"))
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
;; Template para enfermedades y sus sintomas caracteristicos
(deftemplate enfermedad
              (slot nombre)
              (slot sintoma))
(deffacts listaEnfermedadesSintomas
        (enfermedad (nombre "gonorrea")(sintoma"aumento de frecuencia urinaria"))
        (enfermedad (nombre "gonorrea")(sintoma"dolor al orinar"))
        (enfermedad (nombre "gonorrea")(sintoma"ardor al orinar"))
        (enfermedad (nombre "gonorrea")(sintoma"secrecion por el pene"))
        (enfermedad (nombre "gonorrea")(sintoma"enrojecimiento de uretra"))
        (enfermedad (nombre "gonorrea")(sintoma"inflamacion de uretra"))
        (enfermedad (nombre "gonorrea")(sintoma"sensibilidad testicular"))
        (enfermedad (nombre "gonorrea")(sintoma"inflamacion testicular"))
        (enfermedad (nombre "gonorrea")(sintoma"dolor de garganta"))

        (enfermedad (nombre "sifilis")(sintoma"ulceras indoloras"))
        (enfermedad (nombre "sifilis")(sintoma"ganglios inflamados"))
        (enfermedad (nombre "sifilis")(sintoma"erupcion cutanea"))
        (enfermedad (nombre "sifilis")(sintoma"verrugas"))
        (enfermedad (nombre "sifilis")(sintoma"fiebre"))
        (enfermedad (nombre "sifilis")(sintoma"indisposicion"))
        (enfermedad (nombre "sifilis")(sintoma"dolor muscular"))
        (enfermedad (nombre "sifilis")(sintoma"dolor articular"))
        (enfermedad (nombre "sifilis")(sintoma"cambios en la vision"))

        (enfermedad (nombre "VPH")(sintoma"verrugas"))

        (enfermedad (nombre "VIH")(sintoma"escalofrios"))
        (enfermedad (nombre "VIH")(sintoma"fiebre"))
        (enfermedad (nombre "VIH")(sintoma"sarpullido"))
        (enfermedad (nombre "VIH")(sintoma"sudores"))
        (enfermedad (nombre "VIH")(sintoma"ganglios inflamados"))
        (enfermedad (nombre "VIH")(sintoma"debilidad"))
        (enfermedad (nombre "VIH")(sintoma"perdida de peso"))

        (enfermedad (nombre "herpes")(sintoma"ulceras"))
        (enfermedad (nombre "herpes")(sintoma"llagas"))
        (enfermedad (nombre "herpes")(sintoma"ampollas"))
        (enfermedad (nombre "herpes")(sintoma"comezon"))
        (enfermedad (nombre "herpes")(sintoma"ardor de labios"))
        (enfermedad (nombre "herpes")(sintoma"ardor de boca"))
        (enfermedad (nombre "herpes")(sintoma"hormigueo en labios"))
        (enfermedad (nombre "herpes")(sintoma"hormigueo en boca"))
        (enfermedad (nombre "herpes")(sintoma"fiebre"))
        (enfermedad (nombre "herpes")(sintoma"dolor de garganta"))
        (enfermedad (nombre "herpes")(sintoma"dolor al tragar"))
        (enfermedad (nombre "herpes")(sintoma"ganglios inflamados"))
        (enfermedad (nombre "herpes")(sintoma"inapetencia"))
        (enfermedad (nombre "herpes")(sintoma"malestar"))
        (enfermedad (nombre "herpes")(sintoma"dolor muscular"))

        (enfermedad (nombre "ladillas")(sintoma"enrojecimiento"))
        (enfermedad (nombre "ladillas")(sintoma"comezon"))
        (enfermedad (nombre "ladillas")(sintoma"picor"))

        (enfermedad (nombre "sarna")(sintoma"picor"))
        (enfermedad (nombre "sarna")(sintoma"comezon"))
        (enfermedad (nombre "sarna")(sintoma"erupcion"))
        (enfermedad (nombre "sarna")(sintoma"ulceras"))
        (enfermedad (nombre "sarna")(sintoma"abrasiones"))

        (enfermedad (nombre "clamidia")(sintoma"ardor al orinar"))
        (enfermedad (nombre "clamidia")(sintoma"secrecion por el pene"))
        (enfermedad (nombre "clamidia")(sintoma"secrecion por el recto"))
        (enfermedad (nombre "clamidia")(sintoma"dolor testicular"))
        (enfermedad (nombre "clamidia")(sintoma"sensibilidad testicular"))
        (enfermedad (nombre "clamidia")(sintoma"dolor rectal"))


        (enfermedad (nombre "hepatitis")(sintoma"inapetencia"))
        (enfermedad (nombre "hepatitis")(sintoma"fatiga"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor muscular"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor articular"))
        (enfermedad (nombre "hepatitis")(sintoma"nauseas"))
        (enfermedad (nombre "hepatitis")(sintoma"vomitos"))
        (enfermedad (nombre "hepatitis")(sintoma"piel amarilla"))
        (enfermedad (nombre "hepatitis")(sintoma"orina turbia"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor de abdomen"))
        (enfermedad (nombre "hepatitis")(sintoma"hinchazon abdominal"))
        (enfermedad (nombre "hepatitis")(sintoma"heces arcillosas"))
        (enfermedad (nombre "hepatitis")(sintoma"heces palidas"))
        (enfermedad (nombre "hepatitis")(sintoma"fiebre"))
        (enfermedad (nombre "hepatitis")(sintoma"picazon"))
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
        "                  10.- Informacion del Sistema." crlf crlf
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
           (assert (grupo (read)))
           (assert (riesgoPorSintomas))
)

(defrule espoSintomas
        ?f<- (grupo ?x)
        ?r<- (riesgoPorSintomas)
        (test (neq ?x 0))
        =>
        (printout t crlf " Las actividades indicadas anteriormente han sido esporadicas (si) o continuadas (no)." crlf)
        (assert (esporadicasS (read)))
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
           ?r <-(riesgo (nombre ?x)(riesgo "nulo"))
        =>
           (printout t crlf crlf ":::> " )
           (assert (grupo (read)))
           (assert (riesgoPorActividad))
           (retract ?f)
)

(defrule espoActividad
        ?f<- (grupo ?x)
        ?r<- (riesgoPorActividad)
        (test (neq ?x 0))
        =>
        (printout t crlf " Las actividades indicadas anteriormente han sido esporadicas (si) o continuadas (no)." crlf)
        (assert (esporadicasA (read)))
)
        
(defrule noEspoAct
    ?f<-(esporadicasA ?x)
        (test (eq ?x no))
        =>
       (printout t crlf " Las actividades indicadas anteriormente suponen un alto riesgo para tu salud.)." crlf)
       (printout t crlf " Por esta misma razon se te recomienda que te realices pruebas inmediatas en un centro especializado.)." crlf crlf)

)
(defrule siEspoAct1
    ?f<-(esporadicasA ?x)
    ?z<- (grupo ?y)
    (test (eq ?y 1))
        (test (eq ?x si))
        =>
       (printout t crlf " Las actividades indicadas anteriormente suponen un riesgo bajo para tu salud.)." crlf)
       (printout t crlf " No obstante si encuentras algun indicio extraño se te re comienda que acudas a un centro especializado.)." crlf crlf)

)
(defrule siEspoAct23
    ?f<-(esporadicasA ?x)
    ?z<- (grupo ?y)
    (or
    (test (eq ?y 2))
    (test (eq ?y 3))
    )
        (test (eq ?x si))
        =>
       (printout t crlf " Indica cuanto hace (de la forma mas aproximada posible) de la primera accion de riesgo de la lista anterior.)." crlf)
       (printout t crlf " Menos de 1 mes:                Opcion 0" )
       (printout t crlf " Aproximadamente 1 mes:         Opcion 1" )
       (printout t crlf " Entre 1 y 2 meses:             Opcion 2" )
       (printout t crlf " Entre 3 y 6 meses:             Opcion 3" )
       (printout t crlf " Entre 6 y 12 meses:            Opcion 4" )
       (printout t crlf " Mas de 1 año:                 Opcion 5" crlf)
       (printout t  "Opcion:.:  ") (assert (periodo (read)))
)

;;Mensajes para periodos de visita proximos.
(defrule periodo0
  ?f<-(periodo ?x)
  (test (eq ?x 0))
  =>
  (printout t crlf  "Hace muy poco desde la actividad de riesgo, los sintomas tardaran en aparecer algo mas."crlf)
  (printout t  "Vuelve a consultar en 7 dias. En caso de que notes algo extraño acude inmediatamente a un especialista."crlf)
)
(defrule periodo1
  ?f<-(periodo ?x)
  (test (eq ?x 1))
  =>
  (printout t crlf "En este margen temporal la gran mayoria de ITS mostrarian algun sintoma."crlf)
  (printout t  "Si no tienes ninguno vuelve a consultar en aproximadamente 15 dias."crlf)
)
(defrule periodo2
  ?f<-(periodo ?x)
  (test (eq ?x 2))
  =>
  (printout t crlf "Casi todas las ITS mas comunes muestran sintomas en este periodo de tiempo."crlf)
  (printout t  "Vuelve a consultar en aproximadamente un mes o mes y medio."crlf)
)
(defrule periodo3
  ?f<-(periodo ?x)
  (test (eq ?x 3))
  =>
  (printout t crlf "La aparicion de sintomas en este periodo es relevante, si no muestras ninguno puedes volver en 3 meses para consultar de nuevo."crlf)
)
(defrule periodo4
  ?f<-(periodo ?x)
  (test (eq ?x 4))
  =>
(printout t crlf "Si en este tiempo no has mostrado ningun sintoma es muy complicado que tengas alguna ITS al menos las mas comunes."crlf)
  (printout t  "Vuelve a consultar en 6 meses, estate atento a inapetencia o flojera/dolor generalizado, son los unicos sintomas destacables de las enfermedades con periodos de incubacion superiores."crlf)
)
(defrule periodo5
  ?f<-(periodo ?x)
  (test (eq ?x 5))
  =>
  (printout t crlf "Hay pocas ITS con periodos de incubacion tan amplios por lo que no deberias preocuparte."crlf)
  (printout t  "Vuelve a consultar en 6 meses y/o pide pruebas de enfermedades asintomaticas a tu medico(casos muy extraños)."crlf)
)

(defrule periodos
  ?f<-(periodo ?x)
  =>
  (assert (problem-response engine 0))
)

;;***************************************
;; Salidas sin actividad de riesgo*
;;***************************************
(defrule noRiesgoPorSintoma
        ?f<- (grupo ?x)
        ?r<- (riesgoPorSintomas)
        (test (eq ?x 0))
        =>
        (printout t crlf "El grupo indicado no supone ningun riesgo para tu salud, tus sintomas pueden deberse a una enfermedad comun." crlf)
        (printout t  "No te preocupes y consulta con tu medico de cabecera."crlf)
        (assert (problem-response engine 0))
)

(defrule noRiesgoPorActividad
        ?f<- (grupo ?x)
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

;;***************************************
;; Opcion "10" del menu Informacion*
;;***************************************
(defrule informacion
  (troubleshoot-mode engine)
  (problem-response engine 10)
=>
(printout t " ******************************************************************************"crlf)
(printout t " Sistema Experto creado por Bryan Moreno Picamán para la asignatura IC de la UGR" crlf )
(printout t " Se permite el uso y modificacion nombrando siempre al autor." crlf )
(printout t " ******************************************************************************"crlf crlf) 
        (assert (troubleshoot-mode engine))
        (assert (menu-level engine main)) 
)