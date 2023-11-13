# Librerías
require(openxlsx)
require(dplyr)

# Base a nivel estatal
IMM_2015 <- read.xlsx(paste0(here::here(),"/2015/Data/IMM_2015.xlsx"), sheet = "IMM_2015") %>%
             filter(NOM_ENT != "Nacional") %>%
              select(-AÑO) %>%
               mutate(across(.cols = c(6:14), ~formatC(.x, digits = 2,  format = "f"))) %>%
                mutate(across(.cols = c(15,17), ~formatC(.x, digits = 2,  format = "f"))) %>%
                 mutate_at(.vars = c(6:14, 15, 17), as.numeric) 

save(IMM_2015, file = "2015/Output/IMM_2015.RData")

