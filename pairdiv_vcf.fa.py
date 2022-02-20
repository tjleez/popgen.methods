from itertools import combinations
from Bio import SeqIO
import sys

fasta_file = sys.argv[1] #xyz.vcf.fa
output_file = sys.argv[2] #xyz.pairdiv.txt
#start = int(sys.argv[3])
#step = int(sys.argv[4])

with open(isolate_list, 'r') as fh:
	isolates = fh.readlines()
fh.close()

indexed = SeqIO.index(fasta_file,'fasta')

strains = []
for k in indexed.keys():
	strains.append(k)

pairs = list(combinations(strains,2))

match = ['AA','GG','TT','CC']
het_match = ['RR','YY','SS','WW','MM','KK']
mismatch = ['AT','AC','AG','TC','TG','CG','TA','CA','GA','CT','GT','GC']
#drop = ['NN','NA','NC','NG','NT','AN','CN','GN','TN','NR','NY','NS','NW','NM','NK','RN','YN','SN','WN','MN','KN']
drop = ['--','-A','-C','-G','-T','A-','C-','G-','T-','-R','-Y','-S','-W','-M','-K','R-','Y-','S-','W-','M-','K-']

for pair in pairs:
	
	seq1 = indexed[pair[0]].seq
	seq2 = indexed[pair[1]].seq
	
	n_drop = 0
	n_match = 0
	n_mismatch = 0
	n_hetMatch = 0
	n_hetMismatch = 0
	for i in range(len(seq1)):
		if seq1[i] + seq2[i] in match :
			n_match += 1
		elif seq1[i] + seq2[i] in mismatch:
			n_mismatch += 1
		elif seq1[i] + seq2[i] in drop:
			n_drop += 1
		elif seq1[i] + seq2[i] in het_match:
			n_hetMatch += 1
		else:
			n_hetMismatch += 1
	with open(output_file, 'a') as fh:
		fh.write('%s %s %d %d %d %d %d\n' % (pair[0] ,pair[1] ,n_match ,n_mismatch ,n_drop, n_hetMatch, n_hetMismatch))
fh.close()
###
