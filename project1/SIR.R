alpha<-0.00218 #(person-1 day-1)
gamma<-0.44 #(day-1)
S<-762
I<-1
R<-0
S.hist<-c()
I.hist<-c()
R.hist<-c()
for (day in 1:30) {
	S.hist[day]<-S
	I.hist[day]<-I
	R.hist[day]<-R
	# You need to add next three lines from notes
	delta.S<-(-alpha*S*I)
	delta.I<-alpha*S*I-gamma*I
	delta.R<-gamma*I

	S<-S+delta.S
	I<-I+delta.I
	R<-R+delta.R
	# Ensure S,I,R > 0
	S<-max(S,0) 
	I<-max(I,0)
	R<-max(R,0)
}
plot(S.hist,type="l")
lines(I.hist,col=2)
lines(R.hist,col=3)
