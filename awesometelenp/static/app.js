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
var control_retransmit = false;
var control_msgtype = 0;
var control_stream = false;
var control_open = false;
var connection = new Object();
var cmdVel = new Object();

var MSG_STRING = 1;
var MSG_CMD_VEL = 2;
var MSG_VELOCITY = 3;



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
	if (document.getElementById("setTurtlebot").checked) control_retransmit = true;
	else {
		control_retransmit = false;
		document.getElementById("setStream").checked = false;
	}
	console.log(control_retransmit + "  retransmit");
}

function tryStreamClick() {
	if (control_retransmit) {
	
	}
	else {
		document.getElementById("setStream").checked = false;
	}
	console.log("stream");
}

function tryRadioClick() {

	if (document.getElementById("messageString").checked) control_msgtype = MSG_STRING;

	if (document.getElementById("messageCmdvel").checked) control_msgtype = MSG_CMD_VEL;	

	if (document.getElementById("messageVel").checked) control_msgtype = MSG_VELOCITY;	

	console.log(control_msgtype);
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
	if(control_retransmit == true) retransmitEvent(rx_object);
}

function retransmitEvent(data) {
	console.log(data.direction + " --");
	var numLinear = 0;
	var numAngular = 0;
	
	switch(data.direction) {
		case "left":
			numAngular = 1;
		break;
		
		case "right":
			numAngular = -1;
		break;
		
		case "up":
			numLinear = 1;
		break;
		
		case "down":
			numLinear = -1;
		break;
		
		case "stop":
			numAngular = 0;
			numLinear = 0;
		break;
	}
	
	var advertise_message = "";
	var outgoing_message = "";
	
	switch (control_msgtype) {
		case MSG_STRING:
			advertise_message =  {op: 'advertise', topic:'/talker', type: 'std_msgs/String'};
			outgoing_message =  {op: 'publish', topic: '/talker', 
				msg: { data: "hello " + data.direction }};
			
			//var con = new ros.Bridge('ws://localhost:9090');

			
			var ros = new ROSLIB.Ros({
    			url : 'ws://localhost:9090'
  			});
			
			
			var cmdVel = new ROSLIB.Topic({
    			ros : ros,
    			name : '/talker',
   				 messageType : 'std_msgs/String'
  			});
  			
  			var string = new ROSLIB.Message({ data: "hello " + data.direction });
			

			cmdVel.publish(string);

			console.log("no error?");

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
		break;
		
		case MSG_CMD_VEL:
			advertise_message =  {'op': 'advertise', 'topic':'/turtle1/command_velocity', 'type': 'turtlesim/Velocity'};
		
			outgoing_message =  {'op': 'publish', 'topic': '/turtle1/command_velocity', 
				'msg': {
    			linear : {
      			x : numLinear,
      			y : 0.0,
      			z : 0.0
    			},
    			angular : {
      			x : 0.0,
      			y : 0.0,
      			z : numAngular
    			}
  			}};
		break;
		
		case MSG_VELOCITY:
			advertise_message =  {'op': 'advertise', 'topic':'/turtle1/command_velocity', 'type': 'turtlesim/Velocity'};
			outgoing_message =  {'op': 'publish', 'topic': '/turtle1/command_velocity', 
				'msg': {'linear' : numLinear, 'angular' : numAngular }};
		break;
	}

	//cmdVel.publish(string);

	//var node = new ros.Connection("ws://localhost:9090");
	//connection = new WebSocket('wss://localhost:9090');
	/*
	node.setOnOpen ( function(e) {
		console.log ("ros out");
		node.publish('/talker', 'std_msgs/String', '"' + "hello " + data.direction + '"' );

		console.log ("ros out done: " + JSON.stringify(outgoing_message));

	});
	*/

	if (control_open) {
	console.log("do this...");
	
		connection.send(JSON.stringify(advertise_message));
	
		connection.onmessage = function(incoming_message) { console.log("Received:", incoming_message.data); }
	
		console.log(JSON.stringify(outgoing_message) + "--");
	
		connection.send(JSON.stringify(outgoing_message));	
	
		connection.onmessage = function(incoming_message) { console.log("Received:", incoming_message.data); }
	}
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
	console.log("websocket test");
	if ('WebSocket' in window){
    	/* WebSocket is supported. You can proceed with your code*/
		connection = new WebSocket('wss://localhost:9090');
		connection.onopen = function () { 
			control_open = true ;
			console.log("websocket"); 
		};	
	} else {
    	/*WebSockets are not supported. Try a fallback method like long-polling etc*/
	
		alert("no web sockets.");
	}
	
	
      gapi.hangout.onApiReady.remove(apiReady);
    }
  };

  // This application is pretty simple, but use this special api ready state
  // event if you would like to any more complex app setup.
  gapi.hangout.onApiReady.add(apiReady);
}




gadgets.util.registerOnLoadHandler(init);
