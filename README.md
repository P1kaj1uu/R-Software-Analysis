# R软件包制作

## 打包

```
library(roxygen2)
roxygenize()
devtools::build()
install.packages("MedNERUtils_0.1.0.tar.gz", repos = NULL, type = "source")
```

## 测试

```
source("test_MedNERUtils.R")
```
