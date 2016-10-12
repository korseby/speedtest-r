speedtest <- read.table("speedtest.csv", header=TRUE, sep=",", quote="\"", fill=TRUE, dec=".")
attach(speedtest)

pdf("speedtest.pdf", encoding="ISOLatin1", pointsize=10, width=9, height=6, family="Helvetica")
par(mfrow=c(1,1), mar=c(10,4,4,1), oma=c(0,0,0,0))

plot(NA, ylim=c(0,110000), xlim=(c(Datum[1],Datum[length(Datum)-1])), xlab="", ylab="Speed [Mbit/s]", main="TeleColumbus Download-/Upload-Geschwindigkeit", xaxt="n", yaxt="n")
ypos <- c(5000, 50000, 100000)
axis(2, las=0, at=ypos, labels=sprintf("%.0fMbit", ypos/1000))
axis(1, las=2, at=Datum, labels=as.character(Datum), cex=0.1)
mtext(side=1, padj=14.5, "Datum")

lines(rep(100000,length(Datum))~Datum, ylim=c(0,110000), type="l", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#0000ff")
lines(Download*8000~Datum, ylim=c(0,110000), type="l", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#0000ff")
lines(Download*8000~Datum, ylim=c(0,110000), type="p", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#0000ff")

lines(rep(5000,length(Datum))~Datum, ylim=c(0,110000), type="l", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#ff0000")
lines(Upload*8000~Datum, ylim=c(0,110000), type="l", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#ff0000")
lines(Upload*8000~Datum, ylim=c(0,110000), type="p", ann=F, pch=1, cex=1, lty=1, lwd=2, col="#ff0000")

detach(speedtest)
dev.off()
