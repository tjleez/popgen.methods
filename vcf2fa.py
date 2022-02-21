
import sys
import numpy as np
from collections import defaultdict

raw_vcf = sys.argv[1]

var = np.genfromtxt(raw_vcf, dtype='unicode', comments = '##', delimiter='\t')
#var.shape
colID=var[0][9:]

ref_allele = [var[x][3] for x in range(len(var))][1:]
alt_allele = [var[y][4] for y in range(len(var))][1:]
alt_allele = [nt.split(',') for nt in alt_allele]

ambi = {'AG':'R','GA':'R',
        'CT':'Y','TC':'Y',
        'AT':'W','TA':'W',
        'GC':'S','CG':'S',
        'AC':'M','CA':'M',
        'GT':'K','TG':'K'}

base = ''
call_set = []
for index, call in enumerate(var[1:]):
	tmp = []
	for allele in call[9:]:
	
		if allele == '0/0':
			base = ref_allele[index]
		elif allele == '1/1':
			base = alt_allele[index][0]
		elif allele == '0/1':
			base = ambi[ref_allele[index]+alt_allele[index][0]]
		elif allele == './.':
			base = '-'
		elif allele == '0/2':
			base = ambi[ref_allele[index]+alt_allele[index][1]]
		elif allele == '1/2':
			base = ambi[alt_allele[index][0]+alt_allele[index][1]]
		elif allele == '2/2':
			base = alt_allele[index][1]
		elif allele == '3/3':
			base = alt_allele[index][2]
		elif allele == '0/3':
			base = ambi[ref_allele[index]+alt_allele[index][2]]
		elif allele == '1/3':
			base = ambi[alt_allele[index][0]+alt_allele[index][2]]
		elif allele == '2/3':
			base = ambi[alt_allele[index][1]+alt_allele[index][2]]
		tmp.append(base)
	call_set.append(tmp)

call_set_bysample = map(list, zip(*call_set))
biallelic_snp = dict(zip(colID, call_set_bysample))

with open('%s.fa' %raw_vcf, 'a') as fh:
	for key, value in biallelic_snp.items():
		fh.write('>%s\n%s\n' % (key, ''.join(value).replace(',', '')))
fh.close()
