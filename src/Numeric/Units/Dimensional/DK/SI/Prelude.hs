{- |
   Copyright  : Copyright (C) 2006-2015 Bjorn Buckwalter
   License    : BSD3

   Maintainer : bjorn@buckwalter.se
   Stability  : Stable
   Portability: GHC only

= Summary

This module defines a variant of "Numeric.Units.Dimensional.DK.Prelude" where plane angles are treated as dimensionless.

-}
module Numeric.Units.Dimensional.DK.SI.Prelude
    ( module Numeric.Units.Dimensional.DK.SI
    , module Numeric.Units.Dimensional.DK.SI.Quantities
    , module Numeric.Units.Dimensional.DK.SI.SIUnits
    , module Numeric.NumType.DK.Integers
    , module Data.Foldable
    , module Prelude
    ) where

import Numeric.Units.Dimensional.DK.SI hiding
    ( dmap
    )

import Numeric.Units.Dimensional.DK.SI.Quantities

import Numeric.Units.Dimensional.DK.SI.SIUnits

import Numeric.NumType.DK.Integers
    ( neg5, neg4, neg3, neg2, neg1, zero, pos1, pos2, pos3, pos4, pos5
    )  -- Used in exponents.

import Data.Foldable
    ( product, minimum, maximum )

import Prelude hiding
    ( (+), (-), (*), (/), (^), (**)
    , abs, negate, pi, exp, log, sqrt
    , sin, cos, tan, asin, acos, atan, atan2
    , sinh, cosh, tanh, asinh, acosh, atanh
    , sum, product, minimum, maximum
    )  -- Hide definitions overridden by 'Numeric.Dimensional'.
    