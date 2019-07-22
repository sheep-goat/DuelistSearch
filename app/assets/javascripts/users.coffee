# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#select_file').on 'change',$('#select_file'), (e) ->
    file = e.target.files[0]
    reader = new FileReader
    $preview = $('#img_field')
    debugger
    reader.onload = do (file) ->
      (e) ->
        $preview.empty()
        $preview.append $('<img>').attr(
          src: e.target.result
          width: '100%'
          class: 'preview'
          title: file.name)
        return
    reader.readAsDataURL file
    return
  return