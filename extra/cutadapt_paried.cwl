cwlVersion: v1.2
class: CommandLineTool

baseCommand: cutadapt

inputs:
  adapter:
    type: string
    inputBinding: 
      prefix: --adapter
      position: 1
      
  reads_1:
    type: File
    inputBinding: 
      position: 999
  
  reads_2:
    type: File
    inputBinding:
      position: 1000

arguments:
  - prefix: --output
    valueFrom: $(inputs.reads_1.basename).trimmed.fq
  - prefix: --paired-output
    valueFrom: $(inputs.reads_2.basename).trimmed.fq

outputs:
  report:
    type: stdout
  
  trimmed_reads_1:
    type: File
    outputBinding:
      glob: $(inputs.reads_1.basename).trimmed.fq
  
  trimmed_reads_2:
    type: File
    outputBinding:
      glob: $(inputs.reads_2.basename).trimmed.fq


