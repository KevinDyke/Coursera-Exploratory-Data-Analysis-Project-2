# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get the Baltimore City, Maryland subset
Baltimore <- NEI[NEI$fips == "24510",]


# Summate the data over emissions per year
# divide emissions to get number of thousands of tens per 
TotalsByYear <- aggregate(Emissions ~ year, Baltimore, sum)

# Plot the data
qplot(year,Emissions,data=TotalsByYear,facets=.~type,geom=c("point","smooth"),method = "lm")

