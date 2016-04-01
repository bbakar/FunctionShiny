library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  titlePanel("Price distributions"),
  tabsetPanel(id = "clarity", 
              tabPanel("Data", 
                       dataTableOutput("table")
                       ),
              tabPanel("Ideal Cut", 
                       radioButtons("clarity1", "Select Clarity:", choices = c(claritySelect), selected = NULL, inline = TRUE),
                       plotOutput("ideal"),
                       h4("Summary"),
                       verbatimTextOutput("summ_ideal"),
                       h4("Correlations"),
                       verbatimTextOutput("cor_ideal")
                       ),
              tabPanel("Premium Cut", 
                       radioButtons("clarity2", "Select Clarity:", choices = c(claritySelect), selected = NULL, inline = TRUE),
                       plotOutput("premium"),
                       h4("Summary"),
                       verbatimTextOutput("summ_premium"),
                       h4("Correlations"),
                       verbatimTextOutput("cor_premium")
                       ),
              tabPanel("Good Cut", 
                       radioButtons("clarity3", "Select Clarity:", choices = c(claritySelect), selected = NULL, inline = TRUE),
                       plotOutput("good"),
                       h4("Summary"),
                       verbatimTextOutput("summ_good"),
                       h4("Correlations"),
                       verbatimTextOutput("cor_good")
                       ),
              tabPanel("Very Good Cut", 
                       radioButtons("clarity4", "Select Clarity:", choices = c(claritySelect), selected = NULL, inline = TRUE),
                       plotOutput("vgood"),
                       h4("Summary"),
                       verbatimTextOutput("summ_vgood"),
                       h4("Correlations"),
                       verbatimTextOutput("cor_vgood")
                       ),
              tabPanel("Fair Cut", 
                       radioButtons("clarity5", "Select Clarity:", choices = c(claritySelect), selected = NULL, inline = TRUE),
                       plotOutput("fair"),
                       h4("Summary"),
                       verbatimTextOutput("summ_fair"),
                       h4("Correlations"),
                       verbatimTextOutput("cor_fair")
                       )
              )
))
