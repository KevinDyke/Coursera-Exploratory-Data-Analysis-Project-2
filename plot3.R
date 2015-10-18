# Coursera Exploratory Data Project Two
# Question Three - Of the four types of sources indicated by the 
# type (point, nonpoint, onroad, nonroad) variable, which of these four sources
# have seen decreases in emissions from 1999-2008 for Baltimore City? Which 
# have seen increases in emissions from 1999-2008? Use the ggplot2 plotting 
# system to make a plot answer this question.

library(ggplot2)
library(plyr)

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get the Baltimore City, Maryland subset
Baltimore <- NEI[NEI$fips == "24510",]


# Summate the data over emissions per year
# divide emissions to get number of thousands of tens per 
TotalsByYearPerPointType <- ddply(Baltimore, .(year, type), function(x) sum(x$Emissions)/1e3)
colnames(TotalsByYearPerPointType)[3] <- "Emissions"

# Create the graphics device
png(filename="plot3.png",height=480,width=480)

# Plot the data
g <- qplot(year, Emissions, data=TotalsByYearPerPointType, color=type, geom ="line")
g <- g + ggtitle("Total PM2.5 Emissions Per Year In Baltimore, Maryland") + xlab("Year") + ylab("Emissions (Thousands of Tons)")
print(g)

dev.off()
