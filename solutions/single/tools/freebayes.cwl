class: CommandLineTool
cwlVersion: v1.2

baseCommand: freebayes
stdout: variants.vcf

inputs:
  bam:
    type: File
    inputBinding:
      position: 2
  
  reference:
    type: File
    inputBinding:
      position: 1
      prefix: '--fasta-reference'
  

outputs:
  variants:
    type: stdout
