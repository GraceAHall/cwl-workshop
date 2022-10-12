
class: Workflow
cwlVersion: v1.2

inputs:
  my_string: string
  my_int: int
  my_file: File

steps:
  echo:
    run: ./echo.cwl
    in:
      the_string: my_string
      the_number: my_int
    out: [phrase]
  
  wc:
    run: ./wc.cwl
    in:
      infile: my_file
    out: [count]

outputs:
  echo_out: 
    type: File
    outputSource: echo/phrase
    
  wc_out: 
    type: File
    outputSource: wc/count