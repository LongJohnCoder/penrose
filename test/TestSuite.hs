-- Modeled after Snap: https://github.com/snapframework/snap-core/blob/master/test/TestSuite.hs
module Main where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.SmallCheck as SC

import qualified Functions.Tests

-- TODO factor out test into functions
-- TODO check/track test coverage
-- TODO figure out how to test ShadowMain and optimization intermediate stages
-- TODO use template haskell / test discovery
-- TODO we might want inline assertions in code too, to enforce invariants
-- import Main hiding (main)
import qualified ShadowMain.Tests
import qualified Shapes.Tests
import qualified Transforms.Tests
import qualified Util.Tests

-- import qualified Substance.Tests
-- import qualified Style.Tests
import qualified Server.Tests

main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "Tests"
    [ ShadowMain.Tests.tests
    , Functions.Tests.tests
    , Shapes.Tests.tests
    , Util.Tests.tests
    , Transforms.Tests.tests
        -- NOTE: need better test cases since we cannot parse Substance nor Style progs without element progs
        -- Substance.Tests.tests,
        -- Style.Tests.tests,
    , Server.Tests.tests
    ]
