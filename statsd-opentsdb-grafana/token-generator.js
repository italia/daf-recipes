//This script connects to the Grafana API (with the default username and password).
//Then it creates a new user and generates and API Token with visualization privileges.
//Then it outputs the complete URL to the Webapp Grafana iframe.

var request = require('sync-request');

var username = 'admin',
    password = 'admin',
    port = '3000',
    host = 'localhost',
    url = 'http://' + username + ':' + password + '@' + host + ':' + port;


//Check if there are any existing API keys
var res = request('GET',
    url + '/api/auth/keys');
//console.log(res.getBody().toString());

var removalNeeded = true;

if (res.getBody().toString() == "[]") {
  //console.log("No auth key");
  removalNeeded = false;
} else {
  //Get auth key ID and save it
  myJSON = JSON.parse(res.getBody());
  //console.log("Auth key ID = " + myJSON[0]['id']);
  removalNeeded = true;
}

if (removalNeeded == true) {
  //console.log("Removal needed");
  var res = request('DELETE',
      url + '/api/auth/keys/' + myJSON[0]['id']
  );
  //console.log(res.getBody().toString());
} else {
  //console.log("Removal NOT needed");
}

var res = request('POST',
    url + '/api/auth/keys',
    { json: {
      "name": "mykey",
      "role": "Viewer"
    } }
);
//console.log(res.getBody().toString());

myJSON = JSON.parse(res.getBody());
//console.log("Auth key = " + myJSON['key']);
console.log("WebApp URL: http://localhost:3001/graph/" + myJSON['key']);
