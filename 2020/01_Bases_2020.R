# Librerías
require(openxlsx)
require(dplyr)

# Base a nivel estatal
IMM_2020 <- read.xlsx("2020/Data/IMM_2020.xlsx", sheet = "IMM_2020") %>%
             filter(NOM_ENT != "Nacional") %>%
              mutate(across(.cols = 6:14, ~formatC(.x, digits = 2,  format = "f"))) %>%
               mutate(across(.cols = c(15,17), ~formatC(.x, digits = 2,  format = "f")))

save(IMM_2020, file = "2020/Output/IMM_2020.RData")

