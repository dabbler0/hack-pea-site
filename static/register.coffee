window.onload = ->
  inputs = [
    document.getElementById 'initialmember'
  ]

  members = document.getElementById 'memberslist'

  document.getElementById('addmember').addEventListener 'click', (event) ->
    newDiv = document.createElement('div'); newDiv.className = 'input-group spaced'
    newInput = document.createElement('input'); newInput.type = 'text'; newInput.className = 'form-control'; newInput.placeholder = 'John Smith'
    newDiv.appendChild newInput
    members.appendChild newDiv
    inputs.push newInput

  document.getElementById('signup').addEventListener 'click', (event) ->
    console.log inputs[0].value
    console.log (input.value for input in inputs)
    $.ajax
      url: '/register'
      data: {
        'email': document.getElementById('email').value
        'organisation': document.getElementById('organisation').value
        'members': JSON.stringify (input.value for input in inputs)
      }
      success: ->
        location.href = 'index.html'
