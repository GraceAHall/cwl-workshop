cwlVersion: v1.2
class: CommandLineTool

baseCommand: echo
stdout: phrase.txt

inputs:
  message:
    type: string
    inputBinding:
      position: 1

outputs:
  phrase:
    type: stdout