library(readr)
library(tidyverse)

cellclasses = c("T_cells", "Tumor", "DCs", "other_cells")
brcalymphnode = lapply(cellclasses, function(k) {
  read_csv(file.path("..", "data",
                     sprintf("99_4525D-%s.txt", k))) %>%
    transmute(x = globalX,
              y = globalY,
              class = k)
}) %>% bind_rows %>% mutate(class = factor(class))
brcalymphnode