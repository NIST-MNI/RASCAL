library(tidyverse)
library(jsonlite)
library(grid)

theme_set(theme_bw(base_size = 14, base_family = "Arial"))

inp=c(
   "cv_t1/loo_stats.json",
   "cv_t1_den/loo_stats.json"
   )

ka_  <- vector(mode = "list", length = length(inp))
gka_ <- vector(mode = "list", length = length(inp))

for(i in seq(length(inp))) {
    print(inp[i])
    
    cv<-fromJSON(inp[i])
    method<-str_extract(inp[i],"[^/]+")
    
    ka_[[i]]<-stack(cv$ka)
    names(ka_[[i]])<-c('Kappa','Structure')
    ka_[[i]]$Method<-method

    # generalize kappa
    gka_[[i]]<-data.frame(gkappa=cv$gkappa)
    gka_[[i]]$Method<-method
}


ka<-bind_rows(ka_)
gka<-bind_rows(gka_)

ka<-ka %>% mutate(Structure=as.factor(Structure),Method=as.factor(Method))
gka<-gka %>% mutate(Method=as.factor(Method))


med <- ka %>% group_by(Method,Structure) %>% 
              summarize(med=median(Kappa)) %>% 
              mutate(med_t=sprintf("%0.3f",med))
              
gmed <- ka %>% group_by(Method) %>% 
              summarize(med=median(Kappa)) %>% 
              mutate(med_t=sprintf("%0.3f",med))

print("Median kappa per structure")
print(gmed)

 
png('cv_structure_kappa.png',width=1600,height=1000)#,type='cairo'

ggplot(data=ka,aes(x=Structure,y=Kappa))+
 geom_boxplot(notch=T)+coord_flip()+
 theme_bw()+
 geom_hline(data=gmed,aes(yintercept=med),col='red')+
 facet_grid(~Method)+
 theme(
   axis.text = element_text(face = 'bold',  vjust = 0.2, size = 20),
   strip.text = element_text(face = 'bold', vjust = 0.2, size = 25),
   axis.title = element_text(face = 'bold', vjust = 0.2, size = 30),
   plot.margin = unit(c(0.2,2.8,0.2,0.2), "cm")
   )+
 geom_text(data=med,aes(x=Structure,y=med,label=med_t), 
      vjust = 0, nudge_y = 0.01, fontface = "bold",angle = 270,size=7)


png('cv_gkappa.png',width=800,height=800)#,type='cairo'

ggplot(data=gka,aes(x=Method,y=gkappa))+
 geom_boxplot(notch=T)+
 theme_bw()+
 theme(
   axis.text = element_text(face = 'bold',  vjust = 0.2, size = 20),
   strip.text = element_text(face = 'bold', vjust = 0.2, size = 25),
   axis.title = element_text(face = 'bold', vjust = 0.2, size = 30),
   plot.margin = unit(c(0.2,2.8,0.2,0.2), "cm")
   )

