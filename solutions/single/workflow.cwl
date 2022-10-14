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
  read_qc_report:
    type: File
    outputSource:
      - cutadapt/report
  
  aln:
    type: File
    outputSource:
      - bwa_mem/sam
  
  sorted_indexed_aln:
    type: File
    outputSource:
      - samtools_index/sorted_indexed_bam
  
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
      ref: reference
    out: [sam]

  samtools_sort:
    run: tools/samtools_sort.cwl
    in:
      sam: bwa_mem/sam
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