# Check if we have the data in memory already
if(!exists('data'))
{
  # We don't, so retrieve it from the source file
  source('retrieve-data.R')   
}

# Set up the environment to write the contents to a "png" file
png(
  filename = 'plot1.png',
  width = 480,
  height = 480,
  units = 'px',
  bg = 'transparent'
)

# Now that we have the data, build the graph
with(
  data,
  hist(
    Global_active_power,
    main = 'Global Active Power',
    xlab = 'Global Active Power (kilowatts)',
    ylab = 'Frequency',
    col = 'red'
  )
)

# Close off our connection to the output file
dev.off()
