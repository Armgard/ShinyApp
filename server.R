library(shiny)
data(airquality)
dataMain <- data.frame(na.omit(airquality))
dataMain <- dataMain[,c('Ozone','Temp')]
reg <- lm(Ozone ~ Temp,dataMain)          

shinyServer(function(input, output) {
               
        
                output$scatterplot <- renderPlot({
               
                                
                plot(x=dataMain$Temp,y=dataMain$Ozone,pch = 16, cex = .9, 
                     col='blue', xlab='Temperature',ylab = 'Ozone level')
                
                                
                abline(reg, col='orange')
                temp <- input$temp
                if (temp <=88) {vPos <- temp + 6} 
                else {vPos <- temp - 6}
                pred <- predict(reg,newdata = data.frame(Temp=temp))
                lines(c(temp, temp), c(-10, 200),col="red",lwd=2)
                text(vPos, 150, paste("Temperature = ", temp))
                text(vPos, 140, paste("Predicted Ozone level = ", round(pred, 2)))
            
              })
              output$tab = renderDataTable({
                      input$submit
                      #dataMain <-rbind(dataMain,data.frame(Ozone=x,Temp=y))
                      dataMain
              })

            }
  
  
  )