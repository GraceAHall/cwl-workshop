class: CommandLineTool
cwlVersion: v1.2

baseCommand: [samtools, sort]
stdout: aln.bam

inputs:
  sam:
    type: File
    inputBinding:
      position: 1

outputs:
  sorted_bam:
    type: stdout

