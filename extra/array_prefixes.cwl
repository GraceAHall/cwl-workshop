cwlVersion: v1.2
class: CommandLineTool
stdout: output.txt

baseCommand: echo

# input data
# filesA: [one, two, three]
# filesB: [four, five, six]
# filesC: [seven, eight, nine]

inputs:
  filesA:
    type: string[]
    inputBinding:
      prefix: -A
      position: 1

  filesB:
    type: string[]
    inputBinding:
      prefix: -B=
      itemSeparator: ","
      separate: false
      position: 2
  
  filesC:
    type:
      type: array
      items: string
      inputBinding:
        prefix: -C=
        separate: false
    inputBinding:
      position: 3

outputs:
  example_out:
    type: stdout

