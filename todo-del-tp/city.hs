module City ( City, newC, nameC, distanceC )
   where

import Point ( Point, newP, difP )

data City = Cit String Point deriving (Eq, Show)

newC :: String -> Point -> City
newC name point = Cit name point
--newC = Cit tmb se puede asi

nameC :: City -> String
nameC (Cit name _) = name

distanceC :: City -> City -> Float
distanceC (Cit _ point1) (Cit _ point2) = difP point1 point2 