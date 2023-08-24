import Control.Exception
import System.IO.Unsafe

fallo :: IO a -> IO Bool
fallo action = do
    result <- tryJust isException action
    return $ case result of
        Left _ -> True
        Right _ -> False
    where
        isException :: SomeException -> Maybe ()
        isException _ = Just ()

testF :: IO Bool -> Bool
testF action = unsafePerformIO action

result :: Int -> Int
result x | x > 5 = 4
         | otherwise = error "hey"

-- ahora pueden evaluar
t = [ testF (fallo (print (result 3 ))),
      testF (fallo (print (result 8 ))) ]


------------------------------------------------
-- VERSION CON EVALUATE MEJORADA:


testF :: Show a => a -> Bool
testF action = unsafePerformIO $ do
    result <- tryJust isException (evaluate action)
    return $ case result of
        Left _ -> True
        Right _ -> False
    where
        isException :: SomeException -> Maybe ()
        isException _ = Just ()

result :: Int -> Int
result x | x > 5 = 4
         | otherwise = error "hey"

-- ahora pueden evaluar
t = [ testF (result 3 ),
      testF (result 8 ) ]



-- ESTE CODIGO NO SE MODIFICA Y ES OPCIONAL SU USO. 