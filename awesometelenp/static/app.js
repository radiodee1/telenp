/*

*/

var mod_base = 512;
var basename = "telenp";
var test_config = true;
var tx_number = 0;
var tx_operation = "";
var tx_gapi_key = "telenp"; // used by transmitting (user) node
var tx_gapi_error = "telenp_error"; // used by turtlebot node
var rx_data = "";
var rx_error = "";
var rx_error_obj = null;
var rx_obj = null;
var rx_data_old = "";
var rx_error_old = "";
var control_retransmit = false;
var control_msgtype = 0;
var control_stream = false;
var control_obstructed = false;
var control_connected_motors = false;
var control_connected_rx = false;
var control_stopped = false;
var control_stopped_rx = false;
var connection = new Object();
var cmdVel = new Object();
//var kinect_listener = null;
var stream_num = 0;
var timer_key = 0;
var timer_up = 0;
var timer_down = 0;
var timer_left = 0;
var timer_right = 0;

var last_key = "stop";
var last_counter = 1;
var speed_max = 3;
var seq_ros = 0;

var MSG_STRING = 1;
var MSG_TWIST = 2;
var MSG_RESERVED = 3;

    var ros = new ROSLIB.Ros({
    	url : 'ws://localhost:9090'
  	});
	
	var cmdVel = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/talker',
   		 messageType : 'std_msgs/String'
  	});
			
	var cmdVel2 = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/mobile_base/commands/velocity',
   		 messageType : 'geometry_msgs/Twist'
  	});

    var cmdVel3 = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/'+ basename +'/command_velocity',
   		 messageType : 'geometry_msgs/TwistStamped'
  	});

    var kinect_listener = new ROSLIB.Topic({
    	'ros' : ros,
    	//'name' : '/'+ basename +'/kinect_feedback',
    	'name' : '/listener',
   		// messageType : 'std_msgs/UInt8'
   		 messageType : 'std_msgs/String',
   		 
  	});

var choose_output_string = "for ROS String ouput...<br><br>" +
            "TURTLEBOT SETUP: <br>" +
			"in separate turtlebot terminals...<br>" +
			" (this is for the 'rostopic echo' method.)<br><br>" + 
			"<i style='color:blue;font-size:10pt;font-family:courier'>" +
			"$ roslaunch rosbridge_server rosbridge_websocket.launch <br>" +
			"$ rostopic echo /talker <br><br>" +
			"</i>... then look at terminal for output when" +
			" arrow buttons are clicked";
var choose_output_twist = "for ROS Twist output... <br><br>" +
            "TURTLEBOT SETUP: <br>" +
			"in separate turtlebot terminals...<br><br>" +
			"<i style='color:blue;font-size:10pt;font-family:courier'>" +
			"$ roslaunch rosbridge_server rosbridge_websocket.launch <br>" +
			"$ roslaunch turtlebot_bringup minimal.launch <br><br>" +
			"</i>... then direct the turtlebot from the Google Hangout screen.";
var choose_output_reserved = "this option is RESERVED for future development. <br><br>" +
            "TURTLEBOT SETUP: <br>" +
			"after installing tele-np ros packages...<br><br>" +
			"<i style='color:blue;font-size:10pt;font-family:courier'>" +
			"$ roslaunch tele_presence full.launch <br><br>" +
			"</i>... then direct the turtlebot from the Google Hangout screen.";
var choose_click =      "click the arrows to direct the turtlebot.";
var choose_stream = "for communication with ROS, <br>" +
            "\"Stream Mode\" clicked <br><br>" +    
            "Click to disable - on the turtlebot computer - precautions that prevent " +
			"more than one remote computer from giving instructions at the same time.";
var choose_turtlebot = "for communication with ROS, <br>" +
            "\"Turtlebot Node\" clicked <br><br>" + 
            "Click this option to tell the " +
			"system that this is the node that <i><u>this</u></i> is the node that hosts the " +
			 " actual turtlebot hardware.";
var button_center_start = '<img ' + //'src="bitmap/button_center.png"' +
			' src="//awesometelenp.appspot.com/static/bitmap/button_center.png"' +  
			' onmousedown="tryStopClick()" alt="CLICK" >';
var button_center_error = '<img ' + //'src="bitmap/button_err.png"' + 
			' src="//awesometelenp.appspot.com/static/bitmap/button_err.png"' +  
			' onmousedown="tryStopClick()" alt="ERROR" >';
var button_center_src_start = "//awesometelenp.appspot.com/static/bitmap/button_center.png";
var button_center_src_error = "//awesometelenp.appspot.com/static/bitmap/button_err.png";
var button_test_start = "static/bitmap/button_center.png";
var button_test_error = "https://awesometelenp.appspot.com/static/bitmap/button_err.png";

var tab_controls_src_selected = "//awesometelenp.appspot.com/static/bitmap/tab_controls.png";
var tab_controls_src_unselected = "//awesometelenp.appspot.com/static/bitmap/tab_controls_unselected.png";
var tab_text_src_selected = "//awesometelenp.appspot.com/static/bitmap/tab_setup.png";
var tab_text_src_unselected = "//awesometelenp.appspot.com/static/bitmap/tab_setup_unselected.png";


function tryLeftClick() {
	formJSONClick("left");
	if (!control_retransmit) changeHintText(choose_click); 
	if (timer_left == 0) timer_left = setInterval('formJSONClick("left")', 500);
}

function tryRightClick() {
	formJSONClick("right");
	if (!control_retransmit) changeHintText(choose_click); 
	if (timer_right == 0) timer_right = setInterval('formJSONClick("right")', 500);
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
	stream_num = 0;
	formJSONClick("stop");
	control_stopped = false;
	control_stopped_rx = false;
	changeAlertText();
	if (!control_retransmit) changeHintText(choose_click);
	changeButtonSrc(button_center_src_start); 
	formJSONError();
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
	if (timer_left != 0) {
		clearInterval(timer_left);
		left_left = 0;
	}
	if (timer_right != 0) {
		clearInterval(timer_right);
		timer_right = 0;
	}
}

function tryTurtlebotClick() {
	
	if (document.getElementById("setTurtlebot").checked && !control_connected_motors) { 
		control_retransmit = true;
		control_msgtype = 2;
		control_connected_motors = true;
		control_connected_rx = true;
		changeHintText(choose_turtlebot);
		changeAlertText();
		document.getElementById("messageTwist").checked = true;
		tryHidePadControls();
		tryShowMotorControls();
		formJSONError();
	}
	else if (control_connected_motors) {
		document.getElementById("setStream").checked = false;
		control_connected_motors = false;
		control_connected_rx = false;
		if (control_retransmit) formJSONError();
		control_retransmit = false;
		tryShowPadControls();
		tryShowMotorControls();
		changeAlertText();
	}
	//changeButtonSrc(button_test_error);
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

	if (document.getElementById("messageTwist").checked) control_msgtype = MSG_TWIST;	

	if (document.getElementById("messageStamped").checked) control_msgtype = MSG_RESERVED;	

	//console.log(control_msgtype);
	
	switch (control_msgtype) {
		case MSG_STRING:
		
			changeHintText(choose_output_string);
		break;
		
		case MSG_TWIST:
		
			changeHintText(choose_output_twist);
		break;
		
		case MSG_RESERVED:
		
			changeHintText(choose_output_reserved);
		break;
	}
}

function trySetupControls() {
    document.getElementById("setupControls").style.display="";
    document.getElementById("setupText").style.display="none";
    document.getElementById("alertText").style.display="";
    
    document.getElementById("tabControls").src= tab_controls_src_selected;
    document.getElementById("tabText").src= tab_text_src_unselected;
}

function trySetupText() {
    document.getElementById("setupControls").style.display="none";
    document.getElementById("setupText").style.display="";
    document.getElementById("alertText").style.display="none";
    
    document.getElementById("tabControls").src= tab_controls_src_unselected;
    document.getElementById("tabText").src= tab_text_src_selected;
}

function tryHidePadControls() {
    if (test_config) return;
    document.getElementById("padTable").style.display="none";
    document.getElementById("turtlebotTable").style.display="";
    document.getElementById("alertText").style.display="none";
}

function tryShowPadControls() {
    if (test_config) return;
    document.getElementById("padTable").style.display="";
    document.getElementById("turtlebotTable").style.display="";
    document.getElementById("alertText").style.display="";
}

function tryHideMotorControls() {
    document.getElementById("turtlebotTable").style.display="none";
    document.getElementById("alertText").style.display="";
}

function tryShowMotorControls() {
    document.getElementById("turtlebotTable").style.display="";
    document.getElementById("alertText").style.display="";
}

function changeHintText(text) {
	document.getElementById('setupText').innerHTML= "<br>" + text;
}

function changeAlertText() {
	var text;
	var connected;
	var stopped;
	var obstructed;
	
	if (control_connected_rx ) {
	    connected = "<b style='color:yellow;font-size:10pt'>" + "[connected]";
	    if (!control_retransmit) tryHideMotorControls();
	}
	else {
	    connected = "<b style='color:green;font-size:10pt'>" + "[free]";
	    tryShowMotorControls();
	}
	
	if (control_stopped_rx) { 
	    stopped = "<b style='color:red;font-size:10pt'>" + "[stopped]";
	    changeButtonSrc(button_center_src_error);
	}
	else {
	    stopped = "<b style='color:green;font-size:10pt'>" + "[running]";
	    changeButtonSrc(button_center_src_start);
	}
	if (control_obstructed) obstructed = "<b style='color:red;font-size:10pt'>" + "[blocked]";
	else obstructed = "<b style='color:green;font-size:10pt'>" + "[clear]";
	
	text =  connected + "</b> "  + stopped + "</b> " + obstructed + "</b> " ;
	document.getElementById('alertText').innerHTML= text;
}

function changeButtonPic(button_html) {
	document.getElementById('middleButtonHtml').innerHTML = button_html;
}

function changeButtonSrc(url) {
	document.getElementById('middleButtonSrc').src = url;
}

function formJSONClick(operation) {
	tx_operation = operation; 
	tx_number ++;
	tx_number = tx_number % mod_base;
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
	if (!control_retransmit ) return;
	var connect = control_connected_motors;
	var stopped = control_stopped;
	var kinect = control_obstructed;

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
	try {
		rx_error = gapi.hangout.data.getState()[tx_gapi_error];
		console.log(rx_error + " error msg");
	}
	catch (e) {
		console.log("error google hangouts api -- " + tx_gapi_error);
	}
	if (rx_error != undefined && rx_error != rx_error_old || true) {
		rx_error_obj = JSON.parse(rx_error);
		if (rx_error_obj.connected == true) control_connected_rx = true;
		else control_connected_rx = false;
		if (rx_error_obj.stopped == true) {
		    control_stopped_rx = true;
		    control_stopped = true;
		}
		else {
		    control_stopped_rx = false;
		    control_stopped = false;
		}
		if (rx_error_obj.kinect == true) control_obstructed = true;
		else control_obstructed = false;
		
		rx_error_old = rx_error;
	}
	changeAlertText();

	// direction data from hangouts...
	try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_key];
	    console.log(rx_data + " key msg");
	}
	catch (e){
	    console.log("error google hangouts api -- " );
	}
	stream_num ++;
	stream_num = (stream_num ) % mod_base;
	
	if (rx_data != rx_data_old || rx_obj.direction == "stop") { 
	
		rx_obj = JSON.parse(rx_data) ;	

		// change sequence numbers...
		
		if (rx_obj.direction == "stop" || rx_obj.number == 0 ) {
		    stream_num = 0;
		    control_stopped = false;
		    control_stopped_rx = false;
		}
        console.log("stream = " + stream_num);
		console.log( rx_obj.direction + " -- " + rx_obj.number);
		
		// handle stream setting here...
		if (!control_stream && control_retransmit && 
		        rx_obj.number != stream_num && rx_obj.number != 0) {
			control_stopped = true;
			changeButtonSrc(button_center_src_error);
			formJSONError(); // OK??
			console.log("exit -- bad seq num");
			rx_data_old = rx_data;
			return;
		}
		rx_data_old = rx_data;
		formJSONError();
		if(control_retransmit == true) retransmitEvent(rx_obj);
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
			if (last_key === "up" && last_counter < speed_max ) {
				last_counter ++ ;
				setSpeedTimer();
			} 
			else if (timer_key == 0) last_counter = 1;
			numLinear = 0.20; // 
		break;
		
		case "down":
			if (last_key === "down" && last_counter < speed_max ) {
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
			
  			var string = new ROSLIB.Message({ data: "hello " + data.direction });
			
			cmdVel.publish(string);
			
			console.log("no error? -- string");
			
		break;
		
		case MSG_TWIST:

			/* 
			turtlebot_bringup (?)
			roslaunch turtlebot_bringup minimal.launch
			always launch software first then connect turtlebot!!
			*/
  			
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
  				

			cmdVel2.publish(twist);

			console.log("no error? -- twist");

		break;
		
		case MSG_RESERVED:
			
  			var velocity = new ROSLIB.Message({
    			header : {
    			    seq : 0, //
    			    stamp : 0,
    			    frame_id : "0"
    			},
    			twist : {
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
  			    }
    			
  			});
  				

			cmdVel3.publish(velocity);

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

function setKinectListener() {
            console.log("kinect setup");
  			
  			//console.log("kinect no error. ");
  			
  			
  			try {
  			    kinect_listener.subscribe( function(message) {
                    console.log(  kinect_listener.name + " : " + message.data );
                    //kinect_listener.unsubscribe();
                } );
            }
            catch (e) {
                console.log ("no message " + e.message);
            }
            

}


    

// A function to be run at app initialization time which registers our callbacks
function init() {
	console.log('Init app.');

	var apiReady = function(eventObj) {
		if (eventObj.isApiReady) {
			console.log('API is ready v1.4');
	
			gapi.hangout.data.onStateChanged.add(function(eventObj) {
				recieveEvent();
			});
	        
			//console.log("websocket test");
			if ('WebSocket' in window){
    				// WebSocket is supported.
			
			} else {
    				// WebSockets are not supported.
				alert("no web sockets.");
			}
            /*
            ros = new ROSLIB.Ros({
    			url : 'ws://localhost:9090'
  			});
  			*/
            setKinectListener();
            
	
      			gapi.hangout.onApiReady.remove(apiReady);
    		}
	};

	// Use this special api ready state event
	gapi.hangout.onApiReady.add(apiReady);
}

gadgets.util.registerOnLoadHandler(init);

