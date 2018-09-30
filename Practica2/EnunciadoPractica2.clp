;Diagnostico para Gripe, Gripe-A, Dengue y meningitis.
;Intensidad del sintoma
;Frecuencia con la que se da el sintoma en esa enfermedad

;El sintoma S en la enfermedad E se da rara vez y de forma leve
; Sintomas, intensidad y frecuenca en releacion a cada enfermedad:

; Como 
; Pregunta sintomas y se hace una hipotesis diferencial.
; Despues de tener una hipotesis intenta confirmarla preguntando por los sintomas posibles
; Se profundiza en los sintomas si se puede.
; La hipotesis se hace conclusion cuando todos los sintomas habituales los tiene (o la mayoria) y esta
; 		bastante alejado de otras enfermedades. 

; Modulos:
; 	Primero peticion de sintomas iniciales
; 	Actualizar y seleccionar hipotesis (y diferencial)
; 	Buscar siguientes preguntas de sintomas (si es necesario)
;	Modulo que dice si se ha confirmado o no la hipotesis
; 	Modulo de Finalizar

;deftemplate sintoma (nombre, intensidad (no lo se, alta, media baja))

;;;;;;;;;;;;;;;;;;;;;;;;;
; Modulo 1.- Preguntar al experto, Sintomas mas normales que le digan para hacer un listado para que puedan ser elegidos al inicio del programa
;;;;;;;;;;;;;;;;;;;;;;;;;
	;Dolor de cabeza, Fiebre, Tos, Dolor muscular. (1 o 2 a elegir)

;;;;;;;;;;;;;;;;;;;;;;;;;
; Modulo 2.- A traves de un conjunto de reglas, saquen una hipotesis.
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sintomas NO ENFERMEDAD
	;; NO DOLOR DE CABEZA y NO FIEBRE.- No entra dentro del margen de ninguna enfermedad, diagnostico NINGUNO -HIPOTESIS SALIR-
;; Sintomas GRIPE 
	;; No fiebre alta, no rigidez nuca, no mucho tiempo con sintomas, -HIPOTESIS GRIPE- (Por defecto sallience)
;; Sintomas AH1N1
	;; No meningitis o dengue, fiebre muy alta o muy persistente, sin ronchas -HIPOTESIS AH1N1-
;; Sintomas Meningitis
	;; Sintomas gripales(todos los que tienen fiebre y dolor de cabeza), rigidez nuca o dolor en la nuca -HIPOTESIS MENINGITIS-
;; Sintomas Dengue
	;; No meningitis, sintomas gripales (fuertes/persistentes) y ronchas. -HIPOTESIS DENGUE-
	;; Si hay ronchas/sintomas fuertes/persistentes O hay una epidemia -HIPOTESIS DENGUE-
	;; Vomitos en ocasiones(menos determinante)
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;
; Modulo 3.- Diferencial.
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
;;;;MODULO FINAL PARA DAR DIAGNOSTICO;;;;
;;;;;;;;;;; O PREGUNTAR MAS;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUando salir, si se han descartado todas menos 1, se sale por esa
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


ESQUEMA MENTAL:
Hip gripe
DD Meningitis - DIAGNOSTICO MENINGITIS-
			  - DESCARTAR MENINGITIS-
DD AH1N1	- DIAGNOSTICO AH1N1		- Hip AH1N1
			- DESCARTAR AH1N1
DD DENGUE	- Diagnostico DENGUE
			- Diagnostico GRIPE