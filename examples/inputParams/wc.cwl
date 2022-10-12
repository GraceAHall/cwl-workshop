cwlVersion: v1.2
class: CommandLineTool

baseCommand: wc
stdout: wc.txt

inputs:
  infile:
    type: File
    inputBinding:
      position: 1

outputs:
  count: 
    type: stdout 