
class: Workflow
cwlVersion: v1.2

inputs:
  in1: string

steps:
  echo:
    run: ./echo.cwl
    in:
      message: in1
    out: [echo_out]

outputs:
  out1:
    type: File
    outputSource: echo/echo_out