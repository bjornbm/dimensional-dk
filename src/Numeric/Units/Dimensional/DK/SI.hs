{-# LANGUAGE DataKinds #-}

{- |
   Copyright  : Copyright (C) 2006-2015 Bjorn Buckwalter
   License    : BSD3

   Maintainer : bjorn@buckwalter.se
   Stability  : Stable
   Portability: GHC only

= Summary

This module defines a variant of "Numeric.Units.Dimensional.DK" where plane and solid angles are not treated as dimensions.

Compare, e.g., 'sin' with 'Numeric.Units.Dimensional.DK.sin'

-}
module Numeric.Units.Dimensional.DK.SI
(
  module Numeric.Units.Dimensional.DK,
  sin, cos, tan, asin, acos, atan, atan2,
  DPlaneAngle, DSolidAngle,
  PlaneAngle, SolidAngle,
  baseUnit
)
where

import qualified Numeric.Units.Dimensional.DK as A
import Numeric.Units.Dimensional.DK hiding (sin, cos, tan, asin, acos, atan, atan2, DPlaneAngle, DSolidAngle, PlaneAngle, SolidAngle, baseUnit)
import Numeric.NumType.DK.Integers
  ( TypeInt (Zero)
  )
import Prelude hiding (sin, cos, tan, asin, acos, atan, atan2)

sin, cos, tan, asin, acos, atan :: (Floating a) => Dimensionless a -> Dimensionless a
sin = A.sin . coerceAngles
cos = A.cos . coerceAngles
tan = A.tan . coerceAngles
asin = removeAngles . A.asin
acos = removeAngles . A.acos
atan = removeAngles . A.atan

atan2 :: (RealFloat a) => Quantity d a -> Quantity d a -> Dimensionless a
atan2 x y = removeAngles $ A.atan2 x y

type DPlaneAngle = DOne
type DSolidAngle = DOne

type PlaneAngle = Quantity DPlaneAngle
type SolidAngle = Quantity DSolidAngle

baseUnit :: (Num a) => Unit ('Dim l m t i th n j 'Zero 'Zero) a
baseUnit = siUnit