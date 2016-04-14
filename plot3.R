setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 3
baltNEI <- NEI[NEI$fips == "24510",]
baltbyyeartype <- aggregate(Emissions ~ year + type, baltNEI, sum)
png("plot3.png", width = 480, height = 480)
library(ggplot2)
plot3 <- ggplot(data = baltbyyeartype, aes(x = year,y = Emissions,group = type, 
                                           color = type)) + geom_line() + xlab("Year") + ylab("PM2.5 Emissions") +
        ggtitle("Total PM2.5 Emissions in Baltimore City from 1999 to 2008")
print(plot3) 
dev.off()