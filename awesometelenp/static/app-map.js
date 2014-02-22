// app-map.js
var forbiddenCharacters = /[^a-zA-Z!0-9_\- ]/;
var test_map = "";
var app_name = "";
var map_image ;
var map_overlay ;
var coord_x = 0;
var coord_y = 0;
var map_manager_started = false;
var map_nav_started = false;

var tx_gapi_map_event = "telenp_map";
var tx_gapi_app_list = "telenp_app_list";
var map_service_list ;
var map_service_load ;
var map_service_new ;
var map_service_pic ;
var map_service_delete ;
var map_service_rename ;
var map_service_save ;
var map_service_start ;
var map_service_stop ;
var map_service_info ;
// listen to map topic.
var map_listener ;
// app stuff
var app_topic_list;
var app_service_status;
var app_service_start;
var app_service_stop;
var app_service_invite;

// commands for operations
var map_command_load = "load";
var map_command_make = "new";
var map_command_delete = "delete";
var map_command_rename = "rename";
var map_command_save = "save";
var map_command_list = "list";
var map_command_pic = "pic";
var map_command_meta = "mapmeta";
// more commands for lists that are needed in above ops.
var map_command_list_load = "embedded_list_for_load";
var map_command_list_delete = "embedded_list_for_delete";
var map_command_list_rename = "embedded_list_for_rename";
var map_command_list_start = "embedded_list_for_show_map";
var map_command_list_view = "embedded_list_for_view_map";
// comands for working with apps.
var app_command_list = "app_list";
var app_command_invite = "app_invite";
var app_command_make_map = "app_makemap";
var app_command_app_stop = "app_appstop";
var app_command_map_manager = "app_mapmanage";
var app_command_map_manager_force = "app_mapmanage_force";
var app_command_map_nav = "app_mapnav";
var app_command_map_nav_force = "app_mapnav_force";
// enum for planning map movement
var ENUM_BOT_START = "turtlebot_place_start";
var ENUM_BOT_END = "turtlebot_place_end";
var ENUM_BOT_NONE = "turtlebot_no_op";
var nav_map_setup = ENUM_BOT_NONE;
// pose and goal
var map_nav_pose_x = 0;
var map_nav_pose_y = 0;
var map_nav_pose_z = 0;
var map_nav_pose_a = 0;
var map_nav_goal_x = 0;
var map_nav_goal_y = 0;
var map_nav_goal_z = 0;
var map_nav_goal_a = 0;
// center of map
var map_nav_origin_x = 0; //these vars should be loaded when the map refreshes.
var map_nav_origin_y = 0;
var map_nav_origin_z = 0;
var map_nav_origin_ax = 0;
var map_nav_origin_ay = 0;
var map_nav_origin_az = 0;
var map_nav_resolution = 1;

var angle_count_start = 0; //note: angles currently increase in clockwise direction
var angle_count_stop = 0;  //note: angles currently increase in cloclwise direction


function opChooseOp() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "block";
    document.getElementById("wizOpView").style.display = "none";
    
    document.getElementById("wizOpList").style.display = "none";

}

function opChoose() {
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list);
}

function opChooseOpDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = '';
    document.getElementById("opStart").disabled = 'disabled';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
    
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpLoadConfirm").style.display = "none";
    
    //sendMapCommandsShort(app_command_map_nav, 0, "", "", app_command_map_nav);
    
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_load);
}

function opLoadDisabled() {

    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = '';
    document.getElementById("opStart").disabled = 'disabled';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
    
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpNewConfirm").style.display = "none";

}

function opMakeDisabled() {
    
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = 'disabled';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpDelConfirm").style.display = "none";
    
    

    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_delete);
}

function opDeleteDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpRenameConfirm").style.display = "none";
    document.getElementById("inputSpaceRename").value = "";
    


    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_rename);
}

function opRanameDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';
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
    document.getElementById("wizOpView").style.display = "none";    
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpSaveConfirm").style.display = "none";
    document.getElementById("inputSpaceSave").value = "";
    
    document.getElementById("wizOpSaveConfirm").style.display = "none";
    

}

function opSaveDisabled() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = 'disabled';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById('wizOpStartConfirm').style.display = "none";
    
    //app_command_map_manager
    sendMapCommandsShort(app_command_map_manager, 0, "", "", app_command_map_manager);
}

function opStartDisabled() {

    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';
}

function opView() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
    document.getElementById("wizOpView").style.display = "block";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById('wizOpViewConfirm').style.display = "none";
    

}

function opViewDisabled() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
}

function opList() {
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "none";
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "block";
    document.getElementById('wizOpViewConfirm').style.display = "none";
    

}

function opCancel() {
    //opChooseOp();
    document.getElementById("wizOpLoad").style.display = "none";
    document.getElementById("wizOpNew").style.display = "none";
    document.getElementById("wizOpDel").style.display = "none";
    document.getElementById("wizOpRename").style.display = "none";
    document.getElementById("wizOpSave").style.display = "none";
    document.getElementById("wizOpDone").style.display = "none";
    document.getElementById("wizOpStart").style.display = "none";
    document.getElementById("wizChooseOp").style.display = "block";
    document.getElementById("wizOpView").style.display = "none";
    
    document.getElementById("wizOpList").style.display = "none";
}

function stopService() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = '';//'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
    document.getElementById("opList").disabled = 'disabled';    

}

function receiveMapEvent() {
    ;//console.log("map");
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
	    
	            var start = new Array("roslaunch",
                    "tele_presence","manage_map.launch");
                if (map_manager_started || 
                    //commands.command == app_command_make_map ||
                    commands.command == map_command_make ||
                    commands.command == app_command_map_nav ||
                    commands.command == app_command_app_stop  ) start = new Array();
                
                var request = new ROSLIB.ServiceRequest({'remember':false,'command': start});
	            map_service_start.callService( request, function (result) {
	                //console.log("command launch -- map manager : " + result.result);

	                
	                //sendMapBroadcast(commands.wizard, null, 0);
	            } );
	    
                    //move these to inside fn above??
                    map_manager_started = true;
	                parseCommands(commands);
	    
	} 
	else {
	    console.log("google prob?? or just no data...");
	}// 
} //     
	    
function parseCommands(commands) {
    if (true) {
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
	        
	        
	        case map_command_delete :
                var request = new ROSLIB.ServiceRequest({ "map_id": commands.id});
	            map_service_delete.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        
	        
	        break;
	        
	        case map_command_rename :
                var request = new ROSLIB.ServiceRequest({ "map_id": commands.id, 
                    "new_name": commands.rename});
	            map_service_rename.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        
	        
	        break;
	        
	        case map_command_save :
	        
                app_name = "manager";
                
	            var start = new Array(
	                "roslaunch",
                    "map_store",
                    "add_map.launch", 
                    "map_file:=" + commands.new_name,
                    "map_resolution:=" + map_nav_resolution,
                    "map_name:=" + commands.new_name);

                
                var request = new ROSLIB.ServiceRequest({'remember':false,'command': start});
	            map_service_start.callService( request, function (result) {
	                console.log("command launch -- save map : " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	                	                
	            } );
	            
	            /*
                var request = new ROSLIB.ServiceRequest({ "map_name": commands.new_name});
	            map_service_save.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	                ;//
	            } );
	            */
	        break;
	        
	        case map_command_make :
                var request = new ROSLIB.ServiceRequest({"width": 100, "height":250});
	            map_service_new.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        break;

            case map_command_pic :
                var request = new ROSLIB.ServiceRequest({});
	            map_service_pic.callService( request, function (result) {
	                //do all picture things here.
	                /* remove some pic stuff here */
	                sendMapInForm(result.data);
	                sendMapBroadcast(commands.wizard, null, 0);
	                
	                //var request = new ROSLIB.ServiceRequest({});
	                map_listener.subscribe( function (result) {
	                    if (true) {
	                        var list = new Array(JSON.stringify(result.info));
	                        sendMapBroadcast(map_command_meta, list, 0);
	                    }
	                    map_listener.unsubscribe();
	                } );
	                
	            } );
	        break;
            
            
            case app_command_make_map :
                app_name = "gmap";
                var start = new Array("roslaunch",
                    "tele_presence","gmapping_demo.launch");
                
                var request = new ROSLIB.ServiceRequest({'remember':true,'command': start});
	            map_service_start.callService( request, function (result) {
	                console.log("command launch -- navigation: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	                	                
	            } );

                
            break;
            
            case app_command_map_manager :
            case app_command_map_manager_force :
                app_name = "manager";
                var start = new Array("roslaunch",
                    "tele_presence","manage_map.launch");
                
                if (map_manager_started && commands.wizard != app_command_map_manager_force) {
                    start = new Array();
                }
                
                var request = new ROSLIB.ServiceRequest({'remember':false,'command': start});
	            map_service_start.callService( request, function (result) {
	                console.log("command launch -- map manager : " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	                map_manager_started = true;
	            } );
	            
	            
            break;
            
            case app_command_map_nav :
            case app_command_map_nav_force:
                
                var start = new Array("roslaunch",
                    "tele_presence","amcl_demo.launch");
                if (map_nav_started && commands.wizard != app_command_map_nav_force) {
                    //start = new Array();
                    //app_name = "";
                }
                app_name = "navigate";
                var request = new ROSLIB.ServiceRequest({'remember':true,'command': start});
	            map_service_start.callService( request, function (result) {
	                console.log("comand launch -- navigation: -- " );
	                sendMapBroadcast(commands.wizard, null, 0);
                    map_nav_started = true;
	            } );
	            
                
            break;
            
            case app_command_app_stop :
                if (app_name == "gmap") {
                    var start = new Array("slam_gmapping");
                }
                if (app_name == "manager") {
                    var start = new Array('map_server');//'map_manager');//,'map_store', 'map_server');
                    
                }
                if (app_name == "navigate") {
                    var start = new Array();//("amcl");
                }
                //var start = new Array('slam_gmapping', 'amcl');//always!!
                
                var request = new ROSLIB.ServiceRequest({'command': start});
	            map_service_stop.callService( request, function (result) {
	                console.log("command stop: " + app_name + " " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                
                
            break;
            
            case map_command_meta:
                /*
                var request = new ROSLIB.ServiceRequest({});
	            map_service_info.callService( request, function (result) {
	                if (result.loaded) {
	                    var list = new Array(JSON.stringify(result.info));
	                }
	                sendMapBroadcast(commands.wizard, list, 0);
	            } );
	            */
            break;
	    }
	}
    gapi.hangout.data.clearValue(tx_gapi_map_event);
    
}

function sendMapInForm(data) {
    if (typeof data === "undefined") data = "--";
    $.ajax({
        url: "//awesometelenp.appspot.com/",
        type: "POST" ,
        dataType: 'json',
        data: {
            'map': data},
        success: function( ret ) {
            //
            //var mapspace = $('#showMapSpaceView');
            var mapspace = $('#showMapSpaceDiv');
            mapspace.html('<img id="mapimg" src="' + ret.picurl + '">');
            
            mapspace.ready(showToolTip);
            mapspace.click(takePosition);
            
        }
    });
    
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
                    'new_name' : name1,
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
		;//console.log("hangout setValue error. -- Error");
	}
	;//console.log("map event short" + makeText);
}

function setMapServices( rootname ) {
    if (typeof rootname === "undefined") rootname = "";

  	
  	map_service_list = new ROSLIB.Service({
    	'ros' : ros,
    	'name' :  rootname + '/list_maps',
   		 messageType : 'map_store/ListMaps'
  	});
  	
  	
  	map_service_load = new ROSLIB.Service({
    	'ros' : ros,
    	'name' :  rootname + '/publish_map',
   		 messageType : 'map_store/PublishMap'
  	});
  	
  	// service for new map
  	map_service_new = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/new_map',
   		 messageType : 'tele_presence/CreateMap'
  	});
  	
  	map_service_pic = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/picture_map',
   		 messageType : 'tele_presence/PictureMap'
  	});
  	
  	//launch
  	map_service_start = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/basic_launch',
   		 messageType : 'tele_presence/BasicLaunch'
  	});
  	
  	//stop
  	map_service_stop = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/basic_stop',
   		 messageType : 'tele_presence/BasicStop'
  	});
  	
  	map_service_delete = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : rootname + '/delete_map',
   		 messageType : 'map_store/DeleteMap'
  	});
  	
  	map_service_rename = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : rootname + '/rename_map',
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
  	
  	map_service_info = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/map_info',
   		 messageType : 'tele_presence/MapInfo'
  	});
}

function putListInSelectLocal(list, space) {
    var string = "";
    var x;
    for(x =0; x < list.length; x ++ ) { 
        string = string + '<option value="' + list[x].map_id;
        var num = x + 1;
        string = string + '">' + num + '. ' + list[x].name  ;
        if (list[x].name == "") string = string + "[unnamed]";
        string = string + "</option>";
        
    }
    ;//console.log(string);
    document.getElementById(space).innerHTML = string;
}

function putListInBoxLocal(list, space) {
    var string = "";
    var x;
    for(x =0; x < list.length; x ++ ) { 
        var num = x + 1;
        string = string + num + ". " ;
        string = string + list[x].name;
        if (list[x].name == "") string = string + "[unnamed]";
        string = string + "<br>";
        //console.log("list -" + list[x].name + "- " + list[x].map_id);
    }

    document.getElementById(space).innerHTML = string;
}

/*
function fillAppSpace(list, space) {
    var string = "";
    var x;
    for(x =0; x < list.list.length; x ++ ) { 
        var num = x + 1;
        string = string + num + ". " ;
        string = string + list.list[x].name;
        if (list.list[x].name == "") string = string + "[unnamed]";
        string = string + "<br>";
        ;//console.log("list apps-" + list.list[x].name );
    }

    document.getElementById(space).innerHTML = string;
}
*/

function sendMapBroadcast(type, list, num) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    var x;
    var map_list = "";
    if(type === map_command_meta ) {
        map_list = JSON.stringify ({ 
                            'name' : list[0] ,
                            'session_id' : '' ,
                            'date' : '' , 
                            'map_id' : ''
        });
    }
    else if (list == null || typeof list === "undefined") {
        map_list = JSON.stringify ({ 
                            'name' : '' ,
                            'session_id' : '' ,
                            'date' : '' , 
                            'map_id' : ''
        });
    }
    else if (list != null) {
        newlength = list.length;
        if (list.length > 20) newlength = 20;
        for (x = 0; x < newlength; x ++) {
            var map_name = list[x].name;
            if (list.length != newlength && x == newlength - 1) {
                map_name = '[' +( list.length - newlength )+ ' more in list...]';
            }
            var element = { 'name' : map_name, //list[x].name ,
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
    ;//console.log (listText);
    try {
		gapi.hangout.data.setValue( tx_gapi_list, listText);
	}
	catch (e) {
		;//console.log("hangout setValue error. -- Error");
	}
	;//console.log("map event " + listText);
}

/*
function sendAppListBroadcast(wizard, list) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    var newlist = '{"wizard":"' + wizard + '","list":[';
    var x;
    
    for (x = 0; x < list.length; x ++) {
        var element = {'name' : list[x] };
        newlist = newlist + JSON.stringify(element) ;
        if (x < list.length - 1) newlist += ",";
    }
    newlist += "]}";
    try {
		gapi.hangout.data.setValue( tx_gapi_app_list, newlist);
	}
	catch (e) {
		;//console.log("hangout setValue error. -- Error with map pic");
	}
}
*/

function receiveMapBroadcast() {
    if (! isMatchingName(tx_gapi_controller_name)  ) return;
    try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_list];
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- " );
	}
	;//console.log(rx_data + " list msg");
	
	if (typeof rx_data !== "undefined") {
	    // do something...
	    data = JSON.parse(rx_data);
	    switch(data.type) {
	        case map_command_list :
	            putListInBoxLocal(data.map_list, "listSpace");
	            $('.listLength').html("Num of Items: " + data.num);
	        break;
	        
	        case map_command_load :
	            document.getElementById("wizOpLoadConfirm").style.display = "block";
	            //opChooseOp();
	        break;
	        
	        case map_command_delete :
	            opDelete();
	            document.getElementById("wizOpDelConfirm").style.display = "block";
	        break;
	        
	        case map_command_list_load :
	            putListInSelectLocal(data.map_list, "selectSpaceLoad");
	            $('.listLength').html("Num of Items: " + data.num);
	        break;
	        
	        case map_command_list_start:
	        
	        break;
	        
	        case map_command_list_delete :
	            putListInSelectLocal(data.map_list, "selectSpaceDelete");
	            $('.listLength').html("Num of Items: " + data.num);
	        break;
	        
	        case map_command_list_rename :
	            putListInSelectLocal(data.map_list, "selectSpaceRename");
	        break;
	        
	        case map_command_rename :
	            document.getElementById("wizOpRenameConfirm").style.display = "block";
	        break;
            
            case map_command_save :
	            document.getElementById("wizOpSaveConfirm").style.display = "block";
	        break;
	        
	        case map_command_make :
	            document.getElementById("wizOpNewConfirm").style.display = "block";
	        break;
	        
	        case app_command_make_map :
	            document.getElementById("wizOpNewConfirm").style.display = "block";
	            opMakeDisabled();
	        break;
	        
	        case app_command_map_manager :
	        case app_command_map_manager_force :
	            document.getElementById("wizOpStartConfirm").style.display = "block";
	            opStartDisabled();
	        break;
	        
	        case app_command_app_stop :
	            document.getElementById("wizOpList").style.display = "none";
	            stopService();
	        break;
	        
	        case app_command_map_nav:
	            opLoadDisabled();
	        break;
	        
	        case map_command_pic :
	            sendMapInForm();
	        break;
	        
	        case map_command_meta :
	            //console.log(data.map_list[0].name);
	            setOrigin(data.map_list[0].name);
	        break;
	    }
	}
	try {
	    gapi.hangout.data.clearValue(tx_gapi_list);
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- " );
	}
}

function fixText(text) {
    return text.replace(forbiddenCharacters, '');
}

function executeLoad() {
    var map_id = document.getElementById("selectSpaceLoad").value;
    sendMapCommandsShort(map_command_load, map_id, "", "", map_command_load);
}

function executeDelete() {
    var map_id = document.getElementById("selectSpaceDelete").value;
    sendMapCommandsShort(map_command_delete, map_id, "", "", map_command_delete);
}

function executeRename() {
    var map_id = document.getElementById("selectSpaceRename").value;
    var new_name = fixText(document.getElementById("inputSpaceRename").value);
    //check for bad 'new_name' string (no quotes, etc.)
    sendMapCommandsShort(map_command_rename, map_id, "",new_name, map_command_rename);
}

function executeSave() {
    var new_name = fixText(document.getElementById("inputSpaceSave").value);
    //check for bad 'new_name' string (no quotes, etc.)
    sendMapCommandsShort(map_command_save, 0, new_name, "", map_command_save);
    ;//console.log("save name " + new_name);
}

function executeNew() {
    sendMapCommandsShort(map_command_make, 0, "", "", map_command_make);
}

function executeListApps() {
    sendMapCommandsShort(app_command_list, 0, "", "", app_command_list);
}

function executeMakeMapAndroid() {
    sendMapCommandsShort(app_command_make_map, 0, "", "", app_command_make_map);
}

function executeMapStart() {
    sendMapCommandsShort(app_command_map_manager, 0, "", "", app_command_map_manager_force);
}

function executeList() {
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list);
}

function executeRunNav() {
    document.getElementById('wizOpNavSettings').style.display = "block";
    opView();
    opViewDisabled();
    
}

function executeRunNavForce() {
    
    sendMapCommandsShort(app_command_map_nav_force, 0, "", "", app_command_map_nav);
}

function opStopService() {
    sendMapCommandsShort(app_command_app_stop, 0, "", "", app_command_app_stop);
}

function getMapTopic() {
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
        ! isMatchingName(tx_gapi_controller_name) ) return;
    sendMapCommandsShort(map_command_list_start, 0, "", "", map_command_list_start);
    return;

}

function getMapTopicView() {
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
        ! isMatchingName(tx_gapi_controller_name) ) return;
    sendMapCommandsShort(map_command_pic, 0, "", "", map_command_pic);
    // get map meta data here??
    
    return;
}

function setOrigin(data) {
    //console.log(data);
    var origin = JSON.parse(data);
    map_nav_resolution = origin.resolution;
    map_nav_origin_x = origin.origin.position.x;
    map_nav_origin_y = origin.origin.position.y;
    alert("map info set at: \n\n" +
        "resolution: " + map_nav_resolution + "\n" +
        "origin xy: " + map_nav_origin_x + "," + map_nav_origin_y);
}

/* start code for placing robot on map... */
function showToolTip() {
    var tooltip = $( '<div id="tooltip">' ).appendTo( 'body' )[0];
    $(tooltip).hide();
    
    $( '#mapimg' ).each(function () {
        var pos = $( this ).position(),
            top = pos.top,
            left = pos.left,
            width = $( this ).width(),
            height = $( this ).height(); 
        $( this ).
            mousemove(function ( e ) {
                var top_y = $('#showMapSpaceView').position().top;
                var scroll_x = $('#showMapSpaceView')[0].scrollLeft;
                var scroll_y = $('#showMapSpaceView')[0].scrollTop;
                var x = e.pageX - left,
                    y = e.pageY - top;
                    //console.log(x + " -- " + y);
                coord_x = (x + scroll_x) ;// 
                coord_y = (y + scroll_y) - top_y ; // 
                    
                $( tooltip ).html( 'position xy = '
                        + ( coord_x ) + ' -- ' +( coord_y ) + '<br/>' + 
                        "mode: " + nav_map_setup ).css({
                    left: e.clientX + 10,
                    top: e.clientY + 10
                }).show();
                
            }).
            mouseleave(function () {
                $( tooltip ).hide();
            }); 
    
    });
};

function takePosition() {
    //first check if you are either controller or turtlebot...
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
        ! isMatchingName(tx_gapi_controller_name) ) return;
    console.log(nav_map_setup);
    switch (nav_map_setup) {
        case ENUM_BOT_START :
            map_nav_pose_x = coordinatesFromX( coord_x);
            map_nav_pose_y = coordinatesFromY( coord_y);
            placeStartDot();
        break;
        
        case ENUM_BOT_END :
            map_nav_goal_x = coordinatesFromX( coord_x);
            map_nav_goal_y = coordinatesFromY( coord_y);
            placeEndDot();
        break;
        
        case ENUM_BOT_NONE :
        
        break;
    }
}

function coordinatesFromX( some_x) {
    return (some_x * map_nav_resolution) - map_nav_origin_x ;
}

function coordinatesFromY( some_y) {
    return (( $('#mapimg').height() - some_y) * map_nav_resolution) - map_nav_origin_y ;
}

function takeAngle() {
    //first check if you are either controller or turtlebot...
    if (! isMatchingName(tx_gapi_turtlebot_name) && 
        ! isMatchingName(tx_gapi_controller_name) ) return;
        
    switch (nav_map_setup) {
        case ENUM_BOT_START :
        break;
        
        case ENUM_BOT_END :
        break;
        
        case ENUM_BOT_NONE :
        break;
    }
}

function chooseStart() {
    nav_map_setup = ENUM_BOT_START;
}

function chooseStop() {
    nav_map_setup = ENUM_BOT_END;
}

function chooseClear() {
    nav_map_setup = ENUM_BOT_NONE;
}

function anglePng(angle) {
    var num = '' ;
    num = '000' + angle;
    var offset = 0;
    if (num.length > 3) offset = 1;
    var nums = num[ num.length - 3] + num[ num.length - 2 ] + num[num.length - 1] ;
    
    return "//awesometelenp.appspot.com/static/bitmap/angle" + nums + ".png"
}

function makeangleStart() {
    angle_count_start += 30;
    angle_count_start = angle_count_start % 360;
    map_nav_pose_a = angle_count_start * (Math.PI /180);
    document.getElementById('angleStart').src = anglePng(angle_count_start);
    $('#angleStartDisplay').html(map_nav_pose_a.toFixed(2));
}

function makeangleStop() {
    angle_count_stop += 30;
    angle_count_stop = angle_count_stop % 360;
    map_nav_goal_a = angle_count_stop * (Math.PI/180);
    document.getElementById('angleStop').src = anglePng(angle_count_stop);
    $('#angleStopDisplay').html(map_nav_goal_a.toFixed(2));
}

function chooseAccept() {

    //check for sanity...
    alert("NAV command! " + "\n\n" + 
        "start: " + map_nav_pose_x + "," + map_nav_pose_y + "\n" +
        "start angle: " + map_nav_pose_a + "\n" +
        "stop: " + map_nav_goal_x + "," + map_nav_goal_y +"\n" +
        "stop angle: " + map_nav_goal_a + "\n" +
        "sent!!"
    );
}

function placeStartDot() {
    
    $('.dot').remove();
    $('#startDot').remove();
    var dot = $( '<img id="startDot" ' +
            ' src="//awesometelenp.appspot.com/static/bitmap/pix_blue.png" ' +
            ' class="dot">' ).
        appendTo( '#showMapSpaceDiv' )[0];

        
    //var pos = $('#showMapSpaceView').position();
    $( dot ).css({
        padding: 0 ,
        margin: 0,
        border: 0, 
        left: coord_x - ($(dot).width() ) ,
        top: coord_y - ($(dot).height() )
    }).show();
    
    $('#xyStart').html('xy: ' + map_nav_pose_x.toFixed(2) + ',' + 
        map_nav_pose_y.toFixed(2));
}

function placeEndDot() {
    
    $('.enddot').remove();
    $('#endDot').remove();
    var enddot = $( '<img id="endDot" ' +
            ' src="//awesometelenp.appspot.com/static/bitmap/pix_red.png" ' +
            ' class="enddot">' ).
        appendTo( '#showMapSpaceDiv' )[0];

        
    //var pos = $('#showMapSpaceView').position();
    $( enddot ).css({
        padding: 0 ,
        margin: 0,
        border: 0, 
        left: coord_x - ($(enddot).width() ) ,
        top: coord_y  - ($(enddot).height() )
    }).show();
    
    $('#xyStop').html('xy: ' + map_nav_goal_x.toFixed(2) 
        + ',' + map_nav_goal_y.toFixed(2));
}
