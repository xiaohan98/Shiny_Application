#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

METRIC   = 1;
IMPERIAL = 2;

bmi <- function(weight, height, units) {
  bmi = weight / height^2
  
  if (units == IMPERIAL) {
    bmi = bmi * 703
  }
  
  return (bmi)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$input <- renderText({
    if (input$units == METRIC) {
      paste0("You are ", "<strong>",input$weight, " kg @ ", input$height, " m</strong>")
    } else {
      paste0("You are ", "<strong>",input$weight, " lb @ ", input$height, " in</strong>")
    }
    
    
  })
  
  output$result <- renderText({
    bmi = bmi(weight = input$weight, height = input$height, units = input$units)
    
    if      (bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>"
    else if (bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
    else if (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
    else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else if (bmi <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
    else if (bmi <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>"
    else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
    
    paste0("Your BMI is ", "<code>", round(bmi, 2), "</code>", ", which is: ", info)
  })
  
})