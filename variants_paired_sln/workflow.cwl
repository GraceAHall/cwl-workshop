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
  variants:
    type: File
    outputSource:
      - freebayes/vcf
 
steps:
  cutadapt:
    run: tools/cutadapt_paired.cwl
    in:
      read1: fwd_reads
      read2: rev_reads
    out: [read1_trimmed, read2_trimmed]

  bwa_mem:
    run: tools/bwa_mem_paired.cwl
    in:
      read1: cutadapt/read1_trimmed
      read2: cutadapt/read2_trimmed
      ref: reference
    out: [bam]

  samtools_sort:
    run: tools/samtools_sort.cwl
    in:
      bam: bwa_mem/bam
    out: [sorted_bam]

  samtools_index:
    run: tools/samtools_index.cwl
    in:
      bam: samtools_sort/sorted_bam
    out: [sorted_indexed_bam]

  freebayes:
    run: tools/freebayes.cwl
    in:
      bambai: samtools_index/sorted_indexed_bam
      ref: reference
    out: [vcf] 
