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
    console.log {
      'email': document.getElementById('email')
      'organisation': document.getElementById('organisation')
      'members': JSON.stringify (input.value for input in inputs)
    }
    location.href = 'index.html'
