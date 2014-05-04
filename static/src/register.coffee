class FileIpload = (img, file) ->
  reader = new FileReader()
  @ctrl = createThrobber img
  @xhr = new XMLHttpRequest()

  @xhr.open 'POST', '/submit'
  @xhr.overrideMimeType 'text/plain; charset=x-user-defined-binary'

  reader.onload = (evt) ->
    @xhr.sendAsBinary evt.target.result
  
  reader.readAsBinaryString file

window.onload = ->
  $('#submit').click ->
    fileInput = document.getElementById 'input'

    new FileUpload fileInput, fileInput.files[0]
    url = window.URL.createObjectUrl fileInput.files[0]
