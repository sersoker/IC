
(deffacts personas
(Hombre Bryan)
(Mujer Jessyca)
(Mujer Azahara)
(Mujer Rufina)
(Hombre Julio)
)

(deffacts hijos_De
(hijo_De Jessyca Rufina)
(hijo_De Bryan Rufina)
(hijo_De Azahara Rufina)
(hijo_De Jessyca Julio)
(hijo_De Bryan Julio)
)

(deffacts matrimonios
(casado Julio Rufina)
)


(defrule detectaHermanos
(hijo_De ?hijo1 ?padre )
(hijo_De ?hijo2 ?padre )
=>
(assert (hermano ?hijo1 ?hijo2))
)


(defrule detectaCasados
(casado ?Padre ?Madre)
=>
(assert (casado ?Madre ?Padre))
)


(defrule pideDatos
=>
(printout t "Nombre familiar:"crlf)
(assert (buscoInfo (read))) )


(defrule buscaInformacion
(buscoInfo ?persona)
(hijo_De ?persona ?padre)
(hijo_De ?hijo ?persona)
(casado ?conyuge1 ?persona)
(casado ?persona ?conyuge2)
(hermano ?persona ?hermano1)
(hermano ?hermano2 ?persona)
=>
(printout t "Padre de:" ?hijo)
(printout t "Hijo de:" ?padre)
(printout t "Casado con:" ?conyuge1)
(printout t "Casado con:" ?conyuge2)
(printout t "Hermano de:" ?hermano1)
(printout t "Hermano de:" ?hermano2)


)