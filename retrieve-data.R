# this script is getting data
# which needed for the project.

# we are downloading data from
sourceUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

# The zip file that we will download the data to
zipFileName <- 'exdata-data-household_power_consumption.zip'

# The text file that will be extracted from the zip file
sourceFileName <- 'household_power_consumption.txt'

# Do we already the text file?
if(!file.exists(sourceFileName))
{
  # No we don't, so check if we have the zip file
  if(!file.exists(zipFileName))
  {
    # We don't have the zip file, so download it
    download.file(sourceUrl, zipFileName, method = 'curl')
  }
  
  # Unzip the zip file
  unzip(zipFileName)
}

# Now that our working directory is set up, now let's start reading the data in

# First take a sampling so we can derive the actual classes
sampling <- read.table(
  sourceFileName,
  header = TRUE,
  nrows = 5,
  sep = ';',
  na.strings = '?',
  stringsAsFactors = FALSE
)

# Get the class of the columns
classes <- sapply(sampling, class)

# Now reading the data
data <- read.table(
  sourceFileName,
  header = TRUE,
  sep = ';',
  na.strings = '?',
  colClasses = classes,
  stringsAsFactors = FALSE
)

# Get the subset of data that we need
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

# make the data into the correct data types
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data$Time <- strptime(paste(data$Date, data$Time), format='%Y-%m-%d %H:%M:%S')

# Get rid of the sample information
rm(sampling, classes)

