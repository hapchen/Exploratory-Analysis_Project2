setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 1 
Emissions_byyear <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png", width = 480, height = 480)
plot(Emissions_byyear$year,Emissions_byyear$Emissions/10^6,type = 'l',xlab = "Year",
     ylab = "PM2.5 Emissions (in 10^6 tons)", main = "Total PM2.5 Emissions from All Resources
     in US")
dev.off()

