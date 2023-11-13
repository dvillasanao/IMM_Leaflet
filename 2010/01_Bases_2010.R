# Librerías
require(openxlsx)
require(dplyr)

# Base a nivel estatal
IMM_2010 <- read.xlsx("2010/Data/IMM_2010.xlsx", sheet = "IMM_2010") %>%
             filter(NOM_ENT != "Nacional") %>%
              select(-AÑO) %>%
               mutate(across(.cols = c(6:14), ~formatC(.x, digits = 2,  format = "f"))) %>%
                mutate(across(.cols = c(15,17), ~formatC(.x, digits = 2,  format = "f"))) %>%
                 mutate_at(.vars = c(6:14, 15, 17), as.numeric) 
str(IMM_2010)
save(IMM_2010, file = "2010/Output/IMM_2010.RData")

