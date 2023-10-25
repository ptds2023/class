url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"
url %>% read_html() %>% html_nodes(".wikitable.sortable") %>% html_table() %>% kableExtra::kable()

url %>% read_html() %>% html_nodes("table.wikitable") %>% html_table()

library(chromote)
library(rvest)

url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"

b <- ChromoteSession$new()
b$Page$navigate(url)
x <- b$DOM$getDocument()
x$root$nodeId %>% 
  b$DOM$querySelector("html") %>% 
  `[[`(1) %>% 
  b$DOM$getOuterHTML() %>% 
  `[[`(1) %>% 
  read_html() %>% 
  html_nodes("p + p + p + p + table") %>% 
  html_table()
b$close()

# https://stackoverflow.com/questions/76346671/from-chromote-to-rvest

find_chrome()

b <- ChromoteSession$new()

# In a web browser, open a viewer for the headless browser. Works best with
# Chromium-based browsers.
b$view()

url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"
b$Page$navigate(url)

x <- b$Runtime$evaluate("document.querySelector('html').outerHTML")$result$value %>% 
  read_html() %>% 
  html_nodes("p + p + p + p + table") %>% 
  html_table()


url <- "https://data.worldbank.org/indicator/SP.ADO.TFRT"
remDr$navigate(url)
html_page <- remDr$getPageSource()[[1]]
raw_data <- read_html(html_page) %>% html_nodes(".item") %>% html_text()

b <- ChromoteSession$new()
b$Page$navigate(url)
b$Runtime$evaluate("document.querySelector('html').outerHTML")$result$value %>% 
  read_html() %>% 
  html_nodes(".item") %>% 
  html_text()



x <- b$DOM$getDocument()
x$root$nodeId %>% 
  b$DOM$querySelector("html") %>% 
  `[[`(1) %>% 
  b$DOM$getOuterHTML() %>% 
  `[[`(1) %>% 
  read_html() %>% 
  html_nodes(".item") %>% 
  html_text()




library(chromote)
library(rvest)
b <- ChromoteSession$new()
{
  b$Page$navigate(url)
  b$Page$loadEventFired()
} 
#> $timestamp
#> [1] 73090.44

# evaluate js in Chromeote and work with returned string
b$Runtime$evaluate("document.querySelector('html').outerHTML")$result$value %>% 
  read_html() %>% 
  html_nodes("p + p + p + p + table") %>% 
  html_table()




url <- "https://data.worldbank.org/indicator/SP.ADO.TFRT"
remDr$navigate(url)
html_page <- remDr$getPageSource()[[1]]
raw_data <- read_html(html_page) %>% html_nodes(".item") %>% html_text()


library(RSelenium)
remDr <- remoteDriver(port = 4444L, 
                      remoteServerAddr = "172.17.0.2",
                      browser = "firefox")
remDr$open()




library(RSelenium)


remdr <- remoteDriver()
remdr$open()

rD <- rsDriver()
remDr <- rD[["client"]]

remDr$navigate(url)
html_page <- remDr$getPageSource()[[1]]











remDr <- remoteDriver$new()

remDr <- remoteDriver(port = 4445L)
remDr$open()


remDr <- remoteDriver(port = 4444L)
remDr$open()
  url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"
remDr$navigate(url)


remDr <- rD[["client"]]
url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"
remDr$navigate(url)
html_page <- remDr$getPageSource()[[1]]



rD <- rsDriver(browser="firefox", port=4444L)
remDr <- rD[["client"]]
url <- "https://en.wikipedia.org/wiki/2023_Rugby_World_Cup"
# url <- "https://data.worldbank.org/indicator/SP.ADO.TFRT"
remDr$navigate(url)
html_page <- remDr$getPageSource()[[1]]

remdr <- remoteDriver()
remdr$navigate(url)
