##################################
## Q2: Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base
## plotting system to make a plot answering this question.
###################################

# Clear
rm(list = ls())
set.seed(1)

# Load in the NEI & SCC data frames.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip number.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate, using sum, the Baltimore emissions data by year
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="white")

barplot(
  aggregateTotalsBaltimore$Emissions,
  names.arg=aggregateTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources",
  col = c("red", "yellow", "green", "blue")
)

dev.off()
