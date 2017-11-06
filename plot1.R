##################################
## Q1: Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, make a plot 
## showing the total PM2.5 emission from all sources for each of 
## the years 1999, 2002, 2005, and 2008.
###################################

# Clear
rm(list = ls())
set.seed(1)

# Load in the NEI & SCC data frames.
# Downloaded the zip file beforehand. 
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregate, using sum, the total PM2.5 emissions by year
aggregateTotals <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="white")

barplot(
  (aggregateTotals$Emissions)/10^6,
  names.arg=aggregateTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources",
  col = c("red", "yellow", "green", "blue")
)

dev.off()
