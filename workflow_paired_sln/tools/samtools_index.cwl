class: CommandLineTool
cwlVersion: v1.2
requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.bam)

baseCommand: [samtools, index]

inputs:
  bam:
    type: File
    inputBinding:
      position: 0
    label: Input bam file

outputs:
  sorted_indexed_bam:
    doc: The index file
    type: File
    secondaryFiles:
      - .bai
    outputBinding:
      glob: $(inputs.bam.basename)