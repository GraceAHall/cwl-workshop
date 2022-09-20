cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo

inputs:

  greeting:
    type: string
    inputBinding:
      position: 1
  
  name:
    type: string
    inputBinding:
      position: 2
  
  enable-backslash:
    type: boolean?
    inputBinding:
      position: 1
      prefix: -e

outputs: []