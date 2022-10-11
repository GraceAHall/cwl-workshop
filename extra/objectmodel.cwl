cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
requirements:
  InlineJavascriptRequirement: {}

inputs:

  greeting:
    type: string
    # inputBinding:
    #   position: 1
  
  name:
    type: string

arguments: 
  - valueFrom: '$(inputs.greeting + " " + inputs.name)'
    position: 1

outputs: []