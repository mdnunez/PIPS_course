## Assignment 3.1 Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 23-Jan-22       Hannes Rosenbusch             Original code
# 30-Jan-22     Michael Nunez            A couple of clarifying comments

# Q3.1.1
boxplot(rnorm(50))

# Q3.1.2
# https://bit.ly/3ImosFB
df <- read.csv("NLE00152485.csv")
plot(df$DATE, df$TAVG)

# Q3.1.3
library(titanic)
library(ggplot2)
ggplot(titanic_train, aes(fill = factor(Survived, labels = c("dead", "alive")), x = Sex)) +
  geom_bar() +
  labs(fill = "How did it go?")

# Q3.1.4
library(titanic)
library(ggplot2)
ggplot(titanic_train, aes(fill = factor(Survived, labels = c("dead", "alive")), x = Sex)) +
  geom_bar() +
  labs(fill = "How did it go?") +
  theme_bw()

# Q3.1.5
# There are a few ways to improve this plot
# Try making it more colorful and changing the axis labels at the very least

# Q3.1.6
library(ggplot2)
library(dplyr)
# Note the use of "pipes" here. We will learn more about pipes in Week 4
# Note that mean(abs(x)) is the same as x %>% abs() %>% mean()
data.frame(Orange) %>%
  group_by(Tree) %>%
  summarise(max_circumference = max(circumference)) %>%
  mutate(Tree = factor(Tree, levels = c("1", "2", "3", "4", "5"))) %>%
  ggplot() +
  geom_bar(aes(Tree, max_circumference), stat = "identity")

# Q3.1.7
data.frame(Orange) %>%
  ggplot() +
  geom_smooth(aes(age, circumference), method = "lm")

# Q3.1.8
library(ggplot2)
library(dplyr)
library(patchwork)
par(mfrow = c(2, 2))
plot1 <- data.frame(Orange) %>%
  group_by(Tree) %>%
  summarise(max_circumference = max(circumference)) %>%
  mutate(Tree = factor(Tree, levels = c("1", "2", "3", "4", "5"))) %>%
  ggplot() +
  geom_bar(aes(Tree, max_circumference), stat = "identity")

plot2 <- data.frame(Orange) %>%
  ggplot() +
  geom_line(aes(age, circumference, color = Tree))

plot1 + plot2


# Q3.1.9
library(ggstatsplot)
ggbetweenstats(data = ToothGrowth, x = supp, y = len)


# Q3.1.10
library(plotly)
plot_ly(iris,
  x = ~Petal.Width,
  y = ~Petal.Length,
  z = ~Sepal.Width,
  color = ~Species, type = "scatter3d", mode = "markers"
)

# Q3.1.11
library(ggplot2)
library(gganimate)
library(coronavirus)
covid19_df <- refresh_coronavirus_jhu()
covid19_df <- subset(covid19_df, location == "Netherlands")
covid19_df$value[covid19_df$data_type == "cases_new"] <- covid19_df$value[covid19_df$data_type == "cases_new"] / 10
p <- ggplot(covid19_df, aes(date, value, color = data_type)) +
  geom_line() +
  theme_bw() +
  scale_color_discrete(labels = c("cases / 10", "deaths")) +
  labs(title = "Covid-19 in NL", color = element_blank()) +
  transition_reveal(date)
animate(p, nframes = 500, fps = 25, width = 500, height = 500, end_pause = 70)

# Q3.1.12
library(tidyquant)
getSymbols("AAPL",
  from = "2021-01-01",
  to = "2021-12-31", warnings = FALSE,
  auto.assign = TRUE
)
plot(AAPL[, 1])
# the operations carried out by plot() depends on the class of the 
# provided argument.
# AAPL has the class xts specific to time series
# the generic plot function designs the visualization accordingly

# Q3.1.13
plot2021 <- function(stocksym) {
  library(tidyquant)
  my_data <- getSymbols(stocksym,
    from = "2021-01-01",
    to = "2021-12-31", warnings = FALSE,
    auto.assign = FALSE
  )
  plot(my_data[, 1])
}
plot2021("GOOG")


# Q3.1.14
# Anything goes as long as it follows style guidelines.

# Q3.1.15
# assignment with =, bad variable names, T instead of TRUE, 
# double usage of variable name,
# squeezed one-liner, redundant loop and variable, 
# inconsistent braces, use of global variable, no comments explaining the why.
w <- "apple"
v <- function(x) {
  y <- strsplit(x, " ", )
  v <- 0
  for (z in unlist(y)) {
    if (z == w) {
      v <- v + 1
    }
  }
  if (v > 0) {
    return(T)
  }
}
v("i bought two bananas and an apple")

# Q3.1.16
my_matrix <- matrix(1:9, 3, byrow = TRUE) * 1:3

# Q3.1.17
for_function <- function(x) {
  current_num <- 1
  for (i in 1:x) {
    current_num <- current_num * i
  }
  current_num
}

# Q3.1.18
devtools::install_github("sctyner/memer")
library(memer)
library(dplyr)
meme_get("HotlineDrake") %>%
  meme_text_drake(
    "Submitting before the deadline",
    "Submitting AT the deadline"
  )
