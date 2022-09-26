
cwlVersion: v1.2
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.src1)
        entryname: newName
      - entry: $(inputs.src2)
        entryname: $(inputs.src1.basename)_custom_extension
        writable: true  # just added to show write priviledges


inputs:
  src1:
    type: File
    inputBinding:
      position: 1
  
  src2:
    type: File
    inputBinding:
      position: 2