#### PolLimCrop Database - code for obtaining manuscript figures 2b, 2c and 2d ####
##### FIGURE 2b #########
library(ggplot2)
setwd()
data<-read.csv(file.choose(),sep=";",dec=",", header=T)
ggplot(data, aes(x= Year)) + 
  geom_histogram(color="white", alpha=1, fill = "steelblue4", breaks = seq(1950, 2020, by = 3)) +
  scale_x_continuous(breaks = seq(0, 1, by=10)) +
  labs(y= "Number of studies", x = "Year") +
  theme_bw()+ 
  theme(axis.text = element_text(size = 20), 
        axis.title.x= element_text(margin = margin(t=15)), 
        axis.title.y= element_text(margin = margin(r=5)), 
        axis.title = element_text(size = 22),
        plot.margin = margin(t = 10,  # Top margin
                             r = 80,  # Right margin
                             b = 5,  # Bottom margin
                             l = 10)) + # Left margin) +
  scale_x_continuous(sec.axis=sec_axis(~., breaks = NULL)) +
  scale_y_continuous(sec.axis=sec_axis(~., breaks = NULL))

##### FIGURE 2c #########
data$PL=as.numeric(data$PL)
ggplot(data, aes(x= PL)) + 
  geom_histogram(color="black", alpha=0.25, fill = "black", breaks = seq(0, 1, by = 0.1)) +
  scale_x_continuous(breaks = seq(0, 1, by=0.2)) +
  labs(y= "Number of entries", x = "Pollen Limitation", mgp=c(3,3,0)) +
  theme_classic()+
  geom_segment(aes(x=0.27, xend=0.27, y=0, yend=500), color = "black", linetype = "dashed", size = 1) +
  annotate("text", x=0.235, y=350, label= "mean value of PL", angle ="90", color ="black", size=7) +
  theme(axis.text = element_text(size = 19), axis.title.x= element_text(margin = margin(t=15))
        , axis.title.y= element_text(margin = margin(r=10)), axis.title = element_text(size = 21))   +
  scale_x_continuous(sec.axis=sec_axis(~., breaks = NULL)) +
  scale_y_continuous(sec.axis=sec_axis(~., breaks = NULL))

##### FIGURE 2d #########
library(forcats)

ten.crops <- c("Apple", "Lowbush blueberry", "Almond", "Oilseed rape", "Kiwifruit", "Highbush blueberry", "Sweet cherry", "Plum", "Feijoa", "Pear")
selected_rows <- data[data$crop %in% ten.crops, ]

ggplot(selected_rows, aes(x=fct_infreq(crop))) +
  theme_bw() +
  labs(y= "Number of entries", x = "Crops", mgp=c(3,3,0)) +
  ylim (-10,400) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 5)) +
  theme(axis.title = element_text(size =30), axis.text = element_text(size=26))   +
  geom_bar(stat="count", width=0.7, fill="steelblue") +
  geom_text(x=1, y=-12, label="[25]", size = 10, color="darkgreen") +
  geom_text(x=2, y=-12, label="[1]", size = 10, color="darkgreen") +
  geom_text(x=3, y=-12, label="[9]", size = 10, color="darkgreen") +
  geom_text(x=4, y=-12, label="[10]", size = 10, color="darkgreen") +
  geom_text(x=5, y=-12, label="[10]", size = 10, color="darkgreen") +
  geom_text(x=6, y=-12, label="[14]", size = 10, color="darkgreen") +
  geom_text(x=7, y=-12, label="[9]", size = 10, color="darkgreen") +
  geom_text(x=8, y=-12, label="[6]", size = 10, color="darkgreen") +
  geom_text(x=9, y=-12, label="[9]", size = 10, color="darkgreen") +
  geom_text(x=10, y=-12, label="[3]", size = 10, color="darkgreen") +
  geom_text(x=11, y=-12, label="[4]", size = 10, color="darkgreen") +
  geom_text(x=12, y=-12, label="[7]", size = 10, color="darkgreen") +
  geom_text(x=13, y=-12, label="[4]", size = 10, color="darkgreen") +
  geom_text(x=14, y=-12, label="[2]", size = 10, color="darkgreen") +
  geom_text(x=15, y=-12, label="[5]", size = 10, color="darkgreen")
#fruit ilustrations (made by Catarina Siopa) were added outside of R.

### end ###
