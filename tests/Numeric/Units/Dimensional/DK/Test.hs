{-# LANGUAGE NoMonomorphismRestriction #-}

module Numeric.Units.Dimensional.DK.Test where

import Numeric.Units.Dimensional.DK.Prelude
import qualified Prelude
import Test.HUnit
import Control.Monad (void)

testPower :: Test
testPower = TestLabel "Power test" $ TestList
    [ TestCase $ ((9::Double) *~ one) @=? (3 *~ one) ^ pos2
    , TestCase $ ((1::Double) *~ one) @=? (12.1231 *~ one) ^ zero
    , TestCase $ ((0.25::Double) *~ one) @=? (2 *~ one) ^ neg2
    ]

testDimensionless :: Test
testDimensionless = TestLabel "Dimensionless test" $ TestList
    [ TestCase $ (3 Prelude.** 2::Double) *~ one @=? (3 *~ one) ** (2 *~ one)
    ]

testShow :: Test
testShow = TestLabel "Test 'Show' instance" $ TestList
    [ TestCase $ show ((1.0::Double) *~ one) @?= "1.0"
    , TestCase $ show ((2.0::Double) *~ meter) @?= "2.0 m"
    , TestCase $ show ((2.0::Double) *~ (meter / second)) @?= "2.0 m s^-1"
    , TestCase $ show ((2.0::Double) *~ (meter ^ pos2 / second ^ pos2)) @?= "2.0 m^2 s^-2"
    --, TestCase $ show (undefined :: DimRep DVelocity) @?= "m s^-1"
    ]

testOrdering :: Test
testOrdering = TestLabel "Test 'Ord' instance" $ TestList
    [ TestCase $ compare ((1 :: Integer) *~ one) (3 *~ one) @?= LT
    , TestCase $ compare ((1 :: Double) *~ (kilo meter)) (1 *~ meter) @?= GT
    , TestCase $ compare ((0 :: Double) *~ second) (_0) @?= EQ 
    ]

-- Collect the test cases.
tests :: Test
tests = TestList
    [ testPower
    , testDimensionless
    , testShow
    , testOrdering
    ]

main :: IO ()
main = void $ runTestTT tests
