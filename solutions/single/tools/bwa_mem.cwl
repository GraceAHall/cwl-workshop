class: CommandLineTool
cwlVersion: v1.2

baseCommand: [bwa, mem]
stdout: aln.sam

inputs:
  reads:
    type: File
    inputBinding:
      position: 2

  reference:
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
  sam:
    type: stdout