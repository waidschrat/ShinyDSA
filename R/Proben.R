
Wuerfel <- function(n, augen=20) sample(1:augen, n, replace=T)

Probe <- function(Talent, Modifikator=0){
  wurf <- Wuerfel(n = 3, augen = 20)
  attribs <- unlist(strsplit(Skill$Probe[which(names(Skill$Talent) == Talent)], "_"))
  result <- (Attrib[attribs] + Modifikator) - wurf
  result <- ifelse(result < 0, result, 0)
  pool <- Skill$Talent[which(names(Skill$Talent) == Talent)]
  
  if(sum(which(result < 0)) > 0){
    for(i in which(result < 0)) pool <- pool + result[i]
  }
  return(c(result, "Quali"=as.integer(pool)))
}
