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
  - prefix: --output
    position: 2
    valueFrom: $(inputs.reads_1.basename).trimmed.fq
#   - valueFrom: --output $(inputs.reads_1.basename).trimmed.fq
#     position: 2

stdout: report.txt

outputs:
  report:
    type: stdout
  
  trimmed_reads:
    type: File
    outputBinding:
      glob: $(inputs.reads.basename).trimmed.fq
      #glob: $(inputs.reads.basename).trimmed$(inputs.reads.nameext)


