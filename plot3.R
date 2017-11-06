##################################
## Q3: Of the four types of sources indicated by the 
## 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which
## of these four sources have seen decreases in emissions from 
## 1999–2008 for Baltimore City? Which have seen increases in 
## emissions from 1999–2008? Use the ggplot2 plotting system to 
## make a plot answer this question.
###################################

# Clear
rm(list = ls())
set.seed(1)

# Load in the NEI & SCC data frames.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip number.
baltimoreNEI <- NEI[NEI$fips=="24510",]

png("plot3.png",width=480,height=480,units="px",bg="white")

library(ggplot2) 

# Separate by type as mentioned above
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
