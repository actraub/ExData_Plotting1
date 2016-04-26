# loads data for week 1 of coursera data explor class
# aaron traub

setup <- function () {
    filedirectory <- "./" #change name if needed
    zip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    filedirectory <- "./data"
    datasetzip <- paste (filedirectory, "/dataset.zip", sep="")
    # check to see if data exists
    if (!file.exists(filedirectory) ) {
        dir.create(filedirectory)
    }
    # check to see if the zip has been download and download if it has not
    if (!file.exists(zip) ) {
        download.file(zip, datasetzip, method="curl")
        # unzip files to data directoru
        unzip (datasetzip, exdir = filedirectory) 
    }
}
