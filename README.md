
read-rs-product
===============

How to read common remote sensing products

Table of content
----------------

-   [L3BIN](#l3bin)

L3BIN
-----

Applies to: - MODIS Terra and Aqua

### R

HDF5 L3BIN files can be read using the `rhdf5` package from bioconductor. The installation can be done as follow:

``` r
source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")
```

The `h5ls()` function will list all the layers included in the file:

``` r
library(rhdf5)

h5ls("data/A2016160.L3b_DAY_CHL.nc")
```

    ##                   group                name        otype   dclass     dim
    ## 0                     / level-3_binned_data    H5I_GROUP                 
    ## 1  /level-3_binned_data            BinIndex  H5I_DATASET COMPOUND    4320
    ## 2  /level-3_binned_data             BinList  H5I_DATASET COMPOUND 1546117
    ## 3  /level-3_binned_data          binDataDim  H5I_DATASET    FLOAT       0
    ## 4  /level-3_binned_data         binDataType H5I_DATATYPE                 
    ## 5  /level-3_binned_data         binIndexDim  H5I_DATASET    FLOAT       0
    ## 6  /level-3_binned_data        binIndexType H5I_DATATYPE                 
    ## 7  /level-3_binned_data          binListDim  H5I_DATASET    FLOAT       0
    ## 8  /level-3_binned_data         binListType H5I_DATATYPE                 
    ## 9  /level-3_binned_data             chl_ocx  H5I_DATASET COMPOUND 1546117
    ## 10 /level-3_binned_data             chlor_a  H5I_DATASET COMPOUND 1546117
    ## 11                    /  processing_control    H5I_GROUP                 
    ## 12  /processing_control    input_parameters    H5I_GROUP

Finally, use `h5read()` to open a specific layer:

``` r
df <- h5read("data/A2016160.L3b_DAY_CHL.nc", "/level-3_binned_data/chlor_a")
head(df)
```

    ##         sum sum_squared
    ## 1 0.6973728   0.3438865
    ## 2 1.0581876   0.4339271
    ## 3 0.8196706   0.3075230
    ## 4 0.5595803   0.2214183
    ## 5 0.9581555   0.4194749
    ## 6 0.8865827   0.3568407

### Matlab

### C/C++
