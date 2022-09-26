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


# the above is the same as the below

cwlVersion: v1.2
class: CommandLineTool
stdout: random_stdout_filenameABCDEFG

baseCommand: echo

inputs:
  message_text:
    type: string
    inputBinding:
      position: 1

outputs:
  example_out:
    type: File
    streamable: true
    outputBinding:
      glob: random_stdout_filenameABCDEFG

