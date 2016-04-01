library(shiny)

shinyServer(function(input, output) {
  output$table <- DT::renderDataTable(as.data.frame(diamonds))
  
  ideal_data <- reactive({
    temp <- filter(diamonds, cut == "Ideal")
    return(filter(temp, clarity == input$clarity1))
  })
  
  premium_data <- reactive({
    temp <- filter(diamonds, cut == "Premium")
    return(filter(temp, clarity == input$clarity2))
  })
  
  good_data <- reactive({
    temp <- filter(diamonds, cut == "Good")
    return(filter(temp, clarity == input$clarity3))
  })
  
  vgood_data <- reactive({
    temp <- filter(diamonds, cut == "Very Good")
    return(filter(temp, clarity == input$clarity4))
  })
  
  fair_data <- reactive({
    temp <- filter(diamonds, cut == "Fair")
    return(filter(temp, clarity == input$clarity5))
  })
  
  # ---------------  Plot outputs
  output$ideal <- renderPlot({
    qplot(ideal_data()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  output$premium <- renderPlot({
    qplot(premium_data()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  output$good <- renderPlot({
    qplot(good_data()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  output$vgood <- renderPlot({
    qplot(vgood_data()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  output$fair <- renderPlot({
    qplot(fair_data()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  # ---------------- Summary outputs
  
  output$summ_ideal <- renderPrint({
    summary(ideal_data())
  })
  
  output$summ_premium <- renderPrint({
    summary(premium_data())
  })
  
  output$summ_good <- renderPrint({
    summary(good_data())
  })
  
  output$summ_vgood <- renderPrint({
    summary(vgood_data())
  })
  
  output$summ_fair <- renderPrint({
    summary(fair_data())
  })
  
  # ---------------- Correlation outputs
  output$cor_ideal <- renderPrint({
    cor(ideal_data()[,sapply(ideal_data(), is.numeric)])
  })
  
  output$cor_premium <- renderPrint({
    cor(premium_data()[,sapply(premium_data(), is.numeric)])
  })
  
  output$cor_good <- renderPrint({
    cor(good_data()[,sapply(good_data(), is.numeric)])
  })
  
  output$cor_vgood <- renderPrint({
    cor(vgood_data()[,sapply(vgood_data(), is.numeric)])
  })
  
  output$cor_fair <- renderPrint({
    cor(fair_data()[,sapply(fair_data(), is.numeric)])
  })
})
