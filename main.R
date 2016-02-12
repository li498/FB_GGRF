
setwd('./FB_GGRF/example');
source('./function.r')
library(CompQuadForm)

######################################################################################################################
##### Load data      					    ###########################################################
##### G_Mom.txt, G_Dad.txt, G_Baby.txt: genotype matrix     ###########################################################
##### phe.txt: pyenotype data following normal, binomial and poisson distributions; cov: a covariate variable #########
#######################################################################################################################

Mom <-as.matrix(read.table('./G_Mom.txt'))
Dad <-as.matrix(read.table('./G_Dad.txt'))
Baby<-as.matrix(read.table('./G_Baby.txt'))
phe<-read.table('./phe.txt',header=T);

################
###Apply FB_GGRF
#################

FB_GGRF(Y=phe$y.gs,Mom=Mom,Dad=Dad,Baby=Baby,X=phe$cov,kernel='GR',weights=1,type='normal')$pvalue

FB_GGRF(Y=phe$y.bn,Mom=Mom,Dad=Dad,Baby=Baby,X=phe$cov,kernel='GR',weights=1,type='binary')$pvalue

FB_GGRF(Y=phe$y.ps,Mom=Mom,Dad=Dad,Baby=Baby,X=phe$cov,kernel='GR',weights=1,type='poisson')$pvalue
