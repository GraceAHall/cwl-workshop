cwlVersion: v1.2
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}

baseCommand: echo

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