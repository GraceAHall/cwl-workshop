cwlVersion: v1.2
class: CommandLineTool

baseCommand: echo
stdout: echo.txt

inputs:
  the_string:
    type: string
    inputBinding:
      position: 1
      prefix: "the string:"
  
  the_number:
    type: int
    inputBinding:
      position: 2
      prefix: "the number:"

outputs:
  phrase:
    type: stdout