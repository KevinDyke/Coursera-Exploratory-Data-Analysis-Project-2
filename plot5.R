# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get the Baltimore City, Maryland subset
Baltimore <- subset(NEI,fips == "24510")

# get the subset of motor pollutants
SCC_Motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC_Motor <- as.character(SCC_Motor)
SCC <- SCC[SCC_Motor,]
Baltimore <- Baltimore[Baltimore$SCC %in% SCC$SCC, ]

TotalsByYear <- tapply(Baltimore$Emissions,Baltimore$year,sum)

# Create the graphics device
png(filename="plot5.png",height=480,width=480)

# Plot the data
plot(names(TotalsByYear),TotalsByYear,type="l",col="red",ylab="Emissions",
     xlab="Year",main="Total PM2.5 Emissions From Motor Vehicle Sources\nIn Baltimore City, Maryland")

# Save the graphics file
dev.off()

