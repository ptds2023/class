# Data initialization
product_sales <- list(
  product1 = c(50, 45, 60, 55, 70, 80, 75, 90, 85, 60, 70, 65, 70, 75, 80, 85, 90, 95, 85, 70, 75, 80, 60, 45, 55, 50, 45, 60, 65),
  product2 = c(30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 125, 130, 135, 140, 145, 150, 155, 160, 165, 170, 175),
  product3 = c(20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78)
)

# 1. Using a for loop
total_sales_for = list()
for (product in names(product_sales)) {
  total_sales_for[[product]] <- sum(product_sales[[product]])
}

# 2. Using map from purrr package
library(purrr)
total_sales_map <- map_dbl(product_sales, sum)

# 3. Using lapply
total_sales_lapply <- lapply(product_sales, sum)

# 4. Using sapply
total_sales_sapply <- sapply(product_sales, sum)

# 5. Using vapply
total_sales_vapply <- vapply(product_sales, sum, numeric(1))

# 6. Using mclapply or parLapply (parallel processing)
# For mclapply, ensure to use it on a system that supports forking (like UNIX-based systems)
library(parallel)
total_sales_mclapply <- mclapply(product_sales, sum, mc.cores = detectCores())

# Alternatively, using parLapply for Windows or non-forking systems
# First, create a cluster
cl <- makeCluster(detectCores())
# Then use parLapply
total_sales_parLapply <- parLapply(cl, product_sales, sum)
# Stop the cluster
stopCluster(cl)
