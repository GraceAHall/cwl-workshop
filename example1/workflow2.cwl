
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
    
  char_count:
    run: ./wc_char.cwl 
    in:
      infile: echo/echo_out
    out: [count]

outputs:
  out1:
    type: File
    outputSource: char_count/count