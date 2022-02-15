## Assignment 4.1 Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 30-Jan-22       Hannes Rosenbusch             Original code

#1
library(data.table)
library(dplyr)
df1 <- fread("https://bit.ly/3KWBJXd")  %>% slice(3:n())
df2 <- fread("https://bit.ly/3o8RWPf")  %>% slice(3:n())
df3 <- fread("https://bit.ly/34c0pdv")  %>% slice(3:n())
df4 <- fread("https://bit.ly/3uhwawy")  %>% slice(3:n())

#2
df <- plyr::rbind.fill(list(df1,df2,df3,df4))
df <- df %>% 
  select(-c(IPAddress)) %>%
  mutate(ResponseId = paste0("participant_", row_number()))

starts <- as.POSIXct(df$StartDate)
ends <- as.POSIXct(df$EndDate)
durations <- as.numeric(difftime(ends, starts, units = "secs"))
durations == df$`Duration (in seconds)`
summary(lm(as.numeric(df$imgagg1) ~ as.factor(df$gender))) #any comparison goes

#3
joke_columns <- colnames(df)[grep("jo", colnames(df))]
image_columns <- colnames(df)[grep("img", colnames(df))]
missing_vals <- sum(is.na(df[,c(joke_columns, image_columns)]))
all_vals <- nrow(df[,c(joke_columns, image_columns)]) * 
            ncol(df[,c(joke_columns, image_columns)])
missing_vals / all_vals

#4
library(tidyr)
library(ggplot2)
df_long <- df %>%
  select(c(ResponseId, all_of(joke_columns), all_of(image_columns)))  %>%
  pivot_longer(!ResponseId, names_to = "stimulus", values_to = "rating") %>%
  mutate(rating = as.numeric(rating))

compare_jokes <- function(data, name_stimuli_var, name_rating_var, jokes){
  name_stimuli_var <- enquo(name_stimuli_var) 
  name_rating_var <- enquo(name_rating_var) 
  
  ratings1 <- data %>% 
              filter( !!name_stimuli_var == jokes[1]) %>% 
              select( !!name_rating_var)
  ratings2 <- data %>% 
              filter( !!name_stimuli_var == jokes[2]) %>% 
              select( !!name_rating_var)
t.test(ratings1, ratings2)
}
compare_jokes(df_long, stimulus, rating, c("joaff5", "joagg4"))


#5
df_wide <- df_long %>%
  pivot_wider(ResponseId, names_from = stimulus, values_from = rating) %>%
  select(starts_with("jo"))
df_wide <- sapply(df_wide, as.numeric)
heatmap(cor(df_wide, use="pairwise.complete.obs"), Rowv = NA, Colv = NA)
# Plotting two heatmaps for the two sub-matrices is also fine
#OR
library(corrplot)
corrplot(cor(df_wide, use="pairwise.complete.obs")) 


#6-8 Depends the data you found

library(readr)
library(rstudioapi)
my_points <- function() {
  path <- getSourceEditorContext()$path
  code_lines <- read_lines(path)
  code_lines <- code_lines[-grep(x = trimws(code_lines), pattern = '^#')]
  code_lines <- code_lines[trimws(code_lines) != '']
  nr_lines <- length(code_lines)
  points <- 0.05 * (105 - nr_lines)
  points <- min(2, points)
  points <- max(0, points)
  return(points)
}
my_points()

