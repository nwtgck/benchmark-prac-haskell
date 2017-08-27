# Benchmark practice in Haskell stack project

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