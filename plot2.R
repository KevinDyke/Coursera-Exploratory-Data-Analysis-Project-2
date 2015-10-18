# Coursera Exploratory Data Project Two
# Question Two - Have total emissions from PM2.5 decreased in the 
# Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base
# plotting system to make a plot answering this question.

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get the Baltimore City, Maryland subset
Baltimore <- subset(NEI,fips == "24510")

# Summate the data over emissions per year
# divide emissions to get number of thousands of tens per year
TotalsByYear <- aggregate(Emissions ~ year, Baltimore, sum )
TotalsByYear$Emissions[] <- TotalsByYear$Emissions[] / 1e3

# Create the graphics device
png(filename="plot2.png",height=480,width=480)

# Plot the data
barplot(height=TotalsByYear$Emissions, names.arg=TotalsByYear$year,
        col="green",xlab="Year", ylab="Emissions (Thousands of Tons)",
        main="Total PM2.5 Emissions Per Year In Baltimore City, Maryland")

# Save the graphics
dev.off()