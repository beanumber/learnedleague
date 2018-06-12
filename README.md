
<!-- README.md is generated from README.Rmd. Please edit that file -->
learnedleague
=============

The goal of learnedleague is to beat your opponents

Installation
------------

You can install learnedleague from github with:

``` r
# install.packages("devtools")
devtools::install_github("beanumber/learnedleague")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(learnedleague)
scrape_player_data("BaumerB")
#>       category  career   pct ll_pct ll77  %..6 lg %..7 e com d1%
#> 1          ART  23-109 0.211  0.373  1-3  .333    .160      .154
#> 2  CLASS MUSIC    7-71 0.099  0.354  0-1  .000    .232      .111
#> 3         MATH   36-47 0.766  0.479  2-2 1.000    .710      .550
#> 4      THEATRE   19-61 0.311  0.453  0-2  .000    .478      .353
#> 5    GEOGRAPHY  64-176 0.364  0.448  1-4  .250    .366      .203
#> 6     BUS/ECON   38-77 0.494  0.473  0-2  .000    .373      .171
#> 7  GAMES/SPORT 103-157 0.656  0.468  1-4  .250    .382      .157
#> 8     LANGUAGE   34-59 0.576  0.496  0-1  .000    .268      .000
#> 9    LIFESTYLE   18-70 0.257  0.534  0-1  .000    .241      .176
#> 10  WORLD HIST  62-169 0.367  0.476  2-4  .500    .620      .414
#> 11  LITERATURE  49-174 0.282  0.472  1-3  .333    .526      .453
#> 12   POP MUSIC  49-132 0.371  0.446  1-3  .333    .494      .404
#> 13     SCIENCE  87-216 0.403  0.480  2-5  .400    .500      .398
#> 14  TELEVISION  46-127 0.362  0.509  1-3  .333    .643      .453
#> 15   AMER HIST   47-99 0.475  0.505  1-2  .500    .481      .371
#> 16  FOOD/DRINK  57-129 0.442  0.549  2-3  .667    .567      .549
#> 17        FILM  51-135 0.378  0.519  0-3  .000    .488      .250
#> 18 CURR EVENTS   32-62 0.516  0.560  2-2 1.000    .799      .647
compare("JenningsK")
```

![](README-example-1.png)
