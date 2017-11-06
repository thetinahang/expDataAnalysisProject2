##################################
## Q4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999–2008?
###################################

# Clear
rm(list = ls())
set.seed(1)

# Load in the NEI & SCC data frames.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset the coal combustion-related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 

# Combine the two
coalCombustion <- (combustionRelated & coalRelated)

combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px",bg="white")

library(ggplot2)

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/1000,fill=year)) +
  geom_bar(stat="identity") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()
