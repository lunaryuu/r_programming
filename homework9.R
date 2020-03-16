library("ggplot2")
library("scales")

FloridaVote <- read.csv("Florida.csv")
FloridaVote <- FloridaVote[,1:3]

#order from highest votes to lowest so can extract top 10
FloridaVote_sort <- FloridaVote[order(FloridaVote$GORE, decreasing = TRUE),]
top10Votes <- FloridaVote_sort[1:10,]
top10Votes


#PLOTS
ggplot(top10Votes, aes(COUNTY, GORE))+ geom_col(fill = rainbow(10))+ scale_y_continuous(labels = comma) + 
  labs(title = "Top 10 Votes per County in Florida for Al Gore Election 2000")

pie(top10Votes$GORE, col = rainbow(10), labels = top10Votes$COUNTY[1:10], main = "Top 10 Votes per County in Florida for Al Gore Election 2000")

ggplot(top10Votes, aes(COUNTY, BUSH))+ geom_col(fill = topo.colors(10))+ scale_y_continuous(labels = comma) + 
  labs(title = "Top 10 Votes per County in Florida for George W. Bush Election 2000") + coord_flip()
