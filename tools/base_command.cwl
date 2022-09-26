
cwlVersion: v1.0  
class: CommandLineTool
stdout: my_number.txt

baseCommand: [ echo, "42" ]

inputs: []
outputs: []

# or alternative YAML list format:

cwlVersion: v1.0  
class: CommandLineTool
stdout: my_number.txt

baseCommand: 
  - echo
  - "42"

inputs: []
outputs: []