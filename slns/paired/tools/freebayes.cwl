class: CommandLineTool
cwlVersion: v1.2

baseCommand: freebayes
stdout: output.vcf

inputs:
  bambai:
    type: File
    inputBinding:
      position: 2
  
  ref:
    type: File
    inputBinding:
      position: 1
      prefix: '--fasta-reference'

outputs:
  variants:
    type: stdout
