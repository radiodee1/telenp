/*

*/

var tx_number = -1;
var tx_operation = "";
var tx_gapi_key = "telenp"; // used by transmitting node
var tx_gapi_error = "telenp_error"; // used by turtlebot node
var rx_data = "";
var rx_error = "";
var rx_error_obj = null;
var rx_object = null;
var rx_data_old = "";
var control_retransmit = false;
var control_msgtype = 0;
var control_stream = false;
var control_open = false;
var control_connected = false;
var control_stopped = false;
var connection = new Object();
var cmdVel = new Object();
var stream_num = 0;
var timer_key = 0;
var timer_up = 0;
var timer_down = 0;

var last_key = "stop";
var last_counter = 1;

var MSG_STRING = 1;
var MSG_CMD_VEL = 2;
var MSG_VELOCITY = 3;

var choose_output_string = "TURTLEBOT SETUP: <br>" +
			" This is for the 'rostopic echo' method.<br><br><i style='color:blue'>" +
			"$ roscore <br>" +
			"$ roslaunch rosbridge_server rosbridge_websocket.launch <br>" +
			"$ rostopic echo /talker <br><br>" +
			"</i>... then look at terminal for output when" +
			" arrow buttons are clicked";
var choose_output_twist = "TURTLEBOT SETUP: <br>" +
			"in separate turtlebot terminals...<br><br><i style='color:blue'>" +
			"$ roscore <br>" +
			"$ roslaunch rosbridge_server rosbridge_websocket.launch <br>" +
			"$ roslaunch turtlebot_bringup minimal.launch <br><br>" +
			"</i>... then direct the turtlebot from the Google Hangout screen.";
var choose_output_reserved = "TURTLEBOT SETUP: <br>" +
			" This is reserved for future development.";
var choose_click = "click the arrows to direct the turtlebot.";
var choose_stream = "Click to disable - on the turtlebot computer - precautions that prevent " +
			"more than one remote computer from giving instructions at the same time.";
var choose_turtlebot = "Click this option to tell the " +
			"system that this is the node that <i>this</i> is the node that hosts the actual" +
			"turtlebot hardware.";
var button_center_start = '<img ' + //'src="bitmap/button_center.png"' +
			' src="//awesometelenp.appspot.com/static/bitmap/button_center.png"' +  
			' onmousedown="tryStopClick()" alt="CLICK" >';
var button_center_error = '<img ' + //'src="bitmap/button_err.png"' + 
			' src="//awesometelenp.appspot.com/static/bitmap/button_err.png"' +  
			' onmousedown="tryStopClick()" alt="ERROR" >';


function tryLeftClick() {
	formJSONClick("left");
	if (!control_retransmit) changeHintText(choose_click); 
}

function tryRightClick() {
	formJSONClick("right");
	if (!control_retransmit) changeHintText(choose_click); 
}

function tryUpClick() {
	formJSONClick("up");
	if (!control_retransmit) changeHintText(choose_click); 
	if (timer_up == 0) timer_up = setInterval('formJSONClick("up")', 500);
}

function tryDownClick() {
	formJSONClick("down");
	if (!control_retransmit) changeHintText(choose_click); 
	if (timer_down == 0) timer_down = setInterval('formJSONClick("down")', 500);
}

function tryStopClick() {
	tx_number = - 1;
	formJSONClick("stop");
	control_stopped = false;
	if (!control_retransmit) changeHintText(choose_click);
	changeButtonPic(button_center_start); 
}

function tryClearTimer() {
	if (timer_up != 0) {
		clearInterval(timer_up);
		timer_up = 0;
	}
	if (timer_down != 0) {
		clearInterval(timer_down);
		timer_down = 0;
	}
}

function tryTurtlebotClick() {
	
	if (document.getElementById("setTurtlebot").checked && !control_connected) { 
		control_retransmit = true;
		control_msgtype = 2;
		changeHintText(choose_turtlebot);
		document.getElementById("messageTwist").checked = true;
		control_connected = true;
		formJSONError();
	}
	else {
		control_retransmit = false;
		document.getElementById("setStream").checked = false;
		if (control_connected) formJSONError();
	}
	console.log(control_retransmit + "  retransmit");
}

function tryStreamClick() {
	if (control_retransmit) {
		changeHintText(choose_stream);
		
		if (! document.getElementById("setStream").checked) {
			control_stream = false;
			//tx_number = -1;
		}
		else { 
			control_stream = true;
		}
	}
	else {
		document.getElementById("setStream").checked = false;
	}
	console.log("stream " + control_stream);
}

function tryRadioClick() {

	if (document.getElementById("messageString").checked) control_msgtype = MSG_STRING;

	if (document.getElementById("messageTwist").checked) control_msgtype = MSG_CMD_VEL;	

	if (document.getElementById("messageStamped").checked) control_msgtype = MSG_VELOCITY;	

	console.log(control_msgtype);
	
	switch (control_msgtype) {
		case MSG_STRING:
		
			changeHintText(choose_output_string);
			
		break;
		
		case MSG_CMD_VEL:
		
			changeHintText(choose_output_twist);
			
		break;
		
		case MSG_VELOCITY:
		
			changeHintText(choose_output_reserved);
			
		break;
	}
}

function changeHintText(text) {
	document.getElementById('setupText').innerHTML= text;
}

function changeButtonPic(button_html) {
	document.getElementById('middleButton').innerHTML = button_html;
}

function formJSONClick(operation) {
	tx_operation = operation; 
	tx_number ++;
	tx_number = tx_number % 16;
	console.log(operation);
	makeText = JSON.stringify(makeJSONCommand(operation,  tx_number) ) ;
	console.log( makeText );
	try {	
		gapi.hangout.data.setValue( tx_gapi_key, makeText);
	}
	catch (e) {
		console.log("hangout setValue error. -- Click");
	}
}

function formJSONError() {
	var connect = control_connected;
	var stopped = control_stopped;
	var kinect = null;

	makeText = JSON.stringify(makeJSONError(connect, stopped, kinect));
	try {
		gapi.hangout.data.setValue( tx_gapi_error, makeText);
	}
	catch (e) {
		console.log("hangout setValue error. -- Error");
	}
}

function makeJSONCommand(operation, num ) {
	var myJSON = { "direction" : operation , "number" : num }; 
	return myJSON;
}

function makeJSONError(connected, stopped, kinect) {
	var myJSON = { "connected" : connected , "stopped" : stopped , "kinect" : kinect  };
	return myJSON;
}

function recieveEvent () {
	
	// error data from hangouts...
	rx_error = gapi.hangout.data.getState()[tx_gapi_error];
	console.log(rx_error + " error msg");

	if (rx_error != null) {
		rx_error_obj = JSON.parse(rx_error);
		if (rx_error_obj.connected == true) control_connected = true;
	}

	// direction data from hangouts...
	rx_data = gapi.hangout.data.getState()[tx_gapi_key];
	if (rx_data != rx_data_old) { 
	
		rx_object = JSON.parse(rx_data) ;	

		// change sequence numbers...
		stream_num = (stream_num + 1 ) % 16;	
		if (rx_object.direction == "stop") stream_num = 0;

		console.log( rx_object.direction + " -- " + rx_object.number);
		// handle stream setting here...
		if (!control_stream && rx_object.number != stream_num) {
			control_stopped = true;
			changeButtonPic(button_center_error);
			console.log("exit due to bad seq num");
			return;
		}
		rx_data_old = rx_data;
		if(control_retransmit == true) retransmitEvent(rx_object);
	}
}

function retransmitEvent(data) {
	console.log(data.direction + " -- retransmit");
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
			if (last_key === "up" && last_counter < 5 ) {
				last_counter ++ ;
				setSpeedTimer();
			} 
			else if (timer_key == 0) last_counter = 1;
			numLinear = 0.20; // 
		break;
		
		case "down":
			if (last_key === "down" && last_counter < 5 ) {
				last_counter ++ ;
				setSpeedTimer();
			}
			else if (timer_key == 0) last_counter = 1;
			numLinear = -0.20; // 
		break;
		
		case "stop":
			numAngular = 0;
			numLinear = 0;
		break;
	}
	
	last_key = data.direction;
	///////////////////////
	
	switch (control_msgtype) {
		case MSG_STRING:
			
			var ros = new ROSLIB.Ros({
    			url : 'ws://localhost:9090'
  			});
			
			
			var cmdVel = new ROSLIB.Topic({
    			'ros' : ros,
    			'name' : '/talker',
   				 messageType : 'std_msgs/String'
  			});
  			
  			var string = new ROSLIB.Message({ data: "hello " + data.direction });
			

			cmdVel.publish(string);

			console.log("no error? -- string");

			
		break;
		
		case MSG_CMD_VEL:

			/* 
			turtlebot_bringup (?)
			roslaunch turtlebot_bringup minimal.launch
			always launch software first then connect turtlebot!!
			*/

			var ros = new ROSLIB.Ros({
    			url : 'ws://localhost:9090'
  			});
			
			
			var cmdVel = new ROSLIB.Topic({
    			'ros' : ros,
    			'name' : '/mobile_base/commands/velocity',
   				 messageType : 'geometry_msgs/Twist'
  			});
  			
  			
  			var twist = new ROSLIB.Message({
    			linear : {
      			x : numLinear * last_counter,
      			y : 0.0,
      			z : 0.0
    			},
    			angular : {
     			x : 0.0,
      			y : 0.0,
      			z : numAngular
    			}
  			});
  				

			cmdVel.publish(twist);

			console.log("no error? -- twist");

		break;
		
		case MSG_VELOCITY:
			
			var ros = new ROSLIB.Ros({
    			url : 'ws://localhost:9090'
  			});
			
			
			var cmdVel = new ROSLIB.Topic({
    			'ros' : ros,
    			'name' : '/turtle1/command_velocity',
   				 messageType : 'turtlesim/Velocity'
  			});
  			
			
  			var velocity = new ROSLIB.Message({
    			linear : numLinear,
    			angular : numAngular
  			});
  				

			cmdVel.publish(velocity);

			console.log("no error? -- velocity");
		break;
	}
	
}

function setSpeedTimer() {
	if (timer_key != 0) {
		clearTimeout(timer_key);
	}
	else {
		last_counter = 1;
	}
	timer_key = setTimeout(doSpeedTimer, 700);
}

function doSpeedTimer() {
	last_counter = 1;
	timer_key = 0;
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
    	/* WebSocket is supported.*/
			
	} else {
    	/*WebSockets are not supported.*/
	
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

