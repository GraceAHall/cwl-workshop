class: Workflow
cwlVersion: v1.2

inputs:
#   read_qual_cutoff: int
#   read_min_length: int
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
  sorted_bam:
    type: File
    outputSource:
      - samtools_index/sorted_indexed_bam
  
  variants:
    type: File
    outputSource:
      - freebayes/vcf
 
steps:
  cutadapt:
    run: tools/cutadapt.cwl
    in:
      reads: raw_reads
    #   quality_cutoff: read_qual_cutoff
    #   minimum_length: read_min_length
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
    out: [vcf] 
