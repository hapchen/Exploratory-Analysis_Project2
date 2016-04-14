setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 5
NEIvehicle <- NEI[NEI$type == "ON-ROAD",]
baltNEIvehicle <- NEIvehicle[NEIvehicle$fips == "24510",]
emis_balt_ve <- aggregate(Emissions ~ year, baltNEIvehicle, sum)
png("plot5.png", width = 480, height = 480)
plot(emis_balt_ve$year,emis_balt_ve$Emissions,type = 'l',xlab = "Year",
     ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions from motor vehicles in 
     Baltimore City from 1999 to 2008")
dev.off() 