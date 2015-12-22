###################################################################
#
# Data by Finnish Meteorological Institute
# http://en.ilmatieteenlaitos.fi/open-data-licence
#
# rmi R package Jussi Jousimo et al. (C) 2014
# https://github.com/rOpenGov/fmi
#
# Blog post http://tuijasonkkila.fi/blog/2015/01/snow-in-lapland/
#
####################################################################

library(shiny)
library(xts)
library(dygraphs)
library(leaflet)
library(shinythemes)

# ogr2ogr -f "GeoJSON" hiihtonnnn.gpx hiihtonnnn.geojson tracks

hiihto1213 <- RJSONIO::fromJSON("hiihto1213.geojson")
hiihto1214 <- RJSONIO::fromJSON("hiihto1214.geojson")
hiihto1215 <- RJSONIO::fromJSON("hiihto1215.geojson")
hiihto1216 <- RJSONIO::fromJSON("hiihto1216.geojson")

saariselka <- read.table(file = "snow.Saariselka",
                         header = TRUE,
                         sep = ";",
                         colClasses = c("Date", "numeric"),
                         stringsAsFactors = FALSE)

kilpisjarvi <- read.table(file = "snow.Kilpisjarvi",
                          header = TRUE,
                          sep = ";",
                          colClasses = c("Date", "numeric"),
                          stringsAsFactors = FALSE)

salla <- read.table(file = "snow.Salla",
                    header = TRUE,
                    sep = ";",
                    colClasses = c("Date", "numeric"),
                    stringsAsFactors = FALSE)

# Assuming here that -1 = 0
saariselka$Snow[saariselka$Snow == -1] <- 0
kilpisjarvi$Snow[kilpisjarvi$Snow == -1] <- 0
salla$Snow[salla$Snow == -1] <- 0

saariselka.xts <- as.xts(as.matrix(saariselka), order.by=saariselka[,1])
kilpisjarvi.xts <- as.xts(as.matrix(kilpisjarvi), order.by=kilpisjarvi[,1])
salla.xts <- as.xts(as.matrix(salla), order.by=salla[,1])

s.k <- cbind(saariselka.xts, kilpisjarvi.xts)
snow <- cbind(s.k, salla.xts)
