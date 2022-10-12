class: Workflow
cwlVersion: v1.2

inputs:
  raw_reads: File
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
      - freebayes/variants
 
steps:
  cutadapt:
    run: tools/cutadapt.cwl
    in:
      reads: raw_reads
    out: [trimmed_reads]

  bwa_mem:
    run: tools/bwa_mem.cwl
    in:
      reads: cutadapt/trimmed_reads
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
    out: [variants] 
