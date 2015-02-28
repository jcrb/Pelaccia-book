raw <- read.csv("billboard.csv", stringsAsFactors = FALSE)
table(Encoding(raw$artist.inverted))

n_failed <- function(x, enc) {
  reenc <- iconv(x, enc, "UTF-8")
  sum(is.na(reenc))
}
failures <- sapply(iconvlist(), n_failed, x = raw$artist.inverted)
iconvlist()[failures == 0]

raw$artist.inverted <- iconv(raw$artist.inverted, "MAC", "UTF-8")
table(Encoding(raw$artist.inverted))
