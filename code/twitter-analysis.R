
# Libraries ---------------------------------------------------------------
library("pacman")

# load packages/libraries
p_load("tidyverse",
       "rtweet",
       "cowplot")


# authenticate twitter ----------------------------------------------------
# execute the following
auth_setup_default()


# Search tweets -----------------------------------------------------------
search <- search_tweets("bioinformatics", 
                                  n = 5000,
                                  include_rts = T)


search2 <- search_tweets("mastodon AND elon musk",
                         n = 5000,
                         include_rts = T)



# plot data ---------------------------------------------------------------
s1 <- ts_plot(search, "days", colour = "darkblue") +
  theme_bw() +
  ggtitle("Daily number of tweets (and retweets) about Bioinformatics",
          subtitle = "Extracted using the rtweet package") +
  theme(text = element_text(size = 14),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))



s2 <- ts_plot(search2, "days", colour = "darkred") +
  theme_bw() +
  ggtitle("Daily number of tweets (and retweets) about Mastodon and Elon Musk",
          subtitle = "Extracted using the rtweet package") +
  theme(text = element_text(size = 14),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))


comparison.p <- plot_grid(s1, s2,
          labels = "AUTO") 


# save plot
ggsave("tweets-comparison.png",
       comparison.p,
       width = 20,
       height = 8)

# for more information:
# https://cran.r-project.org/web/packages/rtweet/rtweet.pdf