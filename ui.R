shinyUI(pageWithSidebar(
    headerPanel("Random Generator for Normal Distribution on Shiny"),
    sidebarPanel(width = 4,  
                 h5("Part1"),
                 sliderInput("obs", 
                             "Number of observations:", 
                             min = 2,
                             max = 10000, 
                             value = 5000) , 
                 sliderInput("mean", "Mean:", min = 0, max = 100, value = 10, step= 0.1),
                 sliderInput("sd", "Standard Deviation:",min = 0.001, max = 20, value = 1, step= 0.001),
                 h5("Part2"),
                 sliderInput("score", 
                             "(Probability Calc)
                    Estimate the probability under the curve in a standard normal distribution:", 
                             min = -4,
                             max = 4, 
                             value = 0,
                             step = 0.0001),
                 selectInput("lo",
                             " ", 
                             choices = c("lower P[X ≤ x]"="lower", "upper P[X > x]"="upper"),
                             selected = "lower"
                 )
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Documentation", includeHTML("Docu.html")), 
            tabPanel("Histogram", plotOutput("distPlot")), 
            tabPanel("Plot Density",h4("The Shape of The Distribution"),plotOutput("distPlot2"),paste("the shape of the distribution of the data can be described with the following form estimators where Quantiles are points taken at regular intervals from the cumulative distribution function (CDF) of a random variable."),htmlOutput("pilotStudyNotice")), 
            tabPanel("Summary and Observations",
                     h4("Summary"),
                     verbatimTextOutput("summary"),
                     h4("Observations"),
                     tableOutput("table")
            ),
            tabPanel("Probability Calc (Part2)",  plotOutput("distPlot3"),
                     h3("Probability associated is : "),
                     verbatimTextOutput("pvalue")
            )
            
        )
        
    )
)
)