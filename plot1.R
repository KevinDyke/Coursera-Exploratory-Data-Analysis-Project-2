# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Summate the data over emissions per year
# divide emissions to get number of millions of tens per 
TotalsByYear <- aggregate(Emissions/1e6 ~ year, NEI, sum)

# Plot the data
barplot(height=TotalsByYear$Emissions,names.arg=TotalsByYear$year,
        xlab="Year",ylab="Emissions (Millions of tons)",col = "green",
        main="PM2.5 emissions per year in the United States",space=0)

