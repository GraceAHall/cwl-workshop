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

  minimum_length:
    type: int?
    inputBinding:
      prefix: --minimum-length
      position: 1

  quality_cutoff:
    type: int?
    inputBinding:
      prefix: --quality-cutoff
      position: 1
  
  outfile:
    type: string?
    default: "out.fastq"
    inputBinding:
      prefix: --output
      position: 2
  
outputs:
  report:
    type: stdout
  
  trimmed_reads:
    type: File
    outputBinding:
      glob: "out.fastq"

  

