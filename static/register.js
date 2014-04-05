(function() {
  window.onload = function() {
    var inputs, members;
    inputs = [document.getElementById('initialmember')];
    members = document.getElementById('memberslist');
    document.getElementById('addmember').addEventListener('click', function(event) {
      var newDiv, newInput;
      newDiv = document.createElement('div');
      newDiv.className = 'input-group spaced';
      newInput = document.createElement('input');
      newInput.type = 'text';
      newInput.className = 'form-control';
      newInput.placeholder = 'John Smith';
      newDiv.appendChild(newInput);
      members.appendChild(newDiv);
      return inputs.push(newInput);
    });
    return document.getElementById('signup').addEventListener('click', function(event) {
      var input;
      console.log({
        'email': document.getElementById('email'),
        'organisation': document.getElementById('organisation'),
        'members': JSON.stringify((function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = inputs.length; _i < _len; _i++) {
            input = inputs[_i];
            _results.push(input.value);
          }
          return _results;
        })())
      });
      return location.href = 'index.html';
    });
  };

}).call(this);

//# sourceMappingURL=register.js.map
