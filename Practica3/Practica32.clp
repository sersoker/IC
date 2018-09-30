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
              (slot sintoma)
              (slot tiene))
(deffacts listaEnfermedadesSintomas
        (enfermedad (nombre "gonorrea")(sintoma"aumento de frecuencia urinaria")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"dolor al orinar")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"ardor al orinar")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"secrecion por el pene")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"enrojecimiento de uretra")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"inflamacion de uretra")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"sensibilidad testicular")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"inflamacion testicular")(tiene "no"))
        (enfermedad (nombre "gonorrea")(sintoma"dolor de garganta")(tiene "no"))

        (enfermedad (nombre "sifilis")(sintoma"ulceras indoloras")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"ganglios inflamados")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"erupcion cutanea")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"verrugas")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"fiebre")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"indisposicion")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"dolor muscular")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"dolor articular")(tiene "no"))
        (enfermedad (nombre "sifilis")(sintoma"cambios en la vision")(tiene "no"))

        (enfermedad (nombre "vph")(sintoma"verrugas")(tiene "no"))

        (enfermedad (nombre "vih")(sintoma"escalofrios")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"fiebre")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"sarpullido")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"sudores")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"ganglios inflamados")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"debilidad")(tiene "no"))
        (enfermedad (nombre "vih")(sintoma"perdida de peso")(tiene "no"))

        (enfermedad (nombre "herpes")(sintoma"ulceras")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"llagas")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"ampollas")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"comezon")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"ardor de labios")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"ardor de boca")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"hormigueo en labios")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"hormigueo en boca")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"fiebre")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"dolor de garganta")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"dolor al tragar")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"ganglios inflamados")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"inapetencia")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"malestar")(tiene "no"))
        (enfermedad (nombre "herpes")(sintoma"dolor muscular")(tiene "no"))

        (enfermedad (nombre "ladillas")(sintoma"enrojecimiento")(tiene "no"))
        (enfermedad (nombre "ladillas")(sintoma"comezon")(tiene "no"))
        (enfermedad (nombre "ladillas")(sintoma"picor")(tiene "no"))

        (enfermedad (nombre "sarna")(sintoma"picor")(tiene "no"))
        (enfermedad (nombre "sarna")(sintoma"comezon")(tiene "no"))
        (enfermedad (nombre "sarna")(sintoma"erupcion")(tiene "no"))
        (enfermedad (nombre "sarna")(sintoma"ulceras")(tiene "no"))
        (enfermedad (nombre "sarna")(sintoma"abrasiones")(tiene "no"))

        (enfermedad (nombre "clamidia")(sintoma"ardor al orinar")(tiene "no"))
        (enfermedad (nombre "clamidia")(sintoma"secrecion por el pene")(tiene "no"))
        (enfermedad (nombre "clamidia")(sintoma"secrecion por el recto")(tiene "no"))
        (enfermedad (nombre "clamidia")(sintoma"dolor testicular")(tiene "no"))
        (enfermedad (nombre "clamidia")(sintoma"sensibilidad testicular")(tiene "no"))
        (enfermedad (nombre "clamidia")(sintoma"dolor rectal")(tiene "no"))


        (enfermedad (nombre "hepatitis")(sintoma"inapetencia")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"fatiga")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor muscular")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor articular")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"nauseas")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"vomitos")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"piel amarilla")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"orina turbia")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"dolor de abdomen")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"hinchazon abdominal")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"heces arcillosas")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"heces palidas")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"fiebre")(tiene "no"))
        (enfermedad (nombre "hepatitis")(sintoma"picazon")(tiene "no"))
)
;; Template para enfermedades y los grupos en los que se pueden dar
(deftemplate enf
              (slot nombre)
              (slot grupo))
(deffacts grupoeenf
    (enf (nombre "hepatitis") (grupo 3))
    (enf (nombre "hepatitis") (grupo 2))
    (enf (nombre "hepatitis") (grupo 1))
    (enf (nombre "gonorrea") (grupo 2))
    (enf (nombre "gonorrea") (grupo 3))
    (enf (nombre "sifilis") (grupo 2))
    (enf (nombre "sifilis") (grupo 3))
    (enf (nombre "sarna") (grupo 3))
    (enf (nombre "sarna") (grupo 2))
    (enf (nombre "sarna") (grupo 1))
    (enf (nombre "vph") (grupo 2))
    (enf (nombre "vph") (grupo 3))
    (enf (nombre "vih") (grupo 3))
    (enf (nombre "vih") (grupo 2))
    (enf (nombre "ladillas") (grupo 1))
    (enf (nombre "ladillas") (grupo 2))
    (enf (nombre "ladillas") (grupo 3))
    (enf (nombre "clamidia") (grupo 3))
    (enf (nombre "clamidia") (grupo 2))
    (enf (nombre "herpes") (grupo 3))
    (enf (nombre "herpes") (grupo 2))
    (enf (nombre "herpes") (grupo 1))
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
        (printout t  "[------------------------------------]:" crlf)
            (printout t
                "[--------- ¿Como te llamas? --------]" crlf)
        (printout t  "[------------------------------------]:" crlf)
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
        (printout t crlf "HOLA "?y crlf)
        (printout t  "Bienvenido al Sistema Experto para las ITS en Hombres "?y crlf)
        (printout t crlf crlf)
        (printout t
        "        Elegir una de las opciones" crlf
        "                  1.- Creo tener una enfermedad concreta." crlf
        "                  2.- Tengo sintomas. " crlf
        "                  3.- He tenido actividades de riesgo. " crlf
        "                  0.- Salir." crlf
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
    (printout t crlf"(Enfermedades que soporta el sistema: sifilis, gonorrea, vih, vph, vhs, hepatitis, ladillas, sarna, clamidia):" crlf )
    (printout t crlf"(En minusculas y entre comillas):" crlf )
    (printout t crlf"¿Que enfermedad crees tener?:" crlf crlf)
    (assert (enfLeida (read)))
) 

(defrule comprobarEnf
  ?f<-(enfLeida ?x)
  (not (enfermedad (nombre ?x)(sintoma ?y)))
  =>
    (printout t crlf "La enfermedad introducida no entra en los margenes de este sistema. " crlf)
    (printout t crlf "Te aconsejamos que copnsultes con tu medico sobre este tema. " crlf)
    (assert (problem-response engine 0))
  )

(defrule comprobarEnf2
  (not(grupo ?p))
  ?f<-(enfLeida ?x)
  (enfermedad (nombre ?x)(sintoma ?y))
  =>
   (printout t crlf"¿Has tenido alguna actividad de riesgo de la siguiente lista? (Numero de grupo mas alto):" crlf crlf)
    (assert (mostrarListaRiesgos3))
  )

(defrule gr33 (not(grupo ?p)) ?f <-(mostrarListaRiesgos3) => (printout t crlf"****GRUPO 3 ****" crlf))
(defrule mostrarListaRiesgos33
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos3)
           ?r <-(riesgo (nombre ?x)(riesgo "alto"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr23 (not(grupo ?p)) ?f <-(mostrarListaRiesgos3) => (printout t crlf"****GRUPO 2 ****" crlf))
(defrule mostrarListaRiesgos23
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos3)
           ?r <-(riesgo (nombre ?x)(riesgo "medio"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr13 (not(grupo ?p)) ?f <-(mostrarListaRiesgos3) => (printout t crlf"****GRUPO 1 ****" crlf))
(defrule mostrarListaRiesgos13
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos3)
           ?r <-(riesgo (nombre ?x)(riesgo "bajo"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr03 (not(grupo ?p)) ?f <-(mostrarListaRiesgos3) => (printout t crlf"****GRUPO 0 ****" crlf))
(defrule mostrarListaRiesgos03
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos3)
           ?r <-(riesgo (nombre ?x)(riesgo "nulo"))
        =>
          (printout t "[ " ?x " ] ")
)
(defrule mostrarListaRiesgos3
    (not(grupo ?p))
    ?f <-(mostrarListaRiesgos3)
    =>
    (printout t crlf crlf ":::> " )
    (assert (grupo (read)))
    (assert (enfermedadConcreta))
)

(defrule compruebaGrupo2
    ?f<-(enfermedadConcreta)
    ?g<-(grupo ?p)
    ?h<-(enfLeida ?x)
    ?m<-(enf(nombre ?x)(grupo ?p))
    =>
    (retract  ?f)
    (assert (sintomasEspecificos))
  )

(defrule compruebaGrupo
    ?f<-(enfermedadConcreta)
    ?g<-(grupo ?p)
    ?h<-(enfLeida ?x)
    (not (enf(nombre ?x)(grupo ?p)))
    =>
    (printout t crlf crlf "La enfermedad introducida no concuerda con el grupo de riesgo, te redirigimos a la seleccion de sintomas." )
    (assert (riesgoPorSintomas))
    (retract  ?f)
    (retract  ?h)
  )


;;PREGUNTA POR SINTOMAS ESPECIFICOS DE UNA ENFERMEDAD
(defrule sintomasEspecificos
  ?f<-(sintomasEspecificos)
  ?h<-(enfLeida ?x)
  ?e<-(enfermedad (nombre ?x)(sintoma ?y)(tiene "no"))
  (not (2sintoma))
  =>
  (printout t crlf crlf "¿Tienes el siguiente sintoma?:" ?y crlf)
  (assert (respuesta (read)))
  (modify ?e (tiene ns))
  (retract ?f)
)

(defrule compruebaRespuesta
?f<-(respuesta ?x)
(test(eq ?x si))
(not (1sintoma))
?h<-(enfLeida ?z)
=>
(retract ?f)
(assert (1sintoma))
(assert (sintomasEspecificos))
)

(defrule compruebaRespuesta2
?f<-(respuesta ?x)
(test(eq ?x si))
?s<-(1sintoma)
=>
(retract ?s)
(retract ?f)
(assert (2sintoma))
(assert (hacerPruebas2))
(assert (mensajeEnfermedad))
(assert (sintomasEspecificos))
)

(defrule compruebaRespuesta3
?f<-(respuesta ?x)
(test(eq ?x no))
=>
(retract ?f)
(assert (sintomasEspecificos))
)

;;**************************************************
;; Opcion "2" Sintomas Concretos *******************
;;**************************************************
(defrule menu2
        (not(grupo ?p))
          (troubleshoot-mode engine)
          (problem-response engine 2)
        =>
          (printout t crlf"¿Has tenido alguna actividad de riesgo de la siguiente lista? (Numero de grupo mas alto ):" crlf crlf)
          (assert (mostrarListaRiesgos))
        ) 

(defrule gr31 (not(grupo ?p)) ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 3 ****" crlf))
(defrule mostrarListaRiesgos31
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "alto"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr21 (not(grupo ?p)) ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 2 ****" crlf))
(defrule mostrarListaRiesgos21
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "medio"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr11 (not(grupo ?p)) ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 1 ****" crlf))
(defrule mostrarListaRiesgos11
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "bajo"))
        =>
          (printout t "[ " ?x " ] ")
         )
(defrule gr01 (not(grupo ?p)) ?f <-(mostrarListaRiesgos) => (printout t crlf"****GRUPO 0 ****" crlf))
(defrule mostrarListaRiesgos01
          (not(grupo ?p))
           ?f <-(mostrarListaRiesgos)
           ?r <-(riesgo (nombre ?x)(riesgo "nulo"))
        =>
          (printout t "[ " ?x " ] ")
)
(defrule mostrarListaRiesgos2
    (not(grupo ?p))
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

(defrule noEspoSin
    ?f<-(esporadicasS ?x)
    (test (eq ?x no))
    =>
    (assert (hacerPruebas)) 
)

(defrule siEspoSin1
    ?f<-(esporadicasS ?x)
    ?z<- (grupo ?y)
    (test (eq ?y 1))
    (test (eq ?x si))
    =>
    (printout t crlf " Las actividades indicadas anteriormente suponen un riesgo bajo para tu salud.)." crlf)
    (printout t crlf " No obstante si encuentras algun indicio extraño se te re comienda que acudas a un centro especializado.)." crlf crlf)
)

(defrule siEspoSin23
   ?f<-(esporadicasS ?x)
   ?z<- (grupo ?y)
   (or
    (test (eq ?y 2))
    (test (eq ?y 3))
   )
   (test (eq ?x si))
   =>
   (assert (preguntaSintomas))
)

(defrule preguntaSintomas
  ?f<-(preguntaSintomas)
  =>
  (printout t crlf " (*****-1 para salir*****)." crlf)
  (printout t crlf " Indicar (entre comillas) que sintoma tienes:." crlf)
  (assert (sintoma (read)))
  (retract ?f)
)     

(defrule compruebasalida
  ?f<- (sintoma ?x)
  (test (eq ?x -1))
  =>
  (assert (problem-response engine 0))
)

(defrule compruebaSintomas
  ?f<- (sintoma ?x)
 (enfermedad (nombre ?j)(sintoma ?x))
 =>
(assert (hacerPruebas))
(assert (mensajeSintoma))
(assert (calculaEnfermedades))
(assert (mensajeEnfermedad))
)

(defrule calculaEnfermedadesPorSintomas
  ?f<- (sintoma ?x)
  ?k<-(calculaEnfermedades)
  (enfermedad (nombre ?j)(sintoma ?x))
  (not(enfLeida ?j))
  =>
  (assert (enfLeida ?j))
  )

(defrule compruebaSintomas2
  ?f<- (sintoma ?x)
 (not(enfermedad (nombre ?j)(sintoma ?x)))
 =>
 (retract ?f)
(printout t crlf " Indica (entre comillas) que otro sintoma tienes:." crlf)
(assert (sintoma (read)))
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
          (printout t "[ " ?x " ] ")
)

(defrule mostrarListaRiesgos1
    (not(grupo ?p))
    ?f <-(mostrarListaRiesgos2)
    =>
     (printout t crlf crlf ":::> " )
     (assert (grupo (read)))
     (assert (riesgoPorActividad))
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
       (assert (hacerPruebas)) 
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


;;***********************************************************
;;Mensajes Especificos de las enfermedades con recomendaciones
;;***********************************************************
(defrule mensajeEnfermedadGonorrea
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "gonorrea"))
    =>
   (printout t crlf " Parece ser que tienes indicios de gonorrea." crlf)
   (printout t crlf " Evita el consumo de alcohol, e intenta mantener las areas genitales secas y no muy calientes." crlf)
)
(defrule mensajeEnfermedadSifilis
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "sifilis"))
    =>
   (printout t crlf " Parece ser que tienes indicios de sifilis." crlf)
   (printout t crlf " No tocar las areas afectadas y evitar mantener relaciones para evitar el contagio." crlf)
)

(defrule mensajeEnfermedadVPH
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "vph"))
    =>
   (printout t crlf " Parece ser que tienes indicios de VPH (Virus del Papiloma Humano)." crlf)
   (printout t crlf " Si finalmente es descartado se te recomienda una vacunacion." crlf)
)

(defrule mensajeEnfermedadVIH
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "vih"))
    =>
   (printout t crlf " Parece ser que tienes indicios de VIH." crlf)
   (printout t crlf " Evita mantener relaciones para evitar el posible contagio." crlf)
)

(defrule mensajeEnfermedadHerpes
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "herpes"))
    =>
   (printout t crlf " Parece ser que tienes indicios de herpes." crlf)
   (printout t crlf " Evita el contacto del area afectada con otras areas como manos, boca, pies, etc." crlf)
)

(defrule mensajeEnfermedadLadillas
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "ladillas"))
    =>
   (printout t crlf " Parece ser que tienes indicios de ladillas." crlf)
   (printout t crlf " Si tienes pareja se recomienda que los dos tengan estas consideraciones." crlf)
   (printout t crlf " No compartir ropa ni cama con otra gentey minimizar el contacto intimo lo maximo posible." crlf)
)

(defrule mensajeEnfermedadSarna
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "sarna"))
    =>
   (printout t crlf " Parece ser que tienes indicios de Sarna." crlf)
   (printout t crlf " Lavar ropa, sabanas, etc. con agua caliente, si no se puede, retirarlos de contacto por 3 días al menos, aspirar todas las zonas expuestas." crlf)
   (printout t crlf " Evita mantener relaciones para evitar el posible contagio." crlf)
)

(defrule mensajeEnfermedadClamidia
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "clamidia"))
    =>
   (printout t crlf " Parece ser que tienes indicios de Clamidia." crlf)
   (printout t crlf " Si tienes pareja se recomienda que los dos tengan estas consideraciones." crlf)
   (printout t crlf " Esperar 7 dias al terminar el tratamiento (coo minimo) para volver a tener relaciones." crlf)
   (printout t crlf " Se recomiendan pruebas para otras enfermedades comunes, asi como una evaluacion de control en las 4 semanas posteriores al tratamiento." crlf)
   (printout t crlf " Evita el consumo de alcohol, e intenta mantener las areas genitales secas y no muy calientes." crlf)
)

(defrule mensajeEnfermedadHepatitis
    ?q<- (mensajeEnfermedad)
    ?f<-(enfLeida ?x)
    (test (eq ?x "hepatitis"))
    =>
   (printout t crlf " Parece ser que tienes indicios de Hepatitis." crlf)
   (printout t crlf " Evita el consumo de alcohol, e intenta mantener las areas genitales secas y no muy calientes." crlf)
)

;;***************************************
;; ********Mensajes de salida************
;;***************************************
(defrule pocasPosiMen
        ?r<- (pocasPosibilidades)
        =>
        (printout t crlf "No tienes ningun sintoma especialmente caracteristico de ninguna ITS." crlf)
        (printout t  "No obstante este sistema no es 100% fiable, si crees que puede existir riesgo real te aconsejamos acudir a un centro especializado."crlf)
        (assert (problem-response engine 0))
)

(defrule hacerPruebas
        ?r<- (hacerPruebas)
        =>
       (printout t crlf " Se te recomienda que acudas a un centro especializado para realizarte pruebas a la mayor brevedad." crlf)
       (printout t crlf " Segun lo que has indicado al sistema tiene un alto indice de riesgo para tu salud, por eso se te recomienda que te realices pruebas inmediatas en un centro especializado.)." crlf crlf)
       (assert (problem-response engine 0))
)

(defrule hacerPruebas2
        ?r<- (hacerPruebas2)
        =>
       (printout t crlf " Se te recomienda que acudas a un centro especializado para realizarte pruebas a la mayor brevedad." crlf)
       (printout t crlf " Segun lo que has indicado al sistema, parece que tiene mas de un sintoma caracteristico de la enfermedad que sospecha." crlf crlf)
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
(printout t crlf crlf crlf " ******************************************************************************"crlf)
(printout t " Sistema Experto creado por Bryan Moreno Picamán para la asignatura IC de la UGR" crlf )
(printout t " Se permite el uso y modificacion nombrando siempre al autor." crlf )
(printout t " ******************************************************************************"crlf crlf) 
(printout t " Para usar el sistema sigue las indicaciones del mismo." crlf )
(printout t " Se recuerda que es un programa orientativo y en ningun caso debe sustituir la visita y/u opinion de un medico real." crlf )
(printout t " El sistema se centra principalmente en las siguientes enfermedades: Gonorrea, Sifilis, Herpes, VIH, VPH, Ladillas, Sarna, Clamidia y Hepatitis (B y C)." crlf )
(printout t " ******************************************************************************"crlf crlf crlf crlf crlf) 

  (assert (troubleshoot-mode engine))
  (assert (menu-level engine main)) 
)