class: CommandLineTool
cwlVersion: v1.2

baseCommand: cutadapt
stdout: report.txt

inputs:
  reads:
    type: File
    inputBinding:
      position: 3
  
  minimum_length:
    type: int?
    inputBinding:
      prefix: --minimum-length
      position: 1

  quality_cutoff:
    type: int?
    default: 30
    inputBinding:
      prefix: --quality-cutoff
      position: 1

  trim_n:
    type: boolean?
    inputBinding:
      prefix: --trim-n
      position: 1

arguments:
  - prefix: --output
    valueFrom: out.fastq
    position: 2

outputs:
  report: 
    type: stdout 
  
  trimmed_reads:   
    type: File
    outputBinding:
      glob: out.fastq

