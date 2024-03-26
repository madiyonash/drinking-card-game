#create df for cards

library("tidyverse")
library("imager")

name <- c("hot seat", "rule master", "chug", "horse ride")
link <- c("https://github.com/madiyonash/drinking-card-game/blob/main/cards/card1.png", 
          "https://github.com/madiyonash/drinking-card-game/blob/main/cards/card2.png", 
          "https://github.com/madiyonash/drinking-card-game/blob/main/cards/card3.png",
          "https://github.com/madiyonash/drinking-card-game/blob/main/cards/card4.png")
description <- c("anyone can ask questions to drawer for one minute",
          "you make a rule that lasts for one round",
          "chug your drink for 3 seconds while everyone says CHUG",
          "let the person to your right ride you like a horse")
card_list <- data.frame(name, link, description)
view(card_list)

aPNGFile <- "https://github.com/madiyonash/drinking-card-game/blob/main/cards/card1.png?raw=true"
destfile <- "card1.png"
card1 <- download.file(aPNGFile, destfile, mode="wb")


