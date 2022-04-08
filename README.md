# popgen.methods
This page contains scripts and OTU table used in **Extensive sampling of _Saccharomyces cerevisiae_ in Taiwan reveals ecology and evolution of pre-domesticated lineages**


## List of scripts in the directory:

### Read quality summary
fastqc.sh

### Reads trimming
trimmomatic_TruSeq3_2.v2

### Read mapping, sort, mark duplicates
bwa.sh
samtools.depth

### BCFtools mpileup
mpileup.sh

### BCFtools caller
bcfcall.sh

### FreeBayes variant calling
submit_freebayes_batch.sh

### variant filtering
variant_filter.sh
 
### get intersection of variant site from both caller
bcftools isec -p vcf_intersect v10.1.vcf.gz v13.3.vcf.gz

### phylogeny
iqtree_create_phylip_NARL.sh
iqtree_MFP_NARL.sh
iqtree_ASC_NARL.sh

### Admixture
admix0.sh
admix1.sh

### TreeMix
treemix.k29.sh

### consensus sequence fasta per isolate
bcfconsensus.sh #print ambiguous code
bcfconsensus.v3.sh #print first allele

### print multiple sequence fasta from vcf
```
python vcf2fa.py input.vcf
```
creates *input.vcf.fa*

### tabulate results from [VariScan](http://www.ub.edu/softevol/variscan/) output
variscan.run2.sh
vs.output.sh

### count pairwise differences between isolates from input.vcf.fa
```
python pairdiv_vcf.fa.py input.vcf.fa output.txt
```

### cout pairwise differences between isolates from a list of fasta files
```
python pairdiv_fa.list.py fa.list output.txt
```

### retrieve CDS sequence from full length fasta using [BEDTools](https://github.com/arq5x/bedtools2).
```
sh getCDS.sh prefix.list
```
creates prefix.CDS.fa

### create multiple sequence fasta of each gene, for isolates within a lineage with [Seqtk](https://github.com/lh3/seqtk/)
```
sh merge.CDS.sh gene.list prefix.list outDir
```

### translate.from.bed.py
translate from CDS, providing BED file
```
python translate.from.bed.py CDS.fa input.bed output.fa
```

### dN/dS
pal2nal.sh
run.codeml.sh
parse.out.sh

### rho estimate
subset.vcf.sh
rhomap.sh
get.mean.rho.sh

### MK test
popgenome.R

### zOTU table
Zero-radius operational taxonomic unit (zOTUs) table analysed in this paper. Reads are available from NCBI at BioProject PRJNA755173
