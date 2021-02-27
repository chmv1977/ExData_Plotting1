# Check if we have the data in memory already
if(!exists('data'))
{
  # We don't, so retrieve it from the source file
  source('retrieve-data.R')   
}

# Set up the environment to write the contents to a "png" file
png(
  filename = 'plot4.png',
  width = 480,
  height = 480,
  units = 'px',
  bg = 'transparent'
)

# Set the graph up in the 2 x 2 matrix
par(mfrow = c(2, 2))

# Build the Top-Left graph (same as "plot2")
with(
  data,
  plot(
    Time,
    Global_active_power,
    type = 'l',
    xlab = '',
    ylab = 'Global Active Power'
  )
)

# Build the Top-Right graph
with(
  data,
  plot(
    Time,
    Voltage,
    type = 'l',
    xlab = 'datetime',
    ylab = 'Voltage'
  )
)

# Build the Bottom-Left graph
with(
  data,
  plot(
    Time,
    Sub_metering_1,
    type = 'n',
    xlab = '',
    ylab = 'Energy sub metering',
    col = 'black'
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

with(
  data,
  lines(
    Time,
    Sub_metering_3,
    col = 'blue'
  )
)

# Add in the legend with no border
legend(
  'topright',
  c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  col = c('black', 'red', 'blue'),
  lwd = 1,
  bty = 'n'
)

# Build the Bottom-Right graph
with(
  data,
  plot(
    Time,
    Global_reactive_power,
    type = 'l',
    xlab = 'datetime'
  )
)

# Close off our connection to the output file
dev.off()
