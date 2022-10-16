class: Workflow
cwlVersion: v1.2

inputs:
  fwd_reads: File
  rev_reads: File
  reference:
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac 
      - .sa

outputs: 
  read_qc:
    type: File
    outputSource:
      - cutadapt/report
  
  aln:
    type: File
    outputSource:
      - bwa_mem/sam
  
#   sorted_indexed_aln:
#     type: File
#     outputSource:
#       - samtools_index/sorted_indexed_bam
  
  variants:
    type: File
    outputSource:
      - freebayes/variants
 
steps:
  cutadapt:
    run: tools/cutadapt_paired.cwl
    in:
      read1: fwd_reads
      read2: rev_reads
    out: [read1_trimmed, read2_trimmed, report]

  bwa_mem:
    run: tools/bwa_mem_paired.cwl
    in:
      read1: cutadapt/read1_trimmed
      read2: cutadapt/read2_trimmed
      reference: reference
    out: [sam]

  samtools_sort:
    run: tools/samtools_sort.cwl
    in:
      sam: bwa_mem/sam
    out: [sorted_bam]

#   samtools_index:
#     run: tools/samtools_index.cwl
#     in:
#       bam: samtools_sort/sorted_bam
#     out: [sorted_indexed_bam]

  freebayes:
    run: tools/freebayes.cwl
    in:
      bambai: samtools_sort/sorted_bam
      ref: reference
    out: [variants] 
