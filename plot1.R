# Coursera Exploratory Data Project Two
# Question One - Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot showing the
# total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Summate the data over emissions per year
# divide emissions by one million to get number of millions of tons per year
TotalsByYear <- aggregate(Emissions ~ year, NEI, sum )
TotalsByYear$Emissions[] <- TotalsByYear$Emissions[] / 1e6

# Create the graphics device
png(filename="plot1.png",height=480,width=480)

# Plot the data
barplot(height=TotalsByYear$Emissions, names.arg=TotalsByYear$year,
        col="green",xlab="Year", ylab="Emissions (Millions of Tons)",
        main="Total PM2.5 Emissions Per Year In The United States")

# Save the graphics file
dev.off()