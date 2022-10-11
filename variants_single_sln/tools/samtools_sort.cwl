class: CommandLineTool
cwlVersion: v1.2

baseCommand: [samtools, sort]
stdout: sorted.bam

inputs:
  bam:
    type: File
    inputBinding:
      position: 1

outputs:
  sorted_bam:
    type: stdout

