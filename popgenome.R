#PopGenome
library(PopGenome)
library(tidyverse)

gen<-readData("/mnt/nas1/tjl/mk.test/multifasta/",include.unknown=T,parallized=T)
get.sum.data(gen)[1:5,1:5]
save.image("/mnt/nas1/tjl/mk.test/popgenome.RData") 

gen<-set.populations(gen,list(c("ERR1308682","ERR1308746","H413","PD24A","PD25A"),"CBS432"))
gen<-MKT(gen,do.fisher.test=T)
mkA0<-as.data.frame(get.MKT(gen))%>%rownames_to_column(var="gene")%>%mutate(gene=str_replace(gene,".fa",""))
write_delim(mkA0,"/mnt/nas1/tjl/mk.test/mkA0")

mk.file.list<-list.files(pattern = "mk*",path = "/Users/tracylee/Desktop/GenomeResearch.revise/MKT/dataframe/")
mkts<-tibble()
for (i in 1:length(mk.file.list)){
    assign("tmp", #mk.file.list[i],
           read_delim(file.path("/Users/tracylee/Desktop/GenomeResearch.revise/MKT/dataframe/",mk.file.list[i]),
                      col_types = "ciiiiiiddd")%>%mutate(group=mk.file.list[i]))
    mkts<-bind_rows(mkts,tmp)}

mkts<-mkts%>%
    mutate(NITG.numer = case_when(P1_syn+D_syn>0 ~ (D_syn*P1_nonsyn)/(P1_syn+D_syn), TRUE ~ 0), #numerator
           NITG.denom = case_when(P1_syn+D_syn>0 ~ (P1_syn*D_nonsyn)/(P1_syn+D_syn), TRUE ~ 0)) #denominator
mkts_NITG<-mkts%>%group_by(groupname)%>%
    summarise(NITG=sum(NITG.numer)/sum(NITG.denom))
