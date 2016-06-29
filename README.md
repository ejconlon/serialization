This is a micro-benchmark that compares `binary`, `binary-serialise-cbor`,
`cereal` and `packman` serialization and deserialization performances.

`binary-serialise-cbor` and `packman` are not on Hackage, so we include them
here as Git submodules. Make sure to initialize submodules and add
`binary-serialise-cbor` and `packman` as sources in your Cabal sandbox.
Something like this should work:

```
$ git submodule update --init --recursive
$ cabal sandbox init
$ cabal sandbox add-source packman/
$ cabal sandbox add-source binary-serialise-cbor/
$ cabal install
```

## Results

Versions:

- binary-0.8.3.0
- binary-serialise-cbor-0.1.1.0
- cereal: 0.5.2.0
- packman: 0.2

```
Length of ByteString generated by binary:                41943039
Length of ByteString generated by cereal:                41943039
Length of ByteString generated by packman:               234881088
Length of ByteString generated by binary-serialise-cbor: 46137343
benchmarking serialization/binary
time                 1.534 s    (1.410 s .. 1.600 s)
                     0.999 R²   (0.998 R² .. 1.000 R²)
mean                 1.512 s    (1.500 s .. 1.522 s)
std dev              15.92 ms   (0.0 s .. 17.34 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking serialization/cereal
time                 1.608 s    (1.573 s .. 1.681 s)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 1.599 s    (1.589 s .. 1.606 s)
std dev              12.10 ms   (0.0 s .. 13.33 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking serialization/packman
time                 7.597 s    (7.379 s .. 7.934 s)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 7.558 s    (7.531 s .. 7.607 s)
std dev              42.51 ms   (0.0 s .. 43.88 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking serialization/binary-CBOR
time                 489.8 ms   (428.2 ms .. 517.9 ms)
                     0.998 R²   (0.996 R² .. 1.000 R²)
mean                 468.7 ms   (460.1 ms .. 475.1 ms)
std dev              9.796 ms   (0.0 s .. 11.11 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking deserialization/binary
time                 914.5 ms   (749.5 ms .. 1.097 s)
                     0.995 R²   (0.983 R² .. 1.000 R²)
mean                 923.4 ms   (896.6 ms .. 945.7 ms)
std dev              35.41 ms   (0.0 s .. 38.64 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking deserialization/cereal
time                 722.4 ms   (571.0 ms .. 844.8 ms)
                     0.993 R²   (0.991 R² .. 1.000 R²)
mean                 727.0 ms   (708.8 ms .. 741.3 ms)
std dev              22.14 ms   (0.0 s .. 24.76 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking deserialization/packman
time                 3.908 s    (3.751 s .. 4.190 s)
                     0.999 R²   (0.998 R² .. 1.000 R²)
mean                 4.125 s    (4.026 s .. 4.203 s)
std dev              120.4 ms   (0.0 s .. 134.5 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking deserialization/binary-CBOR
time                 561.5 ms   (496.5 ms .. 660.4 ms)
                     0.996 R²   (0.994 R² .. 1.000 R²)
mean                 533.1 ms   (517.6 ms .. 557.9 ms)
std dev              21.73 ms   (0.0 s .. 23.29 ms)
variance introduced by outliers: 19% (moderately inflated)
```
