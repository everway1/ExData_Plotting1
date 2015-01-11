outcome <- read.csv("household_power_consumption.txt", colClasses = "character")
n1 <- strsplit(names(outcome),"\\.")
df2 <- 1:9;dim(df2) <- c(1,9)
df2 <- as.data.frame(df2)
names(df2) <- n1[[1]]
cnt <- 1
d1 <- c("2007-02-01")
d2 <- c("2007-02-02")
z1 <- as.Date(d1,"%Y-%m-%d")
z2 <- as.Date(d2,"%Y-%m-%d")
for(i in 1:nrow(outcome)) {
  oneLine <- outcome[[1]][i]  
  oneLine <- strsplit(oneLine,";")
  for(j in 1:9) df2[1,j] <- oneLine[[1]][j]
  z3 <- as.Date(df2$Date,"%d/%m/%Y")
  if(is.na(z3)) next
  if(z3 < z1) next
  if(z3 > z2) break
  df2[1,3:9] <- as.numeric(df2[1,3:9])
  if(cnt==1) { df0 <- df2; cnt <- 7;}
  df0 <- rbind(df0,df2)
}
png(file="plot1.png")
hist(as.numeric(df0$Global_active_power),xlab="Global Active Power(kilowatts)", ylab="Frequency",main="Global Active Power",col="red")
dev.off()
