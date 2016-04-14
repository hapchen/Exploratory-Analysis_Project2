setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 2
baltNEI <- NEI[NEI$fips == "24510",]
baltbyyear <- aggregate(Emissions ~ year, baltNEI, sum)
png("plot2.png", width = 480, height = 480)
plot(baltbyyear$year,baltbyyear$Emissions/10^6,type = 'l',xlab = "Year",
     ylab = "PM2.5 Emissions (in 10^6 tons)", main = "Total PM2.5 Emissions in 
     Baltimore City from 1999 to 2008")
dev.off()    

