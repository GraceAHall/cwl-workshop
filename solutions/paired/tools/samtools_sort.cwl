class: CommandLineTool
cwlVersion: v1.2

baseCommand: [samtools, sort]
stdout: aln.bam

inputs:
  alignments:
    type: File
    inputBinding:
      position: 1

outputs:
  sorted_bam:
    type: stdout

