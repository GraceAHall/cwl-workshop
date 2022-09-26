

cwlVersion: v1.0 # or v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
stdout: myfile.txt

baseCommand: [ cat ]

inputs:
  infile:
    type: File
    inputBinding: 
      position: 1

outputs:
  outfile:
    type: File
    outputBinding:
      glob: myfile.txt
      outputEval: ${self[0].basename='newname.txt'; return self;}
      #outputEval: ${self.outfile.basename='newname.txt'; return self;}