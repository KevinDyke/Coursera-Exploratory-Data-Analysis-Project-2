# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get the Baltimore City, Maryland subset
Baltimore <- NEI[NEI$fips == "24510",]


# Summate the data over emissions per year
# divide emissions to get number of thousands of tens per 
TotalsByYear <- aggregate(Emissions/1e3 ~ year, Baltimore, sum)

# Plot the data
barplot(height=TotalsByYear$Emissions,names.arg=TotalsByYear$year,
        xlab="Year",ylab="Emissions (Thousands of tons)",col = "green",
        main="PM2.5 emissions per year in Baltimore, Maryland",space=0)

