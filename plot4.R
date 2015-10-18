# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalNames  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
coalSCC <- SCC[coalNames, ]
coalData <- merge(NEI,coalSCC,by="SCC")

TotalsByYear <- tapply(coalData$Emissions,coalData$year,sum)
TotalsByYear <- lapply(TotalsByYear, function(x) x / 1e5)

# Create the graphics device
png(filename="plot4.png",height=480,width=480)

# Plot the data
plot(names(TotalsByYear),TotalsByYear,type="l",col="red",ylab="Emissions (100,000s of  Tons)",
     xlab="Year",main="Total Coal Combustion-Related PM2.5 Emissions Per Year\nIn The United States")

# Save the graphics file
dev.off()

