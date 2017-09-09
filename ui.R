#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Body Mass Index Calculator"),
  
  sidebarLayout(sidebarPanel(
    
    helpText("This is a body mass index (BMI) calculator, your input is weight and height 
            with selected units (kg & m, or lb & in). 
             The system will calculate BMI."),
    
    radioButtons(
      inputId  = "units",
      label    = "Units:",
      choices  = c("Metric (kg & m)" = 1, "Imperial (lb & in)" = 2),
      selected = 1
    ),
    
    numericInput(
      inputId = "weight",
      label = strong("Your weight:"),
      value = 70
    ),
    
    numericInput(
      inputId = "height",
      label = strong("Your height:"),
      value = 1.80,
      step  = 0.10
    )
    ),
    
    mainPanel(
      uiOutput("input"),
      uiOutput("result")
    ))
))