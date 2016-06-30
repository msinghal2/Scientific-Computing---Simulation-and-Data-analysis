alpha.m1<-0.000006 #(person-1 day-1)
alpha.m2<-0.000002
alpha.f<-0.0000009
gamma.m<-0.05 #(day-1)
gamma.f<-0.007
S.m<-14000
S.f<-9000
I.m<-1000
I.f<-1000
#R<-0
S.m.hist<-c()
I.m.hist<-c()
S.f.hist<-c()
I.f.hist<-c()
#R.hist<-c()
for (day in 1:2000) {
        S.m.hist[day]<-S.m
        I.m.hist[day]<-I.m
        S.f.hist[day]<-S.f
        I.f.hist[day]<-I.f
        #R.hist[day]<-R
        # You need to add next three lines from notes
        delta.S.m <- (gamma.m*I.m)-(alpha.m1*S.m*I.f)
        delta.I.m <- (alpha.m1*S.m*I.f)-(gamma.m*I.m)
        delta.S.f<- (gamma.f*I.f)-(alpha.f*S.f*I.m)
        delta.I.f<- (alpha.f*S.f*I.m)-(gamma.f*I.f)
        #delta.R <- gamma*I
        S.m<-S.m+delta.S.m
        I.m<-I.m+delta.I.m
        S.f<-S.f+delta.S.f
        I.f<-I.f+delta.I.f
	#R<-R+delta.R
        # Ensure S,I,R > 0
        S.m<-max(S.m,0)
        I.m<-max(I.m,0)
        S.f<-max(S.f,0)
        I.f<-max(I.f,0)
        #R<-max(R,0)
}
png("plot_alpham1.png")
plot(I.m.hist,type="l", xlab="time steps", ylab="infected population")
lines(I.f.hist,col=2)
legend('bottomright', c("Males","Females"), lty=1, col=c('black','red'))  
dev.off()

S.m<-14000
S.f<-9000
I.m<-1000
I.f<-1000

S.m.hist<-c()
I.m.hist<-c()
S.f.hist<-c()
I.f.hist<-c()

for (day in 1:2000) {
        S.m.hist[day]<-S.m
        I.m.hist[day]<-I.m
        S.f.hist[day]<-S.f
        I.f.hist[day]<-I.f
        #R.hist[day]<-R
        # You need to add next three lines from notes
	delta.S.m <- (gamma.m*I.m)-(alpha.m2*S.m*I.f)
        delta.I.m <- (alpha.m2*S.m*I.f)-(gamma.m*I.m)
        delta.S.f<- (gamma.f*I.f)-(alpha.f*S.f*I.m)
        delta.I.f<- (alpha.f*S.f*I.m)-(gamma.f*I.f)
        #delta.R <- gamma*I
        S.m<-S.m+delta.S.m
        I.m<-I.m+delta.I.m
        S.f<-S.f+delta.S.f
        I.f<-I.f+delta.I.f
        #R<-R+delta.R
        # Ensure S,I,R > 0
        S.m<-max(S.m,0)
        I.m<-max(I.m,0)
        S.f<-max(S.f,0)
        I.f<-max(I.f,0)
        #R<-max(R,0)
}
png("plot_alpham2.png")
plot(I.m.hist,type="l", xlab="time steps", ylab="infected population")
lines(I.f.hist,col=2)
legend('topright', c("Males","Females"), lty=1, col=c('black','red'))
dev.off()

