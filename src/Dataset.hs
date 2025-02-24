{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Dataset(carsData,irisData) where
import           Control.DeepSeq
import qualified Dahdit as D
import qualified Data.Binary                as B
import Codec.Serialise as CBOR
import qualified Flat                  as F
import qualified Data.Serialize             as C
import qualified Data.Persist                as R
import qualified Data.Store                 as S
import           Numeric.Datasets           (getDataset)
-- import           Numeric.Datasets.Abalone   (abalone)
import           Numeric.Datasets.Car
import           Numeric.Datasets.Iris
import Data.Word (Word8)

instance NFData RelScore
instance B.Binary RelScore
instance C.Serialize RelScore
instance CBOR.Serialise RelScore
instance F.Flat RelScore
instance S.Store RelScore
instance R.Persist RelScore
deriving via (D.ViaBoundedEnum Word8 RelScore) instance D.BinaryRep Word8 RelScore
deriving via (D.ViaBinaryRep RelScore) instance D.ByteSized RelScore
deriving via (D.ViaBinaryRep RelScore) instance D.StaticByteSized RelScore
deriving via (D.ViaBinaryRep RelScore) instance D.Binary RelScore

instance NFData RelSize
instance B.Binary RelSize
instance C.Serialize RelSize
instance CBOR.Serialise RelSize
instance F.Flat RelSize
instance S.Store RelSize
instance R.Persist RelSize
deriving via (D.ViaBoundedEnum Word8 RelSize) instance D.BinaryRep Word8 RelSize
deriving via (D.ViaBinaryRep RelSize) instance D.ByteSized RelSize
deriving via (D.ViaBinaryRep RelSize) instance D.StaticByteSized RelSize
deriving via (D.ViaBinaryRep RelSize) instance D.Binary RelSize

instance NFData Acceptability
instance B.Binary Acceptability
instance C.Serialize Acceptability
instance CBOR.Serialise Acceptability
instance F.Flat Acceptability
instance S.Store Acceptability
instance R.Persist Acceptability
deriving via (D.ViaBoundedEnum Word8 Acceptability) instance D.BinaryRep Word8 Acceptability
deriving via (D.ViaBinaryRep Acceptability) instance D.ByteSized Acceptability
deriving via (D.ViaBinaryRep Acceptability) instance D.StaticByteSized Acceptability
deriving via (D.ViaBinaryRep Acceptability) instance D.Binary Acceptability

instance NFData Count
instance B.Binary Count
instance C.Serialize Count
instance CBOR.Serialise Count
instance F.Flat Count
instance S.Store Count
instance R.Persist Count
deriving via (D.ViaGeneric Count) instance D.ByteSized Count
deriving via (D.ViaGeneric Count) instance D.Binary Count

deriving instance Eq Car
instance NFData Car
instance B.Binary Car
instance C.Serialize Car
instance CBOR.Serialise Car
instance F.Flat Car
instance S.Store Car
instance R.Persist Car
deriving via (D.ViaGeneric Car) instance D.ByteSized Car
deriving via (D.ViaGeneric Car) instance D.Binary Car

deriving instance Eq Iris
instance NFData Iris
instance B.Binary Iris
instance C.Serialize Iris
instance CBOR.Serialise Iris
instance F.Flat Iris
instance S.Store Iris
instance R.Persist Iris
deriving via (D.ViaStaticGeneric Iris) instance D.ByteSized Iris
deriving via (D.ViaStaticGeneric Iris) instance D.StaticByteSized Iris
deriving via (D.ViaStaticGeneric Iris) instance D.Binary Iris

instance NFData IrisClass
instance B.Binary IrisClass
instance C.Serialize IrisClass
instance CBOR.Serialise IrisClass
instance F.Flat IrisClass
instance S.Store IrisClass
instance R.Persist IrisClass
deriving via (D.ViaBoundedEnum Word8 IrisClass) instance D.BinaryRep Word8 IrisClass
deriving via (D.ViaBinaryRep IrisClass) instance D.ByteSized IrisClass
deriving via (D.ViaBinaryRep IrisClass) instance D.StaticByteSized IrisClass
deriving via (D.ViaBinaryRep IrisClass) instance D.Binary IrisClass

-- irisData = iris
irisData :: [Iris]
irisData = by 500 iris

carsData :: IO [Car]
carsData = by 20 <$> getDataset car
-- carsData = getDataset car
-- abaloneData = by 10 <$> getDataset abalone

by :: Int -> [a] -> [a]
by n = concat . replicate n

-- test :: IO ()
-- test = do
--    -- The Iris data set is embedded
--    print (length iris)
--    print (head iris)
--    cars <- getDataset car
--    print (length cars)
--    print (head cars)
--    -- print $ F.flat cars
--    -- The Abalone dataset is fetched
--    abas <- getDataset abalone
--    print (length abas)
--    print (head abas)
