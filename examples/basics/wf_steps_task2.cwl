
class: Workflow
cwlVersion: v1.2

inputs:
  greeting: string
  farewell: string

steps:
  echo:
    run: ./echo.cwl
    in:
      message: greeting
    out: [phrase]
  
  wc:
    run: ./wc.cwl
    in:
      infile: echo/phrase            # 'phrase' output from echo step feeds 'infile'
    out: [count]

outputs: []

# outputs:
#   echo_out: 
#     type: File
#     outputSource: echo/phrase
    
#   wc_out: 
#     type: File
#     outputSource: wc/count