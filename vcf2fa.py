"""
Created on Wed Dec 11 17:24:58 2018

@author: tracylee
"""

# usage: python vcf2fa.py xyz.vcf
# input: xyz.vcf; SNP vcf file
# output: xyz.vcf.fa
# Python3
# print on reference fa: use bcftools consensus

import sys

raw_vcf = sys.argv[1]

with open(raw_vcf, 'r') as fh:
    variant = fh.readlines()
fh.close()

variant = [lines.rstrip().split('\t') for lines in variant]

pos = [i for i, s in enumerate(variant) if '#CHROM' in s][0]
colID = (variant[pos][9:])

# check duplicate IDs
# len(ist(set(colID)))

var = variant[pos+1:]

ref_allele = [var[x][3] for x in range(len(var))]
alt_allele = [var[y][4] for y in range(len(var))]
# site_pos = [var[z][1] for z in range(len(var))]
# site_pos used for LDhat loc file
# for multiallelic sites only
alt_allele = [nt.split(',') for nt in alt_allele]

# list storing all alleles
# sites = [var[m][3:5] for m in range(len(var))]
# sites = [''.join(sites[n]).replace(',','') for n in range(len(sites))]
# sites = [list(item) for item in sites]

var = [keep[9:] for keep in var]

ambi = {'AG':'R','GA':'R',
        'CT':'Y','TC':'Y',
        'AT':'W','TA':'W',
        'GC':'S','CG':'S',
        'AC':'M','CA':'M',
        'GT':'K','TG':'K'}

base = ''
call_set = []
for index, call in enumerate(var):
	tmp = []
	for allele in call:
		if '0/0' in allele:
			base = ref_allele[index]
		elif '1/1' in allele:
			base = alt_allele[index][0]
		elif '0/1' in allele:
			base = ambi[ref_allele[index]+alt_allele[index][0]]
		elif './.' in allele:
			base = '-'
		elif '0/2' in allele:
			base = ambi[ref_allele[index]+alt_allele[index][1]]
		elif '1/2' in allele:
			base = ambi[alt_allele[index][0]+alt_allele[index][1]]
		elif '2/2' in allele:
			base = alt_allele[index][1]
		elif '3/3' in allele:
			base = alt_allele[index][2]
		elif '0/3' in allele:
			base = ambi[ref_allele[index]+alt_allele[index][2]]
		elif '1/3' in allele:
			base = ambi[alt_allele[index][0]+alt_allele[index][2]]
		elif '2/3' in allele:
			base = ambi[alt_allele[index][1]+alt_allele[index][2]]
		tmp.append(base)
	call_set.append(tmp)
	
call_set_bysample = map(list, zip(*call_set))
biallelic_snp = dict(zip(colID, call_set_bysample))

with open('%s.fa' %raw_vcf, 'a') as fh:
	for key, value in biallelic_snp.items():
		fh.write('>%s\n%s\n' % (key, ''.join(value).replace(',', '')))
fh.close()

