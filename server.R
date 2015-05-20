library(shiny)
library(datasets)

# Define server logic to simulate and display the simulation results.

shinyServer(function(input, output) {

      ns <- 2000
      ss <- 40  
      lambda <- 2
      sample <- vector(mode="numeric",length=0)
      xbar <- numeric(ns)
      # random.seed=2032 
      for (s in 1:ns) {
            sample <- rexp(ss, lambda)
            xbar[s] <- mean(sample)
      }
      
      output$plot <- renderPlot({
            nsamples <- input$samples
            m <- paste0("Histogram of Sample Means (n = ",format(nsamples, digits=4, nsmall=0),")")
            m <- paste0(m,"\nwith Density Curve (red) & Normal Curve (blue)")
            xbarp <- xbar[0:nsamples]
            d <- density(xbarp)
            h<-hist(xbarp, breaks=seq(0,1,length=50), freq=FALSE,
             main=m, xlim=c(0,1), xlab="Means", ylim=c(0,10))
            xfit<-seq(min(xbarp),max(xbarp),length=40) 
            yfit<-dnorm(xfit,mean=mean(xbarp),sd=sd(xbarp)) 
            lines(xfit, yfit, col="blue", lwd=2)
            abline(v=mean(xbarp),col="red",lty=3,lwd=2)
            sm <- paste0("Mean of Samples = ",format(mean(xbarp), digits=1, nsmall=4))
            legend(.6,8,legend=c("Theoretical Mean = 0.5",sm),
                   col=c("blue","red"),cex=.75)
            lines(d,col="red",lty=2,lwd=2)
      })

})