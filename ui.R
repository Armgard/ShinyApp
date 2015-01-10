library(shiny)

shinyUI(pageWithSidebar(
        headerPanel(h2("Ozone Predictor")),
        sidebarPanel(
                sliderInput('temp', 'Please select an estimated temperaure',
                            value = 75, min = 55, max = 100, 
                            step = 1)
        ),
        mainPanel(
                tabsetPanel(
                tabPanel(h4('Plot'),plotOutput('scatterplot'),
                  dataTableOutput('tab')),
                tabPanel(h4('Documentation'),
                         h6('This application is a predictor of ozone concentration
                             for a given temperature. This predictor is based on the 
                            air quality data set from the R package'),
                         h6('To obtain a prediction a temperature level must be selected first using 
                            the slider bar located on the lef hand sidet. The scatter plot located in the main panel is showing the data 
                            from the air quality data set and also the regression line based on those data.'),
                         h6('The red line will move along the X axis depending on the temperature selected and the label at the top will
                            indicate the temperature chosen and the predicted value of ozone concentration calculated according to the estimated regression model'),
                         h6('Finally a table can be found under the scatter plot. Ths table contains the data from the air quality dataset. The user can sort this table 
                            by column, and also filter by entering values in the text boxes at the bottom of the table'))
        )
)
)
)


