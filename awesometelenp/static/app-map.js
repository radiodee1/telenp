// app-map.js
var test_map = "";

var tx_gapi_map_event = "telenp_map";
var tx_gapi_map_raw = "telenp_map_raw";
var map_service_list ;
var map_service_load ;
var map_service_new ;
var map_service_delete ;
var map_service_rename ;
var map_service_save ;
// listen to map topic.
var map_listener ;

// commands for operations
var map_command_load = "load";
var map_command_make = "new";
var map_command_delete = "delete";
var map_command_rename = "rename";
var map_command_save = "save";
var map_command_list = "list";
// more commands for lists that are needed in above ops.
var map_command_list_load = "embedded_list_for_load";
var map_command_list_delete = "embedded_list_for_delete";
var map_command_list_rename = "embedded_list_for_rename";
var map_command_list_start = "embedded_list_for_show_map";


function opChooseOp() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "block";
    
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list);
}

function opLoad() {
    document.getElementById("wizOpLoad").style.display = "block";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
    
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_load);
}

function opMake() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "block";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opDelete() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "block";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opRename() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "block";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opSave() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "block";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opStart() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "block";
    document.getElementById("wizChooseOp").style.display = "none";
}

function opCancel() {
    opChooseOp();
}

function receiveMapEvent() {
    console.log("map");
    if (! isMatchingName(tx_gapi_turtlebot_name)) return;
    var rx_map_commands ;
    try {
	    rx_map_commands = gapi.hangout.data.getState()[tx_gapi_map_event];
	    
	}
	catch (e){
	    console.log("error google hangouts api -- map" );
	}
	if (typeof rx_map_commands !== "undefined") {
	    var commands = JSON.parse(rx_map_commands);
	    //do something... round-trip the 'wizard' operand
	    switch( commands.command ) {
	        case map_command_list : 
	            var request = new ROSLIB.ServiceRequest({});
	            map_service_list.callService( request, function (result) {
	                
	                sendMapBroadcast(commands.wizard, result.map_list, 0);
	            });
	        break;
	        
	        case map_command_load : 
	            var request = new ROSLIB.ServiceRequest({ "map_id": commands.id});
	            map_service_load.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        break;
	        
	        case map_command_list_start :
	            var list;
                try {
                    map_listener.subscribe( function(message) {
                        list = message.data;
                        
                        sendMapPicBroadcast(message);
                        map_listener.unsubscribe();
                    });
                }
                catch (e) {
                    console.log("map listener fail");
                }
                
	        break;
	        
	    }
	}
    gapi.hangout.data.clearValue(tx_gapi_map_event);
    
}

function sendMapCommandsShort( command, id, name1, name2, wizard) {
    sendMapCommands(command, id, name1, name2, wizard, 0,0,0, 0,0,0);
}

function sendMapCommands( command, id,  name1, name2, wizard , 
        xx1, yy1, angle1, xx2, yy2, angle2) {
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
            ! isMatchingName(tx_gapi_controller_name) ) return;
    var send = {
                    'command' : command,
                    'id' : id,
                    'name' : name1,
                    'rename' : name2,
                    'wizard' : wizard,
                    //extra ops
                    "x1" : xx1,
                    "y1" : yy1,
                    "angle1" : angle1,
                    "x2" : xx2,
                    "y2" : yy2,
                    "angle2" : angle2 };
                    
                    
    var makeText = JSON.stringify (send);
    
    try {
		gapi.hangout.data.setValue( tx_gapi_map_event, makeText);
	}
	catch (e) {
		console.log("hangout setValue error. -- Error");
	}
	console.log("map event " + makeText);
}

function setMapServices() {
    map_service_list = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/list_maps',
   		 messageType : 'map_store/ListMaps'
  	});
  	
  	map_service_load = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/publish_map',
   		 messageType : 'map_store/PublishMap'
  	});
  	
  	//no service for new map
  	map_service_new = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/create_map',
   		 messageType : 'map_store/'
  	});
  	
  	map_service_delete = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/delete_map',
   		 messageType : 'map_store/DeleteMap'
  	});
  	
  	map_service_rename = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/rename_map',
   		 messageType : 'map_store/RenameMap'
  	});
  	
  	map_service_save = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/save_map',
   		 messageType : 'map_store/SaveMap'
  	});
  	
  	map_listener = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/map',
   		 messageType : 'nav_msgs/OccupancyGrid'
   		 
  	});
}

function putListInSelectLocal(list, space) {
    var string = "";
    var x;
    for(x =0; x < list.length; x ++ ) { 
        string = string + '<option value="' + list[x].map_id;
        string = string + '">' + list[x].name  ;
        if (list[x].name == "") string = string + "[unnamed]";
        string = string + "</option>";
        
    }
    console.log(string);
    document.getElementById(space).innerHTML = string;
}

function putListInBoxLocal(list, space) {
    var string = "";
    var x;
    for(x =0; x < list.length; x ++ ) { 
        string = string + x + ". " ;
        string = string + list[x].name;
        if (list[x].name == "") string = string + "[unnamed]";
        string = string + "<br>";
        console.log("list -" + list[x].name + "- " + list[x].map_id);
    }

    document.getElementById(space).innerHTML = string;
}

function sendMapBroadcast(type, list, num) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    var x;
    var map_list = "";
    if (list == null || typeof list === "undefined") {
        map_list = JSON.stringify ({ 
                            'name' : '' ,
                            'session_id' : '' ,
                            'date' : '' , 
                            'map_id' : ''
        });
    }
    else if (list != null) {
        for (x = 0; x < list.length; x ++) {
            var element = { 'name' : list[x].name ,
                            'session_id' : list[x].session_id ,
                            'date' : list[x].date , 
                            'map_id' : list[x].map_id };
            if (x != 0) map_list = map_list + ","; 
            map_list = map_list +  JSON.stringify(element);
        }
    }
    if (num == 0 && list != null && typeof list !== "undefined") num = list.length;
    
    map_list = "[" + map_list + "]";
    var listText = '{"type":"'+type+'","map_list":'+ map_list + ', "num":'+num + '}';
    console.log (listText);
    try {
		gapi.hangout.data.setValue( tx_gapi_list, listText);
	}
	catch (e) {
		console.log("hangout setValue error. -- Error");
	}
	console.log("map event " + listText);
}

function sendMapPicBroadcast(map_in) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    if (typeof map_in === "undefined") {
        console.log("map_in is undefined...-----------------------");
        return;
    }
    var x,y;
    var width = map_in.info.width;
    var height = map_in.info.height;
    var map = '{"width":"' + width + '","height":"' + height + '","map": [';
    for (y = 0; y < height; y ++) {
        for (x = 0; x < width; x ++) {
            var element = { "d" : map_in.data[(y * width) + x] };

            map = map + JSON.stringify(element);
            if  (x == width - 1 && y == height - 1) {
                //don't add comma
            }
            else map = map + ',' ;
        }
    }
    map = map + ']}';
    try {
		gapi.hangout.data.setValue( tx_gapi_map_raw, map);
	}
	catch (e) {
		console.log("hangout setValue error. -- Error with map pic");
	}
	console.log(map);
}

function receiveMapBroadcast() {
    if (! isMatchingName(tx_gapi_controller_name)  ) return;
    try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_list];
	    
	}
	catch (e){
	    console.log("error google hangouts api -- " );
	}
	console.log(rx_data + " list msg");
	
	if (typeof rx_data !== "undefined") {
	    // do something...
	    data = JSON.parse(rx_data);
	    switch(data.type) {
	        case map_command_list :
	            putListInBoxLocal(data.map_list, "listSpace");
	        break;
	        
	        case map_command_load :
	            //do nothing
	            //opChooseOp();
	        break;
	        
	        case map_command_list_load :
	            putListInSelectLocal(data.map_list, "selectSpaceLoad");
	        break;
	        
	        case map_command_list_start:
	        
	        break;
	    }
	}
	try {
	    gapi.hangout.data.clearValue(tx_gapi_list);
	    
	}
	catch (e){
	    console.log("error google hangouts api -- " );
	}
}

function receiveRawMapBroadcast() {
    if (! isMatchingName(tx_gapi_controller_name) && 
        ! isMatchingName(tx_gapi_turtlebot_name) ) return;
    try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_map_raw];
	    
	}
	catch (e){
	    console.log("error google hangouts api -- " );
	}
	
	//console.log("raw map broadcast!! ---------------------");
	if (typeof rx_data !== "undefined") {
	    var list = JSON.parse(rx_data);
	    //console.log("data received " + list);
	    fillMapSpace('showMapSpace', list);
	}
}

function executeLoad() {
    var map_id = document.getElementById("selectSpaceLoad").value;
    sendMapCommandsShort(map_command_load, map_id, "", "", map_command_load);
}

function fillMapSpace(space, list) {
    
    var string = '<div border="0" id="mapSpaceTable"' ;
    string = string + ' style="display:block; min-height:3px;min-width:3px">';
    var x, y;
    var height = list.height;
    var width = list.width;
    for (y = 0; y < height; y ++) {
        string = string + '<div style="display:block">';//
        for(x =0; x < width; x ++ ) { 
            string = string + '<div style="display:inline; min-height:3px; height:8px">';
            if (list.map[(y * height) + x].d > 5) {
                string = string + '<img src="//awesometelenp.appspot.com/static/bitmap/pix_light.png" ' ;
            }
            else {
                string = string + '<img src="//awesometelenp.appspot.com/static/bitmap/pix_dark.png" ' ;
            }
            string = string + 'onclick="xy('+ x + ","+ y +')">';
            string = string + "</div>";
        }
        string = string + "</div>";
    }
    string = string + "</div>";
    console.log(string);
    document.getElementById(space).innerHTML = string;
}

function getMapTopic() {
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
        ! isMatchingName(tx_gapi_controller_name) ) return;
    sendMapCommandsShort(map_command_list_start, 0, "", "", map_command_list_start);
    return;

}

function xy(x,y) {

}
