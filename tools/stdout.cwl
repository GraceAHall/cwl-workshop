cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
#stdout: hello.txt

inputs:
  message_text:
    type: string
    inputBinding:
      position: 1

outputs:
  example_out:
    type: stdout
