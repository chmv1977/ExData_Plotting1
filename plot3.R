# Check if we have the data in memory already
if(!exists('data'))
{
  # We don't, so retrieve it from the source file
  source('retrieve-data.R')   
}

# Set up the environment to write the contents to a "png" file
png(
  filename = 'plot3.png',
  width = 480,
  height = 480,
  units = 'px',
  bg = 'transparent'
)

# Now that we have the data, build the graph

# Draw the initial graph without any data on it
with(
  data,
  plot(
    Time,
    Sub_metering_1,
    type = 'n',
    xlab = '',
    ylab = 'Energy sub metering'
  )
)

# Add in the data for the first sub metering
with(
  data,
  lines(
    Time,
    Sub_metering_1,
    col = 'black'
  )
)

# Add in the data for the second sub metering
with(
  data,
  lines(
    Time,
    Sub_metering_2,
    col = 'red'
  )
)

# Add in the data for the third sub metering
with(
  data,
  lines(
    Time,
    Sub_metering_3,
    col = 'blue'
  )
)

# Add in the legend
legend(
  'topright',
  c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  col = c('black', 'red', 'blue'),
  lwd = 1
)

# Close off our connection to the output file
dev.off()
