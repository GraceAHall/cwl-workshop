cwlVersion: v1.2
class: CommandLineTool

baseCommand: wc

inputs:
  infile:
    type: File
    inputBinding:
      position: 1

arguments: ["-c"]

outputs:
  count: 
    type: stdout 