
## library
library(tidyverse)

## slide: a erfect fit

# Create the data
df <- data.frame(
  rater = 1:5,
  rating = rep(5, 5)
)

# Generate the scatter plot
p_perfect_fit <- 
  ggplot(df, aes(x = rater, y = rating)) +
  geom_hline(yintercept = 5, color = "blue", size = 1) +
  geom_point(color = "yellow", fill = "red", shape = 21, size = 4, stroke = 1.5) +
  scale_x_continuous(breaks = 1:5) +
  scale_y_continuous(limits = c(0, 6), breaks = 0:6) +
  labs(x = "Rater", y = "Rating (out of 5)") +
  ggthemes::theme_base() +
  theme(plot.background = element_rect(color = "white"))

## saving plot
ggsave(
  plot = p_perfect_fit,
  filename = "plot/perfect_fit.jpeg", 
  width = 8, height = 6, units = "in", dpi = 300
)




## Slide calculating error

# Create the data
df <- data.frame(
  lecturer = factor(1:5),
  friends = c(1, 2, 3, 3, 4)
)

# Calculate the mean
mean_friends <- mean(df$friends)

# Create the plot
p_n_friends <- 
  ggplot(df, aes(x = lecturer, y = friends)) +
  geom_point(size = 4, color = "black", fill = "skyblue", shape = 21) +
  geom_hline(yintercept = mean_friends, linetype = "solid", color = "gray40") +
  geom_segment(aes(x = lecturer, xend = lecturer, y = friends, yend = mean_friends),
               linetype = "dashed", color = "red") +
  geom_text(aes(label = sprintf("%+.1f", friends - mean_friends), y = (friends + mean_friends)/2),
            color = "red", vjust = -0.5, size = 4) +
  labs(
    x = "Lecturer",
    y = "Number of Friends"
  ) +
  ggthemes::theme_base() +
  theme(plot.background = element_rect(color = "white"))

## saving plot
ggsave(
  filename = "plot/n_friends.jpeg",
  plot = p_n_friends,
  width = 8, height = 6, units = "in", dpi = 300
)




