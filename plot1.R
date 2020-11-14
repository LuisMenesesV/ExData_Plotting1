# Leer, nombrar y crear subconjuntos de datos de consumo de energía
energia <- read.table("D:/Coursera R/4.Analisis Exploratorio de Datos/household_power_consumption.txt",skip=1,sep=";")
head(energia)
names(energia) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(energia)
subenergia <- subset(energia,energia$Date=="1/2/2007" | energia$Date =="2/2/2007")

# llamar a la función gráfica básica
hist(as.numeric(as.character(subenergia$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# grafico png
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
    