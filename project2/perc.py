#!/usr/bin/python
from sys import argv
from random import choice, random
density=float(argv[1])
maxsteps=10000
npart=10000
perc=0
side=31  #Should be an odd number
time=0
steps = [(1,0),(-1,0),(0,1),(0,-1)]
grid=[[0 for x in range(side)] for y in range(side)]
for ipart in range(npart):
    for i in range(side):
        for j in range(side):
            if density>random():
                grid[i][j]=1
    # Start particle at center
    x,y = side/2,side/2
    counter=0
    # perform the random walk until particle departs
    for k in range(maxsteps):
        counter+=1
        grid[x][y]=0   #Remove particle from current spot
        # Randomly move particle
        sx,sy = choice(steps)
        nx = x + sx
        ny = y + sy
        if grid[nx][ny]==1:
            continue
        if nx==0 or ny==0 or nx==(side-1) or ny==(side-1):
            perc+=1
            time+=counter
            break
        grid[x][y]=1   #Put particle in new location
	grid[nx][ny]=1
	x=nx
	y=ny
avetime=float(time)/npart
#print "<t>=%5.2F <t>/r2=%5.2f"%(avetime, avetime/(side**2))
print "Percolation probability =%5.2f"%(float(perc)/npart)
