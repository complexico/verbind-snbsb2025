library(tidyverse)
tbik_sub_corpus <- dir("G:/My Drive/2022-07-30-tatabahasa-indonesia-kontemporer/Korpus_TBIK",
                       full.names = TRUE) |>
  str_subset("(desktop|_NASKA)", negate  = TRUE)
n_files_by_sub_corpus <- vector(mode = "integer", length = length(tbik_sub_corpus))
for(i in seq_along(tbik_sub_corpus)) {
  n_files_by_sub_corpus[i] <- dir(tbik_sub_corpus[i], recursive = TRUE) |> 
    str_subset("\\.txt$") |> 
    length()
  names(n_files_by_sub_corpus)[i] <- str_replace_all(str_extract(basename(tbik_sub_corpus[i]), "[^0-9]+"), "(^[A-Z]\\.\\s|\\s$)", "")
}
n_file_total <- format(sum(n_files_by_sub_corpus), big.mark = ".", decimal.mark = ",")
write_lines(n_file_total, file = "data/n_file_total.txt")

