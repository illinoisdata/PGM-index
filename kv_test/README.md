# Benchmark Instruction

This is an instruction to benchmark PGM for experiments in AirIndex: Versatile Index Tuning Through Data and Storage.

Please follow [dataset](https://github.com/illinoisdata/airindex-public/blob/main/dataset_setup.md) and [query key set](https://github.com/illinoisdata/airindex-public/blob/main/keyset_setup.md) instructions to setup the benchmarking environment. These are examples of environment [reset scripts](https://github.com/illinoisdata/airindex-public/blob/main/reload_examples.md). The following assumes that the datasets are under `/path/to/data/`, key sets are under `/path/to/keyset/` and output files are under `/path/to/output`

## Build

Please follow [instructions here](https://github.com/illinoisdata/PGM-index/blob/master/README.md) to build binaries. To build indexes for all datasets

```
bash build.sh /path/to/output /path/to/data
```

## Benchmark (6.2 & 6.4)

Benchmark over 40 key set of 1M keys

```
bash benchmark.sh /path/to/output /path/to/keyset ~/reload_local.sh
```

The measurements will be recorded in `/path/to/output/out` folder.

## Build Scalability (6.7)

To measure the build time, run the build script.

```
bash scale.sh /path/to/output /path/to/data
```

