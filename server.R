
shinyServer(function(input, output) {
    simulations <- reactive({input$obs})
    output$distPlot <- renderPlot({
        # generate an rnorm distribution and plot it
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        hist(dist,main="Histogram of Random Points",50,xlab="Distribution of normal generated data",col="gray")
    })
    output$distPlot2 <- renderPlot({
        # generate an rnorm distribution and plot it
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        plot(density(dist),main="Density of Random Points")
        abline(v=quantile(dist,0.75),col="blue")
        abline(v=quantile(dist,0.25),col="blue")
        abline(v=mean(dist),col="green")
    })
    output$pilotStudyNotice <- renderUI({
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        str0<-paste("left blue Line: Sample Quantile 25%  = ",round(quantile(dist,0.25),3) ,sep="")
        str1<-paste(" Middle green Line: Sample Mean = ", round(mean(dist),3),sep="")
        str2<-paste("right blue Line: Sample Quantile 75% = ",round(quantile(dist,0.75),3),sep="")
        HTML(paste(str0,str1, str2, sep = '<br/>'))
    })
    # Generate a summary of the data
    output$summary <- renderPrint({
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        summary(dist)
    })
    # Generate an HTML table view of the data
    output$table <- renderTable({
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        data.frame(x=dist)
    })
    output$distPlot3 <- renderPlot({
        # generate an rnorm distribution and plot it
        set.seed(10)
        dist <- rnorm(input$obs,input$mean,input$sd)
        x <- seq(-4,4,by = 0.01)
        y <- dnorm(x,mean=0,sd=1) 
        plot(x, y, type = "l",col="black", lwd=2,ylab = "Pr(X=x)")
        abline(v=input$score,col="red")
    })
    lower <- reactive({
        switch(input$lo,
               "lower" = T,
               "upper" = F)
    })
    output$pvalue <- renderPrint({
        pnorm(input$score,0,1, lower.tail = lower())
    })
})