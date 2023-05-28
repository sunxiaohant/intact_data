library(universalmotif)
library(MotifDb)
library(ggtree)
library(ggplot2)

########


#######
for(i in 2:5){
  my_motif<-read_meme("~/TASK/intact_data/motif/com/HSF/streme.txt")
  known_motif<-read_meme("~/TASK/intact_data/motif/PLANT_all/P_motifs_all")
  all_motifs<-c(my_motif,known_motif)
  comparisons <- compare_motifs(all_motifs, method ="MPCC")
  write.table(comparisons,paste0("~/TASK/intact_data/motif/com/HSF/94_com.txt"),sep = '\t',quote = F)
}
######  
  comparisons<-read.delim("~/TASK/intact_data/motif/com/tf2com.txt")
  comparisons[comparisons ==1]=0
  comparisons<-as.data.frame(comparisons)
  filter_1<-filter_all(comparisons,any_vars(.>0.8))
#} 
#for(i in 2:5){
  
#}  

my<-rownames(filter_1)
my<-as.data.frame(my)
my<-my%>%filter(grepl('-',my))
comparisons_1<-filter_1[1:nrow(my),]
comparisons2_1<-as.data.frame(t(comparisons_1))
filter_2<-filter_all(comparisons2_1,any_vars(.>0.8))

#######
  for(b in seq_along(filter_2)){
f_1<-subset(filter_2,filter_2[[b]]>0.9) 
f_2<-f_1[order(f_1[[b]],decreasing=T),]
write.table(f_2,paste0(b,".txt"),quote=F)
#filter_2<-filter_all(comparisons2_1,any_vars(.>0.9))
names_col<-colnames(f_2)
names_col<-as.data.frame(names_col)
names_col<-names_col[b,]
names_col<-as.data.frame(names_col)
colnames(names_col)[1] <- "V1"
names_row<-rownames(f_2)
names_row<-as.data.frame(names_row)
colnames(names_row)[1] <- "V1"
names<-full_join(names_col,names_row,by="V1")
names<-t(names)
if(ncol(names)>3){
for (d in seq_along(names)){
    if(d<7){
  x<-names[,d]
  x<-as.character(x)
  AN<-read.table("motif/AN_motif_MP.txt",header = F)
if(!grepl("-",x)&(AN%in%x)) {
  system(paste0("sed -n '/",x,"/p' ~/genomeData/TF_binding_motifs_information.txt > fam.txt"))
  fam<-read.delim("fam.txt",header = F)
  g<-fam$V1
  f<-fam$V2
  }
  system(paste0('sed -n "$(grep -n ',x,' motif/all_motifs.txt | cut -d : -f 1),+2p" motif/all_motifs.txt >num.txt'))
  system("sed -n '3p' num.txt>ber.txt")
  system("cat ber.txt |awk -F ' ' '{print $7,$8}'>no.txt")
  num<-read.delim("no.txt",header = F)
  num<-num$V1
  #MA1260<-read.table("./motif/logo/MA260.1")
  
  MA1260<-read.table(paste0("./motif/PLANT_in/",x,".meme.data"))
  
  MA12<-t(MA1260)
  MA12<-MA12*1000000
  rownames(MA12)<-c("A","C","G","T")
  p1<-ggseqlogo(MA12,method="bits")+theme_bw()+ggtitle(paste0(x," ",num))
if(!grepl("-",x))  
  {p1<-p1+annotate("text",x=0,y=2,label=paste(g),size=5,vjust='inward',hjust='inward')
  p1<-p1+annotate("text",x=0,y=1.8,label=paste(f),size=5,vjust='inward',hjust='inward')}
  p1
  ggsave(paste0("./motif/logo/5/",b,x,".png"),width =15,height = 5,units = "in")
  } }
}}

