class: CommandLineTool
cwlVersion: v1.2

baseCommand: [bwa, mem]
stdout: output.bam

inputs:
  read1:
    type: File
    inputBinding:
      position: 2
  
  read2:
    type: File
    inputBinding:
      position: 3

  ref:
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    inputBinding:
      position: 1

outputs:
  bam:
    type: stdout