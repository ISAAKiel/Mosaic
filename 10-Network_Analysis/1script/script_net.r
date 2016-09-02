################################################
## GSHDL Course: Introduction to R
## =============================================
## Project: Mosaic
## Author: Oliver Nakoinz
## Version: 01
## Date of last changes: 07.09.2016
## Data: a) HEK rings, b) monuments Dänischer Wohld, c)SRTM
## Author of data: a) (Nakoinz 2005), b) (Nakonz/Knitter 2016), c) Nasa/USGS
## Purpose: didactic
## Content:  ...
## Description: Code from the presentation
## Licence data: a) GPL, b) GPL, c) public domain
## Licence Script: GPL
##    (http://www.gnu.org/licenses/gpl-3.0.html)
################################################

library("igraph")
n1 <- graph( edges=c(1,5, 2,4, 1,3, 2,5, 3,5, 1,2, 3,4), n=6, directed=T ) 
plot(n1)
n1
E(n1)
V(n1)
get.adjacency(n1)

n1 <- set_vertex_attr(n1, "label", value =c("p1", "p2", "p3", "Ppoint4", "Punkt 5", "6"))
plot(n1)


n2 <- make_full_graph(22)
plot(n2)

n3 <- make_tree(22, children = 3, mode = "undirected")
plot(n3)


library("spdep")
wd <- "/home/fon/daten/analyse/mosaic"  
setwd(wd)  
set.seed(1242)
co.weapons <- read.csv("2data/shkr-weapons.csv", header=TRUE, sep=";")[sample(1:220,10),1:2]


coords <- as.matrix(coordinates(co.weapons))
ids <- row.names(as.data.frame(co.weapons))
wts <- co.weapons[,1]; wts[] <- 1
fs_nb_del <- tri2nb(co.weapons, row.names=ids)       
del <- nb2lines(fs_nb_del, wts=wts, coords=coords,  proj4string =  CRS(as.character(crs1)))
fs_nb_soi <- graph2nb(soi.graph(fs_nb_del, coords),   row.names=ids)
soi <- nb2lines(fs_nb_soi, wts=wts, coords=coords,  proj4string =  CRS(as.character(crs1)))
fs_nb_gabriel <- graph2nb(gabrielneigh(coords),  row.names=ids)  
gabriel <- nb2lines(fs_nb_gabriel, wts=wts,   coords=coords, proj4string =  CRS(as.character(crs1)))
fs_nb_relative <- graph2nb(relativeneigh(coords),  row.names=ids) 
relative <- nb2lines(fs_nb_relative, wts=wts,  coords=coords, proj4string =  CRS(as.character(crs1)))

plot(del)
plot(soi)
plot(gabriel)
plot(relative)


n4nb <- nb2mat(fs_nb_del, style="B", zero.policy=TRUE)
n4 <- graph.adjacency(n4nb, mode="undirected")
plot(n4)








longest distance between two nodes
diameter(n1, directed=F, weights=NA)


degree(n4)
closeness(n4)
betweenness(n4)
edge_betweenness(n4)


ceb <- cluster_edge_betweenness(n4) 
dendPlot(ceb, mode="hclust")
plot(ceb, n4) 





