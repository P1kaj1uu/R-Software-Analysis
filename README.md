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

## 全校验

```
R CMD check MedNERUtils_0.1.0.tar.gz
```

## 执行无PDF检查命令

```
_R_CHECK_CRAN_INCOMING_=false R CMD check --no-manual --no-examples --no-tests MedNERUtils_0.1.0.tar.gz
```
