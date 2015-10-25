# Question Six - Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037") Which city has seen greater changes over time in motor
# vehicle emissions?

library(ggplot2)

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get the Baltimore and Los Angeles subsets
Counties <- NEI[NEI$fips == "24510" | NEI$fips == "06037",]

# Get the subset of motor pollutants
SCC_Motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
# Make sure the subset consists of characters
SCC_Motor <- as.character(SCC_Motor)
# Get the subset of motor vehicle pollutions
SCC <- SCC[SCC_Motor,]
# Get the subset of motot vehicle pollutions in the areas of interest
Counties <- Counties[Counties$SCC %in% SCC$SCC, ]

# Summate the emissions by year
TotalsByYear <- aggregate(Emissions ~ year + fips, Counties, sum)
# Change the fips to meaniful names not neccessary but useful
TotalsByYear$fips[TotalsByYear$fips=="24510"] <- "Baltimore, MD"
TotalsByYear$fips[TotalsByYear$fips=="06037"] <- "Los Angeles, CA"

# Create the graphics device
png(filename="plot6.png",height=480,width=480)

g <- qplot(year, Emissions, data=TotalsByYear, color=fips, geom ="line")
g <- g + ggtitle("Total PM2.5 Emissions From Motor Vehicle Sources Per Year\nIn Baltimore, Maryland And Los Angeles County, California")
g <- g + xlab("Year") + ylab("Emissions")
print(g)

# Save the graphics
dev.off()