# popgen.methods
This page contains scripts and OTU table used in **Extensive sampling of _Saccharomyces cerevisiae_ in Taiwan reveals ecology and evolution of pre-domesticated lineages**

## SNP matrix
### vcf2fa.py
print multiple sequence fasta from vcf
```
python vcf2fa.py input.vcf
```
creates *input.vcf.fa*
### pairdiv_vcf.fa.py
count pairwise differences between isolates from *input.vcf.fa*
```
python pairdiv_vcf.fa.py input.vcf.fa output.txt
```
### pairdiv_fa.list.py
cout pairwise differences between isolates from a list of fasta files
```
python pairdiv_fa.list.py fa.list output.txt
```
### get.CDS.sh
retrieve CDS sequence from full length fasta using [BEDTools](https://github.com/arq5x/bedtools2).
```
sh getCDS.sh prefix.list
```
creates prefix.CDS.fa
### merge.CDS.sh
create multiple sequence fasta of each gene, for isolates within a lineage with [Seqtk](https://github.com/lh3/seqtk/)
```
sh merge.CDS.sh gene.list prefix.list outDir
```
### translate.from.bed.py
translate from CDS, providing BED file
```
python translate.from.bed.py CDS.fa input.bed output.fa
```
### vs.output.sh
tabulate results from [VariScan](http://www.ub.edu/softevol/variscan/) output
```
sh vs.output.sh
```

## zOTU table
Zero-radius operational taxonomic unit (zOTUs) table analysed in this paper. Reads are available from NCBI at BioProject PRJNA755173
