
for gene in {1..5};do
sed -n '/MOTIF/p' out${gene}/streme.txt > out${gene}/b.txt
cat out${gene}/b.txt |awk -F ' ' '{print $2}'>out${gene}/name.txt
awk '/MOTIF/{print NR}' out${gene}/streme.txt>out${gene}/h.txt
awk '/letter-probability/{print NR}' out${gene}/streme.txt>out${gene}/t.txt
done


for (n in 2:5){
h<-read.delim(paste0("motif/out",n,"/h.txt"),header = F)
t<-read.delim(paste0("motif/out",n,"/t.txt"),header = F)
name<-read.delim(paste0("motif/out",n,"/name.txt"),header = F)
all_inf<-cbind(h,t,name)
all_inf<-t(all_inf)
all_inf<-as.data.frame(all_inf)
for(i in all_inf){
i<-as.data.frame(i)
  he<-i[1,]
  ta<-i[2,]
  name<-i[3,]
  system(paste0("sed -n '",he,",", ta,"p' motif/out",n,"/streme.txt>motif/out",n,"/",name,".meme"))
}}

for gene in {2..5};do
cd out${gene}
find . -type f -name "*.meme" > meme.name
cd ..
done



samplelist=~/TASK/intact_data/motif/out5/meme.name
for sample in `cat $samplelist`;do
cd ~/TASK/intact_data/motif/out5
sed '1,2d' ${sample} > ${sample}.da
head -n -2 ${sample}.da> ${sample}.data
rm ${sample}.da
cd ..
done

for gene in {2..5};do
cd out${gene}
sed '/MOTIF/G' streme.txt>streme.da
mv streme.da streme.txt
cd ..


#####
samplelist=~/TASK/intact_data/motif/out3/meme.name
for sample in `cat $samplelist`;do
cd ~/TASK/intact_data/motif/out3
sed '/MOTIF/G' ${sample}>${sample}.da
head -n -4 ${sample}.da> ${sample}.dd
mv ${sample}.dd ${sample}
cd ..
done
