import sys
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from Bio.Seq import Seq
import pybedtools
from pybedtools import BedTool
from tqdm import tqdm

infile=sys.argv[1] #CDS.fa
bedfile=sys.argv[2] #bed file
outfile=sys.argv[3] #amino acid seq fa

def make_protein_record(input_nuc_fasta,input_bed_file):
	ann = BedTool(input_bed_file)
	rec = SeqIO.index(input_nuc_fasta,'fasta')

	plus = [gene.name for gene in ann if gene.strand == '+']
	minus = [gene.name for gene in ann if gene.strand == '-']	

	prot_rec = []
	for geneID in tqdm(plus):
		prot_rec.append(rec[geneID].translate(id=rec[geneID].id,name=rec[geneID].name,description=""))
	for geneID in tqdm(minus):
		prot_rec.append(rec[geneID].reverse_complement().translate(id=rec[geneID].id,name=rec[geneID].name,description=""))
	
	return(prot_rec)

protein = make_protein_record(infile,bedfile)

SeqIO.write(protein, outfile,'fasta')

