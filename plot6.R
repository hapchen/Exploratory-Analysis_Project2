setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 6
NEIvehicle <- NEI[NEI$type == "ON-ROAD",]
baltNEIvehicle <- NEIvehicle[NEIvehicle$fips == "24510",]
baltNEIvehicle$city <- "Baltimore"
laNEIvehicle <- NEIvehicle[NEIvehicle$fips == "06037",]
laNEIvehicle$city <- "Los Angeles"            
baltlaNEI <- rbind(baltNEIvehicle, laNEIvehicle)
emis_bala_ve <- aggregate(Emissions ~ year + city, baltlaNEI, sum)

png("plot6.png", width = 640, height = 480)
library(ggplot2)
plot6 <- ggplot(data = emis_bala_ve, aes(x = year,y = Emissions,group = city, 
                                         color = city)) + geom_line() + xlab("Year") + ylab("PM2.5 Emissions") +
        ggtitle("Total PM2.5 Emissions from motor vehicles in Baltimore and LA from 1999 to 2008")
print(plot6) 
dev.off()