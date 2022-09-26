cwlVersion: v1.2
class: CommandLineTool

baseCommand: wc

inputs:
  input_file:
    type: File
    inputBinding:
      position: 1

arguments: ["-c"]

outputs: []