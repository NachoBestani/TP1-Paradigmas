module Tunel ( Tunel, newT, connectsT, usesT, delayT )
   where

data Tunel = Tun [Link] deriving (Eq, Show)

newT :: [Link] -> Tunel
newT = Tun

connectsT :: City -> City -> Tunel -> Bool -- inidca si este tunel conceta estas dos ciudades distintas

   ojo con esta linea: (ver si es necesaria)
   {- connectsT ciudad1 ciudad2 (Tun links) = any (linksL ciudad1 ciudad2) links -}

connectsL ciudad1 ciudad2 (Lin ciudad3 ciudad4 _) = (ciudad1 == ciudad3 && ciudad2 == ciudad4) || (ciudad1 == ciudad4 && ciudad2 == ciudad3)

usesT :: Link -> Tunel -> Bool  -- indica si este tunel atraviesa ese link
usesT link (Tun links) = any (== link) links

delayT :: Tunel -> Float -- la demora que sufre una conexion en este tunel
delayT (Tun links) = sum (map delayL links)


-- Ejemplo de uso:

-- newT [newL "Buenos Aires" "Rosario" (newQ "fibra" 100 0.1)]
-- Tun [Lin "Buenos Aires" "Rosario" (Qua "fibra" 100 0.1)]


-- Un Tunel es la conexión lógica que podemos establecer entre dos puntos, también es bidireccional

-- Un Tunel no puede conectar una ciudad consigo misma, es decir, connectsT A A tunel es false


-- dadas dos ciudades esta función da si si las ciudades son los extremos del túnel

-- Un túnel recorre una serie de uno o más links, esta función indica si el link consultado es parte de esa serie

-- delayT: esta demora es en unidades de tiempo, cuanto demora la información en recorrer el túnel. 

-- (chat) La demora de un túnel es la suma de las demoras de los links que lo componen. La demora de un link es la demora de la calidad de ese link. La demora de la calidad de un enlace es en velocidad, por ejemplo km/segundo. No importan las unidades, sí la relación entre los valores de demora de los links y la calidad de los enlaces.
