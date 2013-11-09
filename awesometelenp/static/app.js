/*
* Copyright (c) 2011 Google Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License"); you may not
* use this file except in compliance with the License. You may obtain a copy of
* the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations under
* the License.
*/
var serverPath = '//awesometelenp.appspot.com/';
var tx_number = 0;
var tx_operation = "";
var tx_gapi_key = "telenp";
var rx_data = "";
var rx_object = null;
var rx_data_old = "";
var retransmit = false;

function tryLeftClick() {
	formJSONClick("left");
}

function tryRightClick() {
	formJSONClick("right");
}

function tryUpClick() {
	formJSONClick("up");
}

function tryDownClick() {
	formJSONClick("down");
}

function tryStopClick() {
	formJSONClick("stop");
}

function tryTurtlebotClick() {
	if (document.getElementById("setTurtlebot").checked) retransmit = true;
	else retransmit = false;
	console.log(retransmit + "  retransmit");
}

function formJSONClick(operation) {
	tx_operation = operation; 
	tx_number ++;
	tx_number = tx_number % 16;
	console.log(operation);
	makeText = JSON.stringify(makeJSON(operation,  tx_number) ) ;
	console.log( makeText );
	try {	
		gapi.hangout.data.setValue( tx_gapi_key, makeText);
	}
	catch (e) {
		console.log("hangout setValue error.");
	}
}

function makeJSON(operation, num ) {
	var myJSON = { "direction" : operation , "number" : num }; 
	return myJSON;
}

function recieveEvent () {
	
	rx_data = gapi.hangout.data.getState()[tx_gapi_key];
	if (rx_data == rx_data_old) return;

	rx_object = JSON.parse(rx_data) ;	
	console.log( rx_object.direction + " -- " + rx_object.number);
	rx_data_old = rx_data;
	if(retransmit == true) retransmitEvent(rx_object);
}

function retransmitEvent(data) {
	console.log(data.direction + " --");
	
	var twist = new ROSLIB.Message({
    	linear : 1, //float32
    	angular : 1 //float32
  	});
	/*
	var twist = new ROSLIB.Message({
    	linear : {
      	x : 0.1,
      	y : 0.2,
      	z : 0.3
    	},
    	angular : {
      	x : -0.1,
      	y : -0.2,
      	z : -0.3
    	}
  	});
  	*/
	cmdVel.publish(twist);
}

// A function to be run at app initialization time which registers our callbacks
function init() {
  console.log('Init app.');

  var apiReady = function(eventObj) {
    if (eventObj.isApiReady) {
      console.log('API is ready');

	

    gapi.hangout.data.onStateChanged.add(function(eventObj) {
        recieveEvent();
    });
	
	var ros = new ROSLIB.Ros({url : 'ws://localhost:9090'});
	var cmdVel = new ROSLIB.Topic({
		ros : ros,
		name : '/turtle1/command_velocity', //'/cmd_vel',
		messageType : 'turtlesim/Velocity' //'geometry_msgs/Twist'
	});
	
      gapi.hangout.onApiReady.remove(apiReady);
    }
  };

  // This application is pretty simple, but use this special api ready state
  // event if you would like to any more complex app setup.
  gapi.hangout.onApiReady.add(apiReady);
}

gadgets.util.registerOnLoadHandler(init);
