// app-map.js
var test_map = "";
var app_name = "";
var map_image ;
var map_overlay ;

var tx_gapi_map_event = "telenp_map";
var tx_gapi_map_raw = "telenp_map_raw";
var tx_gapi_app_list = "telenp_app_list";
var map_service_list ;
var map_service_load ;
var map_service_new ;
var map_service_pic ;
var map_service_delete ;
var map_service_rename ;
var map_service_save ;
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
var app_command_map_nav = "app_mapnav";

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
    


    //sendMapCommandsShort(app_command_invite, 0, "", "", app_command_invite);
}

function opChoose() {
    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list);
}

function opChooseOpDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    document.getElementById("opChoose").disabled = '';
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
    
    document.getElementById("wizOpLoadConfirm").style.display = "none";
    
    sendMapCommandsShort(app_command_map_nav, 0, "", "", app_command_map_nav);
    
    //sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_load);
}

function opLoadDisabled() {

    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    document.getElementById("opChoose").disabled = '';
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
        
    document.getElementById("wizOpNewConfirm").style.display = "none";

}

function opMakeDisabled() {
    
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = 'disabled';
    document.getElementById("opChoose").disabled = 'disabled';
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
        
    document.getElementById("wizOpDelConfirm").style.display = "none";
    
    

    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_delete);
}

function opDeleteDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    
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
        
    document.getElementById("wizOpRenameConfirm").style.display = "none";
    document.getElementById("inputSpaceRename").value = "";
    


    sendMapCommandsShort(map_command_list, 0, "", "", map_command_list_rename);
}

function opRanameDisabled() {
    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
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
    
    document.getElementById("wizOpSaveConfirm").style.display = "none";
    document.getElementById("inputSpaceSave").value = "";
    
    document.getElementById("wizOpSaveConfirm").style.display = "none";
    

}

function opSaveDisabled() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = '';
    document.getElementById("opLoad").disabled = 'disabled';
    document.getElementById("opChoose").disabled = 'disabled';
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
    
    document.getElementById('wizOpStartConfirm').style.display = "none";
    
    //app_command_map_manager
    sendMapCommandsShort(app_command_map_manager, 0, "", "", app_command_map_manager);
}

function opStartDisabled() {

    document.getElementById("opMake").disabled = 'disabled';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = 'disabled';
    document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = '';
    document.getElementById("opDelete").disabled = '';
    
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
        
    document.getElementById('wizOpViewConfirm').style.display = "none";
    

}

function opViewDisabled() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
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
}

function receiveMapEvent() {
    ;//console.log("map");
    if (! isMatchingName(tx_gapi_turtlebot_name)) return;
    var rx_map_commands ;
    try {
	    rx_map_commands = gapi.hangout.data.getState()[tx_gapi_map_event];
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- map" );
	}
	if (typeof rx_map_commands !== "undefined") {
	    var commands = JSON.parse(rx_map_commands);
	    //do something... round-trip the 'wizard' operand
	    switch( commands.command ) {
	        case map_command_list : 
	            /*
                var request = new ROSLIB.ServiceRequest({});
	            app_service_stop.callService( request, function (result) {
	                //console.log("result: " + result.result);
	                
	            } );
                */
                
                /*
	            var request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_map_manager"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: app manager start?" );
	                //sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            */
	        
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
                        
                        sendMapPicBroadcast(commands.wizard, message);
                        map_listener.unsubscribe();
                    });
                }
                catch (e) {
                    ;//console.log("map listener fail");
                }
                
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
	            /*
	            var request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_make_a_map"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: ");
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            */
	        
                var request = new ROSLIB.ServiceRequest({ "filename": commands.new_name});
	            map_service_save.callService( request, function (result) {
	                sendMapBroadcast(commands.wizard, null, 0);
	                ;//
	            } );
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
	                //if (typeof map_image !== 'undefined' && !map_image.isDisposed()) map_image.dispose();
	                //if (typeof map_overlay !== 'undefined' && !map_overlay.isDisposed()) map_overlay.dispose();
	                console.log("before createImageResource " + result.data );
	                map_image = gapi.hangout.av.effects.createImageResource(
	                    result.data );
	                    
	                // Use an onLoad handler
                    map_image.onLoad.add( function(event) {
                        if ( !event.isLoaded ) {
                            //alert("Could not load your overlay.");
                            console.log("overlay NOT loaded");
                            map_image.dispose();
                        } else {
                            console.log("overlay loaded");
                            //alert("Overlay loaded.");
                        }
                    });

	                console.log("before createOverlay");
	                document.getElementById('showMapSpaceView').innerHTML = '<img src="' + result.data + '">' ;
	                map_overlay = map_image.createOverlay( {'scale':
                        {'magnitude': 0.125,
                        'reference': gapi.hangout.av.effects.ScaleReference.WIDTH}});
	                map_overlay.setPosition(0,0.25);
	                //map_overlay.setScale(0.5);
	                //map_overlay = map_image.showOverlay({'position': {'x': 0, 'y': 0}});
	                map_overlay.setVisible(true);
	                //sendMapBroadcast(commands.wizard, null, 0);
	                sendMapInForm(result.data);
	            } );
	        break;

            case app_command_list :
                
                var list = new Array();
                var x;
                try {
                    app_topic_list.subscribe( function(message) {
                        var len = message.available_apps.length;
                        for (x = 0; x < len; x ++) {
                            ;//console.log(message.available_apps[x].name);
                            list.push(message.available_apps[x].name);
                        }
                        
                        sendAppListBroadcast(commands.wizard, list);
                        app_topic_list.unsubscribe();
                    });
                }
                catch (e) {
                    ;//console.log("map listener fail");
                }
            break;
            
            case app_command_invite :
                // NOT USED
            
                var request = new ROSLIB.ServiceRequest({"remote_target_name" : "",
                "application_namespace" : "turtlebot/application", "cancel": true});
	            app_service_invite.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            
	            request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_map_manager"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            
	           
            break;
            
            case app_command_make_map :
            
                /*
                var request = new ROSLIB.ServiceRequest({});
	            app_service_stop.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
            
                var request = new ROSLIB.ServiceRequest({});
	            app_service_stop.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                */
                
                
                var request = new ROSLIB.ServiceRequest({"remote_target_name" : "",
                "application_namespace" : "turtlebot/application", "cancel": true});
	            app_service_invite.callService( request, function (result) {
	                console.log("result: " + result.result);
	                //sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            
	            
	            request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_make_a_map"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: make a map? " + result.result);
	                app_name = "turtlebot_core_apps/android_make_a_map";
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
            break;
            
            case app_command_map_manager :
                /*
                var request = new ROSLIB.ServiceRequest({});
	            app_service_stop.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                */
                
                
                var request = new ROSLIB.ServiceRequest({"remote_target_name" : "",
                "application_namespace" : "turtlebot/application", "cancel": true});
	            app_service_invite.callService( request, function (result) {
	                console.log("result: " + result.result);
	                //sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            
	            request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_map_manager"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: map_manager? " + result.result);
	                app_name = "turtlebot_core_apps/android_map_manager";
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
            break;
            
            case app_command_map_nav :
                /*
                var request = new ROSLIB.ServiceRequest({});
	            app_service_stop.callService( request, function (result) {
	                console.log("result: " + result.result);
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
                */
                
                
                var request = new ROSLIB.ServiceRequest({"remote_target_name" : "",
                "application_namespace" : "turtlebot/application", "cancel": true});
	            app_service_invite.callService( request, function (result) {
	                console.log("result: " + result.result);
	                //sendMapBroadcast(commands.wizard, null, 0);
	            } );
	            
	            request = new ROSLIB.ServiceRequest({"name" : 
	                "turtlebot_core_apps/android_map_nav"});
	            app_service_start.callService( request, function (result) {
	                console.log("result: map_manager? " + result.result);
	                app_name = "turtlebot_core_apps/android_map_nav";
	                sendMapBroadcast(commands.wizard, null, 0);
	            } );
            break;
            
            case app_command_app_stop :
                
                var request = new ROSLIB.ServiceRequest({"remote_target_name" : "",
                "application_namespace" : "turtlebot/application", "cancel": true});
	            app_service_invite.callService( request, function (result) {
	                console.log("result: " + result.result);
	                //sendMapBroadcast(commands.wizard, null, 0);
	            //});
	            
                    var request = new ROSLIB.ServiceRequest({});
	                app_service_stop.callService( request, function (result) {
	                    console.log("result: stop_app? " + result.stopped);
	                    console.log("error_code: " + result.error_code + " " + result.message);
	                    sendMapBroadcast(commands.wizard, null, 0);
	                } );
	                
	            } );// INNER CALL!!
            break;
	    }
	}
    gapi.hangout.data.clearValue(tx_gapi_map_event);
    
}

function sendMapInForm(data) {

    $.ajax({
        url: "/send",
        type: "POST" ,
        data: {
            'map': data},
        success: function( data ) {
            console.log('ajax here');
        }
    });
                    /*
	                my_form=document.createElement('FORM');
                    my_form.name='someform';
                    my_form.method='POST';
                    my_form.action='https://awesometelenp.appspot.com/send';
                    
                    my_tb=document.createElement('INPUT');
                    my_tb.type='TEXT';
                    my_tb.name='map';
                    my_tb.value= data ;
                    my_form.appendChild(my_tb);
                    my_form.submit();
                    */
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

function setMapServices() {
    map_service_list = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : 'turtlebot/list_maps',
   		 messageType : 'map_store/ListMaps'
  	});
  	
  	map_service_load = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : 'turtlebot_core_apps/android_map_manager/publish_map',
   		 messageType : 'map_store/PublishMap'
  	});
  	
  	//no service for new map
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
  	
  	map_service_delete = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : 'turtlebot_core_apps/android_map_manager/delete_map',
   		 messageType : 'map_store/DeleteMap'
  	});
  	
  	map_service_rename = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : 'turtlebot_core_apps/android_map_manager/rename_map',
   		 messageType : 'map_store/RenameMap'
  	});
  	
  	map_service_save = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : 'save_map',
   		 messageType : 'map_msgs/SaveMap'
  	});
  	
  	map_listener = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/map',
   		 messageType : 'nav_msgs/OccupancyGrid'
   		 
  	});
  	
  	app_topic_list = new ROSLIB.Topic({
    	'ros' : ros,
    	'name' : '/turtlebot/app_list',
   		 messageType : 'rocon_app_manager_msgs/AppList'
  	});
  	
  	app_service_invite = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/turtlebot/invite',
   		 messageType : 'rocon_app_manager_msgs/Invite'
  	});
  	
  	app_service_start = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/turtlebot/start_app',
   		 messageType : 'rocon_app_manager_msgs/StartApp'
  	});
  	
  	app_service_stop = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/turtlebot/stop_app',
   		 messageType : 'rocon_app_manager_msgs/StopApp'
  	});
  	
  	app_service_status = new ROSLIB.Service({
    	'ros' : ros,
    	'name' : '/turtlebot/status',
   		 messageType : 'rocon_app_manager_msgs/Status'
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
        ;//console.log("list -" + list[x].name + "- " + list[x].map_id);
    }

    document.getElementById(space).innerHTML = string;
}

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
    ;//console.log (listText);
    try {
		gapi.hangout.data.setValue( tx_gapi_list, listText);
	}
	catch (e) {
		;//console.log("hangout setValue error. -- Error");
	}
	;//console.log("map event " + listText);
}

function sendMapPicBroadcast(wizard, map_in) {
    if (! isMatchingName(tx_gapi_turtlebot_name)  ) return;
    if (typeof map_in === "undefined") {
        ;//console.log("map_in is undefined...-----------------------");
        return;
    }
    var x,y;
    var width = map_in.info.width;
    var height = map_in.info.height;
    var map = '{"width":"' + width + '","height":"' + height + '","wizard":"' + wizard + '","map": [';
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
		;//console.log("hangout setValue error. -- Error with map pic");
	}
	;//console.log(map);
}

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
	        break;
	        
	        case map_command_load :
	            document.getElementById("wizOpLoadConfirm").style.display = "block";
	            //opChooseOp();
	        break;
	        
	        case map_command_delete :
	            document.getElementById("wizOpDelConfirm").style.display = "block";
	        break;
	        
	        case map_command_list_load :
	            putListInSelectLocal(data.map_list, "selectSpaceLoad");
	        break;
	        
	        case map_command_list_start:
	        
	        break;
	        
	        case map_command_list_delete :
	            putListInSelectLocal(data.map_list, "selectSpaceDelete");
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
	            opStartDisabled();
	        break;
	        
	        case app_command_app_stop :
	            stopService();
	        break;
	        
	        case app_command_map_nav:
	            opLoadDisabled();
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

function receiveRawMapBroadcast() {
    if (! isMatchingName(tx_gapi_controller_name) && 
        ! isMatchingName(tx_gapi_turtlebot_name) ) return;
    return; // <----------------------------
    try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_map_raw];
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- " );
	}
	
	//;//console.log("raw map broadcast!! ---------------------");
	if (typeof rx_data !== "undefined") {
	    var list = JSON.parse(rx_data);
	    //;//console.log("data received " + list);
	    if ( list.wizard == map_command_list_start ) {
	        fillMapSpace('showMapSpace', list);
	    }
	    else if (list.wizard == map_command_list_view ) {
    	    fillMapSpace('showMapSpaceView', list);
	    }
	    
    gapi.hangout.data.clearValue(tx_gapi_map_raw);
	}
}

function receiveAppListBroadcast() {
    if (! isMatchingName(tx_gapi_controller_name) && 
        ! isMatchingName(tx_gapi_turtlebot_name) ) return;
    try {
	    rx_data = gapi.hangout.data.getState()[tx_gapi_app_list];
	    
	}
	catch (e){
	    ;//console.log("error google hangouts api -- " );
	}
	
    if (typeof rx_data !== "undefined") {
	    var list = JSON.parse(rx_data);
        fillAppSpace(list, 'listSpaceApps');
        gapi.hangout.data.clearValue(tx_gapi_app_list);
	}
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
    var new_name = document.getElementById("inputSpaceRename").value;
    //check for bad 'new_name' string (no quotes, etc.)
    sendMapCommandsShort(map_command_rename, map_id, "",new_name, map_command_rename);
}

function executeSave() {
    var new_name = document.getElementById("inputSpaceSave").value;
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
    sendMapCommandsShort(app_command_map_manager, 0, "", "", app_command_map_manager);
}

function stopService() {
    document.getElementById("opMake").disabled = '';
    document.getElementById("opSave").disabled = 'disabled';
    document.getElementById("opLoad").disabled = '';
    document.getElementById("opChoose").disabled = 'disabled';
    document.getElementById("opStart").disabled = '';
    document.getElementById("opRename").disabled = 'disabled';
    document.getElementById("opDelete").disabled = 'disabled';
    

}

function opStopService() {
    sendMapCommandsShort(app_command_app_stop, 0, "", "", app_command_app_stop);
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
            if (list.map[(y * height) + x].d < 5) {
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
    ;//console.log(string);
    document.getElementById(space).innerHTML = string;
    document.getElementById("wizOpStartConfirm").style.display = "block";
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
    return;

}

function xy(x,y) {

}
