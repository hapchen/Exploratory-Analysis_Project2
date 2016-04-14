setwd("~/Documents/R/exdata-data-NEI_data")

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 4
scc_coal <- SCC[grep("coal", SCC$Short.Name), ]
emissions_coal <- NEI[NEI$SCC %in% scc_coal$SCC, ]
emissions_year_coal <- aggregate(Emissions ~ year, emissions_coal, sum)
png("plot4.png", width = 480, height = 480)  
plot(emissions_year_coal$year,emissions_year_coal$Emissions,type = 'l',xlab = "Year",
     ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions from Coal 
     Combustion-related sources in US")
dev.off()