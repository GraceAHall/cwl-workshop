class: CommandLineTool
cwlVersion: v1.2

baseCommand: cutadapt
stdout: cutadapt.txt

inputs:
  read1:
    type: File
    inputBinding:
      position: 2
      
  read2:
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
    inputBinding:
      prefix: --quality-cutoff
      position: 1

arguments:
  - prefix: --output
    valueFrom: $(inputs.read1.basename).trimmed$(inputs.read1.nameext)
    position: 1
  - prefix: --paired-output
    valueFrom: $(inputs.read2.basename).trimmed$(inputs.read2.nameext)
    position: 1

outputs:
  report: 
    type: stdout 
  
  read1_trimmed:   
    type: File
    outputBinding:
      glob: $(inputs.read1.basename).trimmed$(inputs.read1.nameext)
  
  read2_trimmed:   
    type: File
    outputBinding:
      glob: $(inputs.read2.basename).trimmed$(inputs.read2.nameext)

