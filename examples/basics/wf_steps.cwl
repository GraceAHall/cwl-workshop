
class: Workflow
cwlVersion: v1.2

inputs:
  in1: string

steps:
  echo:
    run: ./echo.cwl
    in:
      message: in1
    out: [phrase]
    
outputs: []