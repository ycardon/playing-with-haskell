import Conway
import Test.Hspec (describe, hspec, it)
import Test.QuickCheck (Testable (property))
import Test.QuickCheck.Gen (choose)

maxValue :: Int
maxValue = 40

main :: IO ()
main = hspec $ do
  describe "Conway suite" $ do
    it "aucun terme de la suite ne comporte un chiffre >3" $
      property $ property1 <$> choose (0, maxValue)
    it "tous les termes de la suite possèdent un nombre pair de chiffre" $
      property $ property2 <$> choose (1, maxValue)
    it "Les termes de rang impair se terminent par 21 et les termes de rang pair par 11" $
      property $ property3 <$> choose (1, maxValue)
