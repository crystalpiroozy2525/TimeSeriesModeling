---
output:
  reprex::reprex_document:
    venue: "gh"
    advertise: FALSE
    session_info: TRUE
    style: TRUE
    comment: "#;-)"
    tidyverse_quiet: FALSE
    std_out_err: TRUE
knit: reprex::reprex_render
---

## Sandy Springs Data Models - Advance GIS Project

## Time Series

Packages for Project

```{r}
if(!require(ggplot2)) install.packages(pkgs = "ggplot2", repos = "http://cran.us.r-project.org")
if(!require(tidyverse)) install.packages(pkgs = "tidyverse", repos = "http://cran.us.r-project.org")

library(ggplot2)
library(tidyverse)

```

## Population 2010 to 2019 - Census Tract

Data Source: <https://www.census.gov/data/datasets/time-series/demo/popest/2010s-total-cities-and-towns.html#ds>

```{r}
```

```{r}
Pop.df <- read_csv(file = "Census Dataset - Sandy Springs Population.csv")

```
```{r}
ggplot(Pop.df, aes(Year, Pop)) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Population in Sandy Springs, GA") +
  xlab("Year") +
  geom_smooth() +
  theme_minimal()
```


```{r}
ggplot(Pop.df, aes(Year, Pop)) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Population in Sandy Springs, GA") +
  xlab("Year") +
  geom_smooth(method='lm', formula= y~x) +
  theme_minimal()
```

## Impervious Surface

Creating a time series that exhibits whether there is an increase in impervious surface (ft). The data was obtained through ArcGIS Pro by calculating the impervious surface through Landsat 1-5, and 8 spectral imagery. The classification wizard and tabulate geoprocessing tools were used. It is useful to note that there may be errors in the data due to the resolution of the spectral image.
```{r}
Impervious.df <- read_csv(file = "ImperviousData.csv")
```


```{r}
ggplot(Impervious.df, aes(Year, Impervious)) +
    geom_smooth() +
  scale_x_continuous(n.breaks = 10) +
  ylab("Impervious Surface (ft)") +
  xlab("Year") +
  theme_minimal()
```


```{r}
ggplot(Impervious.df, aes(Year, Impervious)) +
    geom_smooth(method='lm', formula= y~x) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Impervious Surface (ft)") +
  xlab("Year") +
  theme_minimal()
```



## Precipitation Data

```{r}
Precipitation.df <- read_csv(file = "Precipiation Data - NASA.csv")
```
```{r}
Precipitation.df <- Precipitation.df %>%
  select(X4, X3, X17) %>%
  mutate(Parameters = X3,
         AnnualValues = X17,
         YEAR = X4)

```


```{r}
Precipitation.df <- Precipitation.df[15:54, 4:6]

```

```{r}
Precipitation.df <- Precipitation.df %>%
 filter(Parameters == "PRECTOT")
```

```{r}
class(Precipitation.df$YEAR)
class(Precipitation.df$AnnualValues)
```


```{r}
Precipitation.df$AnnualValues <-  as.numeric(Precipitation.df$AnnualValues)
Precipitation.df$YEAR <- as.numeric(Precipitation.df$YEAR)
```


```{r}
ggplot(Precipitation.df, aes(YEAR, AnnualValues)) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Annual Precipitation Values (mm day-1") +
  xlab("Year") +
  geom_smooth() +
  theme_minimal()
```

```{r}
ggplot(Precipitation.df, aes(YEAR, AnnualValues)) +
    geom_smooth(method='lm', formula= y~x) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Year") +
  xlab("Annual Precipitation Values (mm day-1") +
  theme_minimal()
```


#rainfall data

```{r}
Rainfall.df <- read_csv(file = "Rainfall Data - CHRS Data Portal.csv")
```
```{r}
Rainfall.df <- Rainfall.df %>%
  mutate(YEAR = Time)
```

```{r}
Rainfall.df$YEAR = c(2010:2019)
```

```{r}

```


```{r}
ggplot(Rainfall.df, aes(YEAR, Rain)) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Annual Rainfall Values (mm)") +
  xlab("Year") +
  geom_smooth() +
  theme_minimal()
```

```{r}
ggplot(Rainfall.df, aes(YEAR, Rain)) +
    geom_smooth(method='lm', formula= y~x) +
  scale_x_continuous(n.breaks = 10) +
  ylab("Year") +
  xlab("Annual Rainfall Values (mm") +
  theme_minimal()
```

```{r}
