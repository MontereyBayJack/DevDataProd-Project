library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
      
      # Application title
      titlePanel("Distribution of the Means of n Samples"),
      
      # Show the plot 
      mainPanel(plotOutput(outputId = "plot")),
      
      # Sidebar with a slider input for the number of bins
      sidebarLayout(
      sliderInput("samples", "Number of Samples:", 10, 2000, 10, step = 10, 
                        animate=animationOptions(interval=100, loop=FALSE)),
      # Documentation panel
      mainPanel(
            
            h2("Documentation"),
            h3("Controls:"),
            p("Click on the slider's 'play' control (bottom right) to see the effect of progressivley adding samples.",br(),
              "Click on the slider's 'pause' control to halt play.",br(),
              "Adjust the slider manually to select the number of samples."),
            h3("Description:"),
            p("This app shows the results of simulating a number of samples of 40 random exponentially distrubted numbers 
               with an arrival rate (lambda) of 2. The number of samples ranges from 10 to 2000."),br(),
            p("Displayed is a histogram of the sample means along with the density curve (in red) of the set of sample means 
               and the theoretical normal curve (in blue) producted by the central limit theorem for a sufficiently large 
               number of samples. The mean of the samples is also depicted in red."),br(),
            p("Increasing the number of sample means shown adds more samples to the existing set of sample data. 
               Refreshing the display produces an entirely different set of random samples for review.")
            
      )) # SidebarLayout      
      
))