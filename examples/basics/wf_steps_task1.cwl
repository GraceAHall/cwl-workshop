
class: Workflow
cwlVersion: v1.2

inputs:
  greeting: string
  farewell: string

steps:
  echo:
    run: ./echo.cwl
    in:
      message: greeting            # 'greeting' workflow input feeds 'message' tool input
    out: [phrase]

outputs: []