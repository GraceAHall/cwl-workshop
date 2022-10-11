class: CommandLineTool
cwlVersion: v1.2

baseCommand: [bwa, mem]
stdout: output.bam

inputs:
  reads:
    type: File
    inputBinding:
      position: 2

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