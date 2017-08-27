import Criterion.Main

import Data.String.Strip

main = defaultMain [
  bgroup "strip" [ bench "short"  $ whnf strip " aaaaa      "
                 , bench "middle"  $ whnf strip " aaaaaaaaaaa      "
                 , bench "long"  $ whnf strip "  aaaaaaaaaaaaaaaaaaaaabababababababababbabababbababbabababbababab           "
                 ]
  ]