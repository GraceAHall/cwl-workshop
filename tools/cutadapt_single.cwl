cwlVersion: v1.2
class: CommandLineTool

baseCommand: cutadapt

inputs:
  reads:
    type: File
    inputBinding:
      position: 999

arguments:
  - prefix: --output
    position: 998
    valueFrom: "out.fastq"

#   adapter:
#     type: string
#     inputBinding: 
#       prefix: --adapter
#       position: 1
  
stdout: report.txt

outputs:
  report:
    type: stdout
  
  trimmed_reads:
    type: File
    outputBinding:
      glob: "out.fastq"


