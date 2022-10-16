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
  read_qc:
    type: File
    outputSource:
      - cutadapt/report
  
  alignments:
    type: File
    outputSource:
      - bwa_mem/sam
 
  variants:
    type: File
    outputSource:
      - freebayes/variants
 
steps:
  cutadapt:
    run: tools/cutadapt.cwl
    in:
      reads: raw_reads
    out: [trimmed_reads, report]

  bwa_mem:
    run: tools/bwa_mem.cwl
    in:
      reads: cutadapt/trimmed_reads
      reference: reference
    out: [sam]

  samtools_sort:
    run: tools/samtools_sort.cwl
    in:
      alignments: bwa_mem/sam
    out: [sorted_bam]

  freebayes:
    run: tools/freebayes.cwl
    in:
      bam: samtools_sort/sorted_bam
      reference: reference
    out: [variants] 
