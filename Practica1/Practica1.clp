(clear)
(deffacts personas
(Hombre Bryan)
(Mujer Jessyca)
(Mujer Azahara)
(Mujer Rufina)
(Hombre Julio)
(Hombre Antonio)
(Mujer Pilar)
(Hombre Evelio)
(Mujer Lola)
(Hombre Sergio)
(Mujer Sonia)
(Mujer Antonia)
(Mujer Carolina)
(Mujer CarolinaA)
(Hombre Santiago)
)

(deffacts hijos_De
(hijo_De Jessyca Rufina)
(hijo_De Bryan Rufina)
(hijo_De Azahara Rufina)
(hijo_De Jessyca Julio)
(hijo_De Bryan Julio)
(hijo_De Antonia Pilar)
(hijo_De Antonia Antonio)
(hijo_De Carolina Pilar)
(hijo_De Carolina Antonio)
(hijo_De Sonia Evelio)
(hijo_De Sonia Lola)
(hijo_De Sergio Evelio)
(hijo_De Sergio Lola)
(hijo_De Rufina CarolinaA)
(hijo_De Pilar CarolinaA)
(hijo_De Lola CarolinaA)
(hijo_De Rufina Santiago)
(hijo_De Pilar Santiago )
(hijo_De Lola Santiago )
)

(deffacts matrimonios
(casado Julio Rufina)
(casado Evelio Lola)
(casado Antonio Pilar)
(casado CarolinaA Santiago)
)


(defrule detectaHermanos
(hijo_De ?hijo1 ?padre )
(hijo_De ?hijo2 ?padre )
(test (neq ?hijo1 ?hijo2 ))
=>
(assert (hermano ?hijo1 ?hijo2))
)


(defrule detectaCasados
(casado ?Padre ?Madre)
(test (neq ?Padre ?Madre ))
=>
(assert (casado ?Madre ?Padre))
)



(defrule pideDatos
=>
(printout t "Nombre familiar:"crlf)
(assert (buscoInfo (read))) )


(defrule hijoDe
(buscoInfo ?persona)
(hijo_De ?persona ?padre)
(test (neq ?persona ?padre))
=>
(printout t "Hijo/a de:" ?padre crlf)
)

(defrule padreDe
(buscoInfo ?persona)
(hijo_De ?hijo ?persona)
(test (neq ?persona ?hijo ))
=>
(printout t "Padre/Madre de:" ?hijo crlf)
)

(defrule casadoCon
(buscoInfo ?persona)
(casado ?conyuge1 ?persona)
(test (neq ?persona ?conyuge1 ))
=>
(printout t "Casado/a con:" ?conyuge1 crlf)
)


(defrule hermanoDe
(buscoInfo ?persona)
(hermano ?persona ?hermano1 )
(test (neq ?persona ?hermano1 ))
=>
(printout t "Hermano/a de:" ?hermano1 crlf)
)


(defrule nietoDe
(buscoInfo ?persona)
(hijo_De ?persona ?padre)
(hijo_De ?padre ?Abuelo)
(test (neq ?persona ?padre))
=>
(printout t "Nieto de:" ?Abuelo crlf)
)

(defrule sobrinoDe1
(buscoInfo ?persona)
(hijo_De ?persona ?padre)
(hermano ?padre ?hermano)
(test (neq ?persona ?padre))
=>
(printout t "Sobrino de:" ?hermano crlf)
)

(defrule sobrinoDe2
(buscoInfo ?persona)
(hijo_De ?persona ?padre)
(hermano ?padre ?hermano)
(casado ?hermano ?conyu)
(test (neq ?persona ?padre))
=>
(printout t "Sobrino de:" ?conyu crlf)
)