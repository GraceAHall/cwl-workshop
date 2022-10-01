cwlVersion: v1.2
class: CommandLineTool

baseCommand: cutadapt

inputs:
  reads:
    type: File
    inputBinding:
      position: 999

  adapter:
    type: string
    inputBinding: 
      prefix: --adapter
      position: 1

arguments:
# start with expanded format
#   - prefix: --minimum-length
#     position: 1
#     valueFrom: "100"
#   - prefix: --output
#     valueFrom: "out.fastq"
  - valueFrom: "--minimum-length 100"
    position: 1
  - valueFrom: "--quality-cutoff 100"
    position: 1
  - valueFrom: "--output out.fastq"
    position: 2

outputs:
  report:
    type: stdout
  
  trimmed_reads:
    type: File
    outputBinding:
      glob: "out.fastq"









