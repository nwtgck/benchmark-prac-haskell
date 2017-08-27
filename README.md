# Benchmark practice in Haskell stack project [![Build Status](https://travis-ci.org/nwtgck/benchmark-prac-haskell.svg?branch=master)](https://travis-ci.org/nwtgck/benchmark-prac-haskell)

## How to make a benchmark

```sh
$ cd <this-repo>
$ stack bench
```

### stack command

If you don't have stack command, you can install it by the following instruction.

https://docs.haskellstack.org/en/stable/README/#how-to-install

## How to add benchmark to your stack project

Here is a part of `benchmark-prac-haskell.cabal`

```cabal
...
benchmark benchmark-prac-haskell-bench
  type:           exitcode-stdio-1.0
  hs-source-dirs: bench
  main-is:        BenchMain.hs
  -- other-modules:
  build-depends:  base
                , benchmark-prac-haskell
                , criterion
...               
```
(from: https://github.com/Toxaris/coalgebraic-parsing/blob/master/coalgebraic-parsing.cabal)

* `hs-source-dirs:` is  `./bench` directory (any name)
* `main-is:` is a entrypoint Haskell file
* `criterion` is a great library for benchmark

## What does a benchmark of this project look like?

Here is a benchmark of `strip` function in `src/Data/String/Strip.hs`


```
Running 1 benchmarks...
Benchmark benchmark-prac-haskell-bench: RUNNING...
benchmarking strip/foo bar
time                 119.6 ns   (117.6 ns .. 122.3 ns)
                     0.995 R²   (0.990 R² .. 0.999 R²)
mean                 122.0 ns   (119.4 ns .. 126.4 ns)
std dev              11.52 ns   (7.236 ns .. 17.02 ns)
variance introduced by outliers: 90% (severely inflated)
             
benchmarking strip/short (len:5)
time                 161.4 ns   (150.1 ns .. 172.9 ns)
                     0.971 R²   (0.963 R² .. 0.987 R²)
mean                 164.1 ns   (155.4 ns .. 185.2 ns)
std dev              44.70 ns   (24.37 ns .. 86.57 ns)
variance introduced by outliers: 99% (severely inflated)
             
benchmarking strip/middle (len:50)
time                 587.8 ns   (556.3 ns .. 629.1 ns)
                     0.983 R²   (0.965 R² .. 0.997 R²)
mean                 584.2 ns   (571.1 ns .. 605.0 ns)
std dev              51.33 ns   (34.51 ns .. 86.85 ns)
variance introduced by outliers: 87% (severely inflated)
             
benchmarking strip/long (len: 100)
time                 1.057 μs   (1.024 μs .. 1.090 μs)
                     0.993 R²   (0.990 R² .. 0.996 R²)
mean                 1.063 μs   (1.041 μs .. 1.091 μs)
std dev              84.46 ns   (66.32 ns .. 107.6 ns)
variance introduced by outliers: 83% (severely inflated)
             
benchmarking strip/very long (len: 1000)
time                 11.47 μs   (10.89 μs .. 12.19 μs)
                     0.947 R²   (0.895 R² .. 0.981 R²)
mean                 13.94 μs   (12.70 μs .. 16.91 μs)
std dev              6.105 μs   (3.703 μs .. 10.39 μs)
variance introduced by outliers: 99% (severely inflated)
             
Benchmark benchmark-prac-haskell-bench: FINISH

```

And you can see real benchmark in Travis job like https://travis-ci.org/nwtgck/benchmark-prac-haskell/jobs/268796834 .
