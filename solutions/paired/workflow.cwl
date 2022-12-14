class: Workflow
cwlVersion: v1.2

inputs:
  read1: File
  read2: File
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
      - freebayes/vcf
 
steps:
  cutadapt:
    run: tools/cutadapt_paired.cwl
    in:
      read1: read1
      read2: read2
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
      alignments: bwa_mem/sam
    out: [sorted_bam]

  freebayes:
    run: tools/freebayes.cwl
    in:
      bam: samtools_sort/sorted_bam
      reference: reference
    out: [vcf] 
 