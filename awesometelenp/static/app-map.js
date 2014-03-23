// app-map.js
var forbiddenCharacters = /[^a-zA-Z!0-9_\- ]/;
var test_map = "";
var app_name = "";
var app_msg = "";
var app_stopping = false;
var map_image ;
var map_overlay ;
var coord_x = 0;
var coord_y = 0;
var map_manager_started = false;
var map_nav_started = false;
var app_manager = true;

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
var map_service_all ;
var map_initialpose ;
var map_goal_pose ;
// listen to map topic.
var map_listener ;
var map_meta_data ;
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
var app_command_no_op = "app_no_op";
var map_command_nav_execute = "app_mapnav_execute";
var map_command_nav_start = "app_mapnav_start";
var map_command_nav_goal = "app_mapnav_goal";
var map_command_library_force = "map_library_force";
// constants for app names
var app_manager_teleop = "tele_presence/teleop";
var app_manager_mapping = "tele_presence/mapping";
var app_manager_navigate = "tele_presence/navigate";
// enum for planning map movement
var ENUM_BOT_START = "turtlebot_place_start";
var ENUM_BOT_END = "turtlebot_place_end";
var ENUM_BOT_NONE = "turtlebot_no_op";
var nav_map_setup = ENUM_BOT_NONE;
// enum for map service
var ENUM_LIST = 0;
var ENUM_SAVE = 1;
var ENUM_RENAME = 2;
var ENUM_DELETE = 3;
var ENUM_PUBLISH = 4;
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
var map_nav_resolution = 0.05;

var angle_count_start = 0; //
var angle_count_stop = 0;  //


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
    
    document.getElementById("wizOpLoadNavConfirm").style.display = "none";
    
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
    document.getElementById("wizOpView").style.display = "none";
    document.getElementById("wizOpList").style.display = "none";
    document.getElementById("wizOpNewConfirm").style.display = "none";

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
    document.getElementById('wizOpStartConfirmForce').style.display = "none";    
    //app_command_map_manager
    //sendMapCommandsShort(app_command_map_manager, 0, "", "", app_command_map_manager);
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

function disableNONE() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = '';//'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';    

}

function disableGMAP() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    //document.getElementById("opChoose").disabled = '';//'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';    

}

function disableAMCL() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = 'disabled';
    //document.getElementById("opChoose").disabled = '';//'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    document.getElementById("opList").disabled = '';    

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
	    
	            var start = new Array();
	            if ( ( app_command_map_nav_force != commands.command && 
	                    app_command_make_map != commands.command &&
	                    app_command_map_nav != commands.command &&
	                    app_command_app_stop != commands.command &&
	                    map_command_load != commands.command ) || 
	                    
	                    (app_name == app_manager_navigate && 
	                    map_command_load == commands.command)
	                    ) {
	                
                    parseCommands(commands);
                }
                else {
                        
                        var request = new ROSLIB.ServiceRequest({});
	                    app_service_stop.callService( request, function (result) {
	                        app_name = "stop";
	                        parseCommands(commands);
	                    } );
	                    
	                //} );
                }
                
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
	            
	        
	            var request = new ROSLIB.ServiceRequest({'op': ENUM_LIST});
	            map_service_all.callService( request, function (result) {
	            //map_service_list.callService(...
	                sendMapBroadcast(commands.wizard, result.map_list, 0);
	            });
	        break;
	        
	        case map_command_load : 
	            // must start nav automatically with load!
	            var start = app_manager_navigate;

                if (app_name == app_manager_navigate ) {
                    // if already navigate, do not relaunch...
                    var request = new ROSLIB.ServiceRequest({ 'op' : ENUM_PUBLISH, 
                        "map_id": commands.id});
                    map_service_all.callService( request, function (result) {
                        console.log(result);
                        sendMapBroadcast(commands.wizard, null, 0);
                    } );
                    return;
                }
                var request = new ROSLIB.ServiceRequest({'name': start});
	            app_service_start.callService( request, function (result) {
	                // nothing here... 
	                console.log("try " + start + " " + result.message);
	                
                    map_nav_started = true;
                    app_name = app_manager_navigate;
	                //} ); // inner block...
	                
	                /////////////////
	                setTimeout( function() { ///////REMOVE ME??
	                
	                    var request = new ROSLIB.ServiceRequest({ 'op' : ENUM_PUBLISH, 
	                        "map_id": commands.id});
	                    map_service_all.callService( request, function (result) {
	                        console.log(result);
	                        sendMapBroadcast(commands.wizard, null, 0);
	                    } );
	                
	                },10000);///////REMOVE ME??
	                
	            
	            });// closing block for navigate start...
	            
	        break;
	        
	        
	        case map_command_delete :
                var request = new ROSLIB.ServiceRequest({ 'op' : ENUM_DELETE ,
                    "map_id": commands.id});
	            map_service_all.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        
	        
	        break;
	        
	        case map_command_rename :
                var request = new ROSLIB.ServiceRequest({ 'op' : ENUM_RENAME , 
                    "map_id": commands.id, 
                    "name": commands.rename});
	            map_service_all.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	        
	        
	        break;
	        
	        case map_command_save :
	        
                
                var save_count = 0;
                /*
                map_meta_data.subscribe( function (result) {
	                map_meta_data.unsubscribe();
	                var resolution = result.resolution;
	                map_nav_resolution = resolution;
	                    
	                console.log("resolution should be: " + map_nav_resolution);
	                //FIND RESOLUTION, THEN SAVE MAP!!
                    
	            });//map saved with proper resolution (??)
	            */
	            
                var request = new ROSLIB.ServiceRequest({ 'op': ENUM_SAVE,
                    "name": commands.new_name});
	            map_service_all.callService( request, function (result) {
	                //sendMapBroadcast(commands.wizard, null, 0);
	                ;//
	                console.log("---map_name---  " + commands.new_name);
	            } );
	            
	            
	        break;
	        
	        case map_command_make :
                var request = new ROSLIB.ServiceRequest({"width": 100, "height":250});
	            map_service_new.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	                console.log('new map');
	            } );
	        break;

            case map_command_pic :
            
                var resolution;
                var width;
                var height;
                console.log("read map data...");
                map_listener.subscribe( function (result1) {
	                map_listener.unsubscribe();
	                resolution = result1.info.resolution;
	                width = result1.info.width;
	                height = result1.info.height;
	                console.log("find meta data... "+ width +"," + height);
	                map_nav_resolution = resolution;
	            //});
            
                    var request = new ROSLIB.ServiceRequest({
                        'width' : width,
                        'height' : height
                    });
	                map_service_pic.callService( request, function (result2) {
	                    //do all picture things here.
	                    /* remove some pic stuff here */
	                    sendMapInForm(result2.data);
	                    var list = new Array(JSON.stringify(result1.info));
	                    sendMapBroadcast(commands.wizard, list, 0);

	                    //console.log("meta data -- " + list[0]);
	                    
	                } );
	            
	            });
	        break;
            
            
            case app_command_make_map :
                // GMAPPING
                app_name = app_manager_mapping;
                
                var start = app_manager_mapping;
                
                var request = new ROSLIB.ServiceRequest({'name': start});
	            app_service_start.callService( request, function (result) {
	                // nothing here... 
	                console.log("try " + start + " " + result.message);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                
                
                
            break;
            
            case app_command_map_manager :
            break;
            
            case app_command_map_manager_force :
                
                var request = new ROSLIB.ServiceRequest({'op' : ENUM_LIST });
	            map_service_all.callService( request, function (result) {
	                
	                sendMapBroadcast(commands.wizard, result.map_list, 0);
	                var x = 0;
	                for (x = 0; x < result.map_list.length; x ++) {
	                    if (result.map_list[x].name == "" || 
	                            typeof result.map_list[x].name === 'undefined') {
	                        //delete map...
	                        var request = new ROSLIB.ServiceRequest({ 'op' : ENUM_DELETE ,
	                            "map_id": result.map_list[x].map_id });
	                        map_service_all.callService( request, function (result) {
                                console.log("delete map: " + x);
	                        } );
	                    }
	                }
	            });
	            
            break;
            
            case app_command_map_nav :
            case app_command_map_nav_force:
                
                var start = app_manager_navigate;
                app_name = app_manager_navigate;
                var request = new ROSLIB.ServiceRequest({'name': start});
	            app_service_start.callService( request, function (result) {
	                // nothing here... 
	                console.log("try " + start + " " + result.message);
	                sendMapBroadcast(commands.wizard, null, 0);
                    map_nav_started = true;
	            } );
                
                
                
            break;
            
            case app_command_app_stop :
            
                var start = app_manager_teleop;
                //"tele_presence/teleop";
                app_name = app_manager_teleop;
                var request = new ROSLIB.ServiceRequest({'name': start});
	            app_service_start.callService( request, function (result) {
	                // nothing here... START TELEOP ALWAYS...
	                console.log("try " + start + " " + result.message);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                
                
                
            break;
            
            case map_command_meta:
                /*
                
	            */
            break;
            
            case app_command_no_op :
                //NO OPERATION HERE
            break;
            
            case map_command_nav_execute :
            
                map_nav_pose_x = commands.x1;
                map_nav_pose_y = commands.y1;
                map_nav_pose_z = 0;
                map_nav_pose_a = commands.angle1;
                map_nav_goal_x = commands.x2;
                map_nav_goal_y = commands.y2;
                map_nav_goal_z = 0;
                map_nav_goal_a = commands.angle2;
            
                if (commands.x1 != commands.x2 ||
                    commands.y1 != commands.y2 || 
                    commands.angle1 != commands.angle2) {
                    
                    sendInitialPose(commands.x1, commands.y1, 0,  commands.angle1);
                    
                    sendGoalPose(commands.x2, commands.y2, 0, commands.angle2);
                    
                }
                
                sendMapBroadcast(commands.wizard, null, 0);
            break;
            
            case map_command_nav_start :
            
                map_nav_pose_x = commands.x1;
                map_nav_pose_y = commands.y1;
                map_nav_pose_z = 0;
                map_nav_pose_a = commands.angle1;
                
            
                sendInitialPose(commands.x1, commands.y1, 0,  commands.angle1);
                sendMapBroadcast(commands.wizard, null, 0);
            break;
            
            case map_command_nav_goal :
            
                
                map_nav_goal_x = commands.x2;
                map_nav_goal_y = commands.y2;
                map_nav_goal_z = 0;
                map_nav_goal_a = commands.angle2;

                sendGoalPose(commands.x2, commands.y2, 0, commands.angle2);
                sendMapBroadcast(commands.wizard, null, 0);
            break;
	    }
	}
	
	
    gapi.hangout.data.clearValue(tx_gapi_map_event);
    
}

function logArray(start) {
    var x = 0;
    var s = "";
    var l = start.length;
    for( x = 0; x < l; x ++) {
        s = s + start[x] + " ";
    }
    console.log(" array : " + s);
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
    	'name' : app_manager_prefix + 
    	rootname + '/list_map',
   		 serviceType : 'tele_presence/MapList'
  	});
  	
  	
  	map_service_load = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + rootname + 
    	//'/load_map_db',
    	'/load_map',
   		 serviceType : 'tele_presence/MapLoad'
  	});
  	
  	// service for new map
  	map_service_new = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix +  '/new_map',
   		 serviceType : 'tele_presence/CreateMap'
  	});
  	
  	map_service_pic = new ROSLIB.Service({
    	'ros' : ros,
    	'name' :app_manager_prefix +  '/picture_map',
   		 serviceType : 'tele_presence/PictureMap'
  	});
  	
  	//launch
  	map_service_start = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/basic_launch',
   		 serviceType : 'tele_presence/BasicLaunch'
  	});
  	
  	//stop
  	map_service_stop = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/basic_stop',
   		 serviceType : 'tele_presence/BasicStop'
  	});
  	
  	map_service_delete = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + rootname + '/delete_map',
   		 serviceType : 'tele_presence/MapDelete'
  	});
  	
  	map_service_rename = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + rootname + '/rename_map',
   		 serviceType : 'tele_presence/MapRename'
  	});
  	
  	map_service_save = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/save_map',
   		 serviceType : 'tele_presence/MapSave'
  	});
  	
  	map_service_all = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/map_all',
   		 serviceType : 'tele_presence/MapUniversal'
  	});
  	
  	map_listener = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/map',
   		 messageType : 'nav_msgs/OccupancyGrid'
   		 
  	});
  	
  	map_meta_data = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/map_metadata',
   		 messageType : 'nav_msgs/MapMetaData'
   		 
  	});
  	
  	/*
  	map_service_info = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/map_info',
   		 messageType : 'tele_presence/MapInfo'
  	});
  	*/
  	
  	map_initialpose = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/initialpose',
   		 messageType : 'geometry_msgs/PoseWithCovarianceStamped'
   		 
  	});
  	
  	/*
  	map_goal_pose = new ROSLIB.ActionClient({
  	    'ros': ros,
  	    'serverName' : app_manager_prefix + '/move_base/goal',
  	    'actionName' : 'move_base_msgs/MoveBaseAction'
  	});
  	*/
  	
  	// ROCON-APP-MANAGER SERVICES
  	app_topic_list = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/app_manager/app_list',
   		 messageType : 'rocon_app_manager_msgs/AppList'
  	});
  	
  	app_service_start = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/app_manager/start_app',
   		 serviceType : 'rocon_app_manager_msgs/StartApp'
  	});
  	
  	app_service_stop = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/app_manager/stop_app',
   		 serviceType : 'rocon_app_manager_msgs/StopApp'
  	});
  	
  	app_service_invite = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/app_manager/simple_invite',
   		 serviceType : 'rocon_app_manager_msgs/SimpleInvite'
  	});
}

function sendAppServiceTxt() {
    console.log("list to follow !!");
    //var request = new ROSLIB.ServiceRequest({});
	app_topic_list.subscribe( function (find) {
	    var x = 0;
	    var result = find.available_apps;
	    for(x = 0; x < result.length; x ++) {
	        console.log(result[x].name + " -- ");
	    }
	    console.log("runnning to follow !!");
	    var result = find.running_apps;
	    for(x = 0; x < result.length; x ++) {
	        console.log(result[x].name + " -- ");
	    }
	    app_topic_list.unsubscribe();
	} );
}

function inviteAndInit() {
    var start = app_manager_teleop;
    //"tele_presence_apps/teleop";
    var request = new ROSLIB.ServiceRequest({'name': start});
	app_service_start.callService( request, function (result) {
	    // nothing here... START TELEOP ALWAYS...
	} );
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



function sendMapBroadcast(type, list, num) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    var x;
    var map_list = "";
    if(type === map_command_meta || type === map_command_pic ) {
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
	            $('.listLength').html("Items: " + data.num);
	        break;
	        
	        case map_command_load :
	            document.getElementById("wizOpLoadConfirm").style.display = "block";
	            document.getElementById("wizOpLoadNavConfirm").style.display = "none";
	            app_msg = "NAVIGATE A MAP";
	            //opChooseOp();
	        break;
	        
	        case map_command_delete :
	            opDelete();
	            document.getElementById("wizOpDelConfirm").style.display = "block";
	        break;
	        
	        case map_command_list_load :
	            putListInSelectLocal(data.map_list, "selectSpaceLoad");
	            $('.listLength').html("Items: " + data.num);
	        break;
	        
	        case map_command_list_start:
	        
	        break;
	        
	        case map_command_list_delete :
	            putListInSelectLocal(data.map_list, "selectSpaceDelete");
	            $('.listLength').html("Items: " + data.num);
	        break;
	        
	        case map_command_list_rename :
	            putListInSelectLocal(data.map_list, "selectSpaceRename");
	        break;
	        
	        case map_command_rename :
	            document.getElementById("wizOpRenameConfirm").style.display = "block";
	        break;
            
            case map_command_save :
	            document.getElementById("wizOpSaveConfirm").style.display = "block";
	            app_msg = "MAPPING OPS";
	        break;
	        
	        case map_command_make :
	            document.getElementById("wizOpNewConfirm").style.display = "block";
	            app_msg = "TESTING OPS";
	        break;
	        
	        case app_command_make_map :
	            document.getElementById("wizOpNewConfirm").style.display = "block";
	            app_msg = "MAPPING OPS";
	            disableAMCL();
	        break;
	        

	        case app_command_map_manager_force :
	            document.getElementById("wizOpStartConfirmForce").style.display = "block";
	            disableNONE();
	        break;
	            
	        case app_command_map_manager :
	            document.getElementById("wizOpStartConfirm").style.display = "block";
	            disableNONE();
	        break;
	        
	        case app_command_app_stop :
	            document.getElementById("wizOpList").style.display = "none";
	            app_msg = "";
	            disableNONE();
	        break;
	        
	        case app_command_map_nav:
	            document.getElementById("wizOpLoadNavConfirm").style.display = "block";
	            app_msg = "NAVIGATE A MAP";
	            disableGMAP();
	        break;
	        
	        case map_command_pic :
	            sendMapInForm();
	            setOrigin(data.map_list[0].name);
	        break;
	        
	        case map_command_meta :
	            sendMapInForm();
	            setOrigin(data.map_list[0].name);
	        break;
	        
	        case map_command_nav_execute :
	            app_msg = "NAVIGATE A MAP";
	        break;
	        
	        case map_command_nav_start :
	        
	        break;
	        
	        case map_command_nav_goal :
	        
	        break;
	        
	        case map_command_library_force :
	            sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_load);
	        break;
	    }
	}
	try {
	    gapi.hangout.data.clearValue(tx_gapi_list);
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- " );
	}
	
	//print a status msg on screen:
	if (app_msg != "") $('#topstatus').html("[" + app_msg + "]");
	
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
    sendMapCommandsShort(app_command_map_manager_force, 0, "", "", app_command_map_manager_force);
}

function executeList() {
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list);
}

function executeRunNav() {
    document.getElementById('wizOpNavSettings').style.display = "block";
    opView();
    //opViewDisabled();
    disableGMAP();
}

function executeLibraryForce() {
    sendMapCommandsShort(app_command_map_manager_force, 0, "", "", map_command_library_force);
    
}

function executeRunNavForce() {
    
    sendMapCommandsShort(app_command_map_nav_force, 0, "", "", app_command_map_nav);
}

function executeNavStart() {
    var reply = confirm("NAV command! " + "\n\n" + 
        "start: " + map_nav_pose_x.toFixed(2) + "," + map_nav_pose_y.toFixed(2) + "\n" +
        "start angle: " + map_nav_pose_a.toFixed(2) + "\n" +
        
        "send??!!"
    );
    if (!reply) return;
    sendMapCommands(map_command_nav_start, 0, '', '', map_command_nav_start,
            map_nav_pose_x, map_nav_pose_y, map_nav_pose_a,
            0, 0, 0 );
}

function executeNavGoal() {
    var reply = confirm("NAV command! " + "\n\n" + 
        
        "stop: " + map_nav_goal_x.toFixed(2) + "," + map_nav_goal_y.toFixed(2) +"\n" +
        "stop angle: " + map_nav_goal_a.toFixed(2) + "\n" +
        "send??!!"
    );
    if (!reply) return;
    sendMapCommands(map_command_nav_goal, 0, '', '', map_command_nav_goal,
            0, 0, 0,
            map_nav_goal_x, map_nav_goal_y, map_nav_goal_a );
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
    map_nav_resolution = origin.resolution ; // 
    map_nav_origin_x = origin.origin.position.x; // magic number zero?
    map_nav_origin_y = origin.origin.position.y;
    //console.log(map_nav_resolution);
    alert("map info set at: \n\n" +
        "resolution: " + map_nav_resolution.toFixed(2) + "\n" +
        "origin xy: " + map_nav_origin_x.toFixed(2) + "," + map_nav_origin_y.toFixed(2) );
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
            //placeStartDot();
            map_nav_pose_x = coordinatesFromX( coord_x - 4);
            map_nav_pose_y = coordinatesFromY( coord_y - 4);
            placeStartDot();
        break;
        
        case ENUM_BOT_END :
            //placeEndDot();
            map_nav_goal_x = coordinatesFromX( coord_x - 4);
            map_nav_goal_y = coordinatesFromY( coord_y - 4);
            placeEndDot();
        break;
        
        case ENUM_BOT_NONE :
        
        break;
    }
}

function coordinatesFromX( some_x) {
    return (some_x * map_nav_resolution) + map_nav_origin_x ;
    //return (some_x  + map_nav_origin_x); // * map_nav_resolution;
}

function coordinatesFromY( some_y) {
    return (( $('#mapimg').height() - some_y) * map_nav_resolution) + map_nav_origin_y ;
    //return (( $('#mapimg').height() - some_y) + map_nav_origin_y ); //* map_nav_resolution;
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
    //clear vars and img div...
    $('.dot').remove();
    $('#startDot').remove();
    $('.enddot').remove();
    $('#endDot').remove();
    map_nav_pose_x = 0;
    map_nav_pose_y = 0;
    map_nav_pose_a = 0;
    map_nav_goal_x = 0;
    map_nav_goal_y = 0;
    map_nav_goal_a = 0;
    document.getElementById('angleStart').src = anglePng(0);
    document.getElementById('angleStop').src = anglePng(0);
    $('#xyStart').html('xy: ' + map_nav_pose_x.toFixed(2) + ',' + 
        map_nav_pose_y.toFixed(2));
    $('#xyStop').html('xy: ' + map_nav_goal_x.toFixed(2) 
        + ',' + map_nav_goal_y.toFixed(2));
    $('#angleStartDisplay').html(map_nav_pose_a.toFixed(2));
    $('#angleStopDisplay').html(map_nav_goal_a.toFixed(2));
    angle_count_start = 0;
    angle_count_stop = 0;
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
    var reply = confirm("NAV command! " + "\n\n" + 
        "start: " + map_nav_pose_x.toFixed(2) + "," + map_nav_pose_y.toFixed(2) + "\n" +
        "start angle: " + map_nav_pose_a.toFixed(2) + "\n" +
        "stop: " + map_nav_goal_x.toFixed(2) + "," + map_nav_goal_y.toFixed(2) +"\n" +
        "stop angle: " + map_nav_goal_a.toFixed(2) + "\n\n" +
        "originXY: " + map_nav_origin_x.toFixed(2) + "," + map_nav_origin_y.toFixed(2) + "\n" +
        "resolution: "+ map_nav_resolution.toFixed(2) + "\n" +
        "send??!!"
    );
    if (reply == true) {
        sendMapCommands(map_command_nav_execute, 0, '', '', map_command_nav_execute,
            map_nav_pose_x, map_nav_pose_y, map_nav_pose_a,
            map_nav_goal_x, map_nav_goal_y, map_nav_goal_a );
    }
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
        left: coord_x - 4,//($(dot).width() ) ,
        top: coord_y - 4  //($(dot).height() ) 
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
        left: coord_x - 4,// ($(enddot).width() ) ,
        top: coord_y  - 4 // ($(enddot).height() ) 
    }).show();
    
    
    $('#xyStop').html('xy: ' + map_nav_goal_x.toFixed(2) 
        + ',' + map_nav_goal_y.toFixed(2));
}

function sendInitialPose(x, y, z, a) {
    if (typeof x === 'undefined') x = map_nav_pose_x;
    if (typeof y === 'undefined') y = map_nav_pose_y;
    if (typeof z === 'undefined') z = map_nav_pose_z;
    if (typeof a === 'undefined') a = map_nav_pose_a;
    var initialpose = new ROSLIB.Message({
        header: {
            seq: 0,
            stamp: 0,
            frame_id: "map" //"base_link" // just rviz!!
            },
        pose: {
            pose : {
                position : {
                    x: x,
                    y: y,
                    z: z
                    },
                orientation: {
                    x: 0,
                    y: 0,//Math.sin( a / 2 ), // theta/2 ?
                    z: Math.sin( a / 2 ), // 0,
                    w: Math.cos( a / 2 )  // theta/2 ?
                    }
                },
            covariance : 
                [
                //float64[36]
                0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0
                ]
                
            
            }
    });
    
    map_initialpose.publish(initialpose);
    
}

function sendGoalPose(x,y,z,a) {
    if (typeof x === 'undefined') x = map_nav_goal_x;
    if (typeof y === 'undefined') y = map_nav_goal_y;
    if (typeof z === 'undefined') z = map_nav_goal_z;
    if (typeof a === 'undefined') a = map_nav_goal_a;
    
    console.log("goal -- x,y: " + x + "," + y + " angle: " + a);
    
    /*
    var goal = new ROSLIB.Goal({
        actionClient : map_goal_pose,
        goalMessage: 

        {
        
        //inner message data        
        
        //////////
            target_pose : {
        
                header : {
                    seq: 0,
                    stamp: 0,// {},
                    frame_id : "map"
                    },
                pose : {
                    position: {
                        x: x,
                        y: y,
                        z: z
                        },
                    orientation: {
                        x : 0,
                        y : 0,
                        z : Math.sin( a / 2 ),
                        w : Math.cos( a / 2 ),
                        }
                    }
                
        
            } // end of target_pose
            
            ////////////
        
        
       
        // inner message data ends...
            
        }

    });
    */
    //goal.send();
    
    var simplegoal = new ROSLIB.Message({
        
        header : {
            seq: 0,
            stamp: 0,// {},
            frame_id : "map"
            },
        pose : {
            position: {
                x: x,
                y: y,
                z: z
                },
            orientation: {
                x : 0,
                y : 0,
                z : Math.sin( a / 2 ),
                w : Math.cos( a / 2 ),
                }
            }
    });
    
    var goaltopic = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : app_manager_prefix + '/move_base_simple/goal',
   		 messageType : 'geometry_msgs/PoseStamped'
    });
    
    goaltopic.publish(simplegoal);
}
