'use strict';

var fs = require('fs')
var express = require('express')
var cors = require('cors')
var app = express()
const { spawn } = require('child_process');

var APIkey = "-";

//Generate the image every 5 seconds
function generateImage(arg) {
  exec('curl -H "Authorization: Bearer ' + APIkey + '" "http://grafana:3000/render/dashboard-solo/db/sin?refresh=5s&orgId=1&from=1507466925238&to=1507467422437&panelId=1&width=1000&height=500&tz=UTC%2B00%3A00" > snapshot.png', puts);
  //exec('curl -H "Authorization: Bearer ' + APIkey + '" "http://grafana:3000/render/dashboard-solo/db/sin?refresh=5s&orgId=1&from=' + (Math.floor(new Date()) - 300) + '&to=' + (Math.floor(new Date())) + '&panelId=1&width=1000&height=500&tz=UTC%2B00%3A00" > snapshot.png', puts);
}
setInterval(generateImage, 5000);

//Verifies that the user is allowed to see graphs
function verify(key) {
  var request = require('sync-request');

  var string = 'Bearer ' + APIkey;

  var headers = {
    'Authorization': string
  };

  var res = request('GET', 'http://grafana:3000', {
  'headers': headers
});

  if (res.statusCode == 200) {
    //Authorized
    return true
  } else {
    //Unauthorized
    return false;
  }
}

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.get('/graph/:apikey', sendGraph);
function sendGraph(req, res, next) {
  var data = req.params;
  res.setHeader("Access-Control-Allow-Origin", '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST,GET,OPTIONS,PUT,DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type,Accept');

  //Store the API key
  APIkey = data.apikey;

  console.log("Graph requested by token " + data.apikey + ".");
  if (verify(APIkey)) {
    res.sendFile('/usr/src/app/index.html');
  } else {
    res.send("Unauthorized");
  }

  //generateImage();
}

app.get('/snapshot.png', sendSnapshot);
function sendSnapshot(req, res) {
  if (verify(APIkey)) {
    res.sendFile('/usr/src/app/snapshot.png'); // Send the file data to the browser.
  } else {
    res.send("Unauthorized");
  }
}

app.get('/*', function(req, res, next) {
  res.send("Unauthorized");
})

app.listen(3001, function () {
  console.log('CORS-enabled web server listening on port 3001')
})

var sys = require('sys')
var exec = require('child_process').exec;
function puts(error, stdout, stderr) { console.log(stdout) }
