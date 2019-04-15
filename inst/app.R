
Attrib <- c("MU"=13, "KL"=12, "IN"=12, "CH"=11, "FF"=15, "GE"=12, "KO"=14, "KK"=13)
Skill <- list(
  "Talent" = c(
    "Fliegen"=0, "Gaukeleien"=5, "Klettern"=0, "Kbeherschung"=4, "Kraftakt"=4, "Reiten"=0, "Schwimmen"=2, "Sbeherschung"=6, "Singen"=0, "Sinne"=6, "Tanzen"=0, "Diebstahl"=0, "Verbergen"=2, "Zechen"=3,
    "Bekehren"=0, "Betoeren"=0, "Einschuechtern"=1, "Etikette"=4, "Gassenwissen"=3, "Menschenkenntnis"=5, "Ueberreden"=9, "Verkleiden"=0, "Willenskraft"=0,
    "Faehrtensuchen"=0, "Fesseln"=5, "Fischen"=5, "Orientierung"=4, "Pflanzenkunde"=6, "Tierkunde"=6, "Wildnisleben"=3,
    "Brettspiel"=0, "Geografie"=3, "Geschichte"=0, "Goetter"=4, "Kriegskunst"=0, "Magiekunde"=0, "Mechanik"=2, "Rechnen"=5, "Rechtskunde"=3, "Sagen"=3, "Sphaerenkunde"=0, "Sternkunde"=0,
    "Alchimie"=2, "Boote"=2, "Fahrzeuge"=7, "Handel"=2, "Heilen_Gift"=3, "Heilen_Krankheit"=3, "Heilen_Seele"=2, "Heilen_Wunde"=8, "Holzbearb"=2, "Kochen"=5, "Lederbearb"=2, "Malen"=5, "Metallbearb"=2, "Musik"=2, "Schloesser"=4, "Steinbearb"=3, "Stoffbearb"=3
  ),
  "Probe"= c("MU_IN_GE", "MU_CH_FF", "MU_GE_KK", "GE_GE_KO", "KO_KK_KK", "CH_GE_KK", "GE_KO_KK", "MU_MU_KO", "KL_CH_KO", "KL_IN_IN", "KL_CH_GE", "MU_FF_GE", "MU_IN_GE", "KL_KO_KK",
             "MU_KL_CH", "MU_CH_CH", "MU_IN_CH", "KL_IN_CH", "KL_IN_CH", "KL_IN_CH", "MU_IN_CH", "IN_CH_GE", "MU_IN_CH",
             "MU_IN_GE", "KL_FF_KK", "FF_GE_KO", "KL_IN_IN", "KL_FF_KO", "MU_MU_CH", "MU_GE_KO",
             "KL_KL_IN", "KL_KL_IN", "KL_KL_IN", "KL_KL_IN", "MU_KL_IN", "KL_KL_IN", "KL_KL_FF", "KL_KL_IN", "KL_KL_IN", "KL_KL_IN", "KL_KL_IN", "KL_KL_IN",
             "MU_KL_FF", "FF_GE_KK", "CH_FF_KO", "KL_IN_CH", "MU_KL_IN", "MU_IN_KO", "IN_CH_KO", "KL_FF_FF", "FF_GE_KK", "IN_FF_FF", "FF_GE_KO", "IN_FF_FF", "FF_KO_KK", "CH_FF_KO", "IN_FF_FF", "FF_FF_KK", "KL_FF_FF"
  )
)

library(shinydashboard)
source("./R/Proben.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("ShinyDSA: Charakter Organisator"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(width = 3,
        radioButtons("talents", "Talente", choices = Skill[["Talent"]])
      ),
      
      # Show a plot of the generated distribution
      mainPanel(width = 6,
         verbatimTextOutput("history")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output, clientData, session) {
   #output$stats <- renderText({Attrib})
  
   # output$distPlot <- renderPlot({
   #    # generate bins based on input$bins from ui.R
   #    x    <- faithful[, 2] 
   #    bins <- seq(min(x), max(x), length.out = input$bins + 1)
   #    
   #    # draw the histogram with the specified number of bins
   #    hist(x, breaks = bins, col = 'darkgray', border = 'white')
   # })
   output$history <- renderText({
     input$talents
     #Probe(input$talents, Modifikator = 0)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


