A some project exploring different algorithms for generating colored
noise (especially pinkish one) in C++.

## Motivation

For another project of mine I do need a reliable (both efficient and
high-quality) source of pinkish noise written in C++. 

In order to find a nice algorithm, I will explore a lot of **C+ code**
and suggestions I found in the web and analyse the resulting noise in
the statistical programming language **R**. While I'm at it I will
also compile a list of useful references and have a look at other
colors of noise.

## Usage

To compile all the C++ code and make some noise, just enter the
following command in the package root.

``` bash
make
```

The spectral analysis is performed by executing the file
[power-spectrum.R](power-spectrum.R) interactively in a R shell or run
the following command in a bash shell to execute the whole script and
save it's results into a file names **Rplots.pdf**

``` bash
Rscript power-spectrum.R
```
