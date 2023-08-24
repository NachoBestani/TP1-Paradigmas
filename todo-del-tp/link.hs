import Quality (Quality, newQ, capacityQ, delayQ)
import City (City, newC, nameC)


module Link ( Link, newL, linksL, connectsL, capacityL, delayL )
   where

data Link = Lin City City Quality deriving (Eq, Show)

newL :: City -> City -> Quality -> Link -- genera un link entre dos ciudades distintas
newL = Lin

connectsL :: City -> Link -> Bool   -- indica si esta ciudad es parte de este link
connectsL ciudad (Lin ciudad1 ciudad2 _) = ciudad == ciudad1 || ciudad == ciudad2

linksL :: City -> City -> Link -> Bool -- indica si estas dos ciudades distintas estan conectadas mediante este link
linksL ciudad1 ciudad2 (Lin ciudad3 ciudad4 _) = (ciudad1 == ciudad3 && ciudad2 == ciudad4) || (ciudad1 == ciudad4 && ciudad2 == ciudad3)

capacityL :: Link -> Int
capacityL (Lin _ _ calidad) = capacityQ calidad

delayL :: Link -> Float     -- la demora que sufre una conexion en este canal
delayL (Lin _ _ calidad) = delayQ calidad


-- Ejemplo de uso:

-- newL "Buenos Aires" "Rosario" (newQ "fibra" 100 0.1)
-- Lin "Buenos Aires" "Rosario" (Qua "fibra" 100 0.1)

-- {- 
-- -}

{ Un Link es naturalmente bidireccional, Si las ciudades A y B están enlazadas por un link
li, linksL A B li y linksL B A li es true }

{ Un Link no puede enlazar una ciudad consigo misma, es decir, linksL A A li es false }

{ Un Link no puede enlazar dos veces la misma ciudad, es decir, si linksL A B li es true, entonces linksL B A li es false }

{ Un Link no puede enlazar dos ciudades que ya están enlazadas por otro link, es decir, si linksL A B li1 es true, entonces linksL A B li2 es false }

{- Un Link tiene una capacidad, que es la cantidad de túneles que puede soportar. - Un Link tiene una demora, que es la demora por unidad de distancia que sucede en las conexiones de este link. -}

{-
{ esta demora es en unidades de tiempo }
{ La demora de un link es en tiempo, segundos, milisegundos, etc.
La demora de la calidad de un enlace es en velocidad, por ejemplo km/segundo.
No importan las unidades, sí la relación entre los valores de demora de los links y la calidad de los enlaces.}
-}