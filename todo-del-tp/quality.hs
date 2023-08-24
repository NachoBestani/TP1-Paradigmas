module Quality ( Quality, newQ, capacityQ, delayQ )
   where

data Quality = Qua String Int Float deriving (Eq, Show)

newQ :: String -> Int -> Float -> Quality
{-- newQ tipo cap demora = Qua tipo cap demora --}

newQ = Qua
-- esto es lo mismo que la línea anterior, pero usando currying
-- newQ "fibra" 100 0.1
-- Qua "fibra" 100 0.1
-- newQ "cobre" 10 0.5
-- Qua "cobre" 10 0.5


capacityQ :: Quality -> Int -- cuantos túneles puede tolerar esta conexión
capacityQ (Qua _ cap _) = cap

delayQ :: Quality -> Float  -- la demora por unidad de distancia que sucede en las conexiones de este canal
delayQ (Qua _ _ demora) = demora