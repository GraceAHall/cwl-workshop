
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}

inputs:
  message_array: string[]

steps:
  echo:
    run: echo.cwl
    scatter: message
    in:
      message: message_array
    out: [echo_out]
    
  wordcount:
    run: wc.cwl
    scatter: input_file
    in:
      input_file: echo/echo_out
    out: []

outputs: []