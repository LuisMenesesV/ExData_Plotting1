# Leer, nombrar y crear subconjuntos de datos de consumo de energía
energia <- read.table("D:/Coursera R/4.Analisis Exploratorio de Datos/household_power_consumption.txt",skip=1,sep=";")
head(energia)
names(energia) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(energia)
subenergia <- subset(energia,energia$Date=="1/2/2007" | energia$Date =="2/2/2007")

# Transformar las variables de fecha y hora de caracteres en objetos de tipo Date y POSIXlt respectivamente
subenergia$Date <- as.Date(subenergia$Date, format="%d/%m/%Y")
subenergia$Time <- strptime(subenergia$Time, format="%H:%M:%S")
subenergia[1:1440,"Time"] <- format(subenergia[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subenergia[1441:2880,"Time"] <- format(subenergia[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subenergia$Time,as.numeric(as.character(subenergia$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
