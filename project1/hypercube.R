dimension<-c()
dists<-c()
distance<-c()
for (dim in 1:30) {

	for (i in 1:1000) {
        	P1<-runif(dim)
        	P2<-runif(dim)
        	dist<-sqrt(sum((P1-P2)^2))
        	dists<-c(dists, dist)
	}
	dimension[dim]<-dim
	mean.dist<-mean(dists)
	distance<-c(distance, mean.dist)
}
plot(distance~dimension)
