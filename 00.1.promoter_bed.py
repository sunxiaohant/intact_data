#!/usr/bin/env python3
import sys
dc = {}
with open('/data/user/chenym/genomeData/IWGSC-v2.1/part/chromosome_size.txt') as f:
		for i in f:
				i = i.strip().split('\t')
				dc[i[0]] = i[1]
with open('/data3/user3/sunxh/TASK/intact_data/HSF_94.bed') as f:
		for i in f:
				i = i.strip().split('\t')
				chrom_length = int(dc[i[0]])
				#
				if i[5] == "+":
						start = int(i[1])-2000
						end = int(i[1])
				else:
						start = int(i[2])
						end = int(i[2])+2000
				#
				if start <0:
					start = 0
				if end > chrom_length:
					end = chrom_length
				print('\t'.join([i[0],str(start),str(end),i[3],i[4],i[5]]))
