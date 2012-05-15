function moveEvent(event, dayDelta, minuteDelta, allDay){
    jQuery.ajax({
        data: 'id=' + event.id + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta + '&all_day=' + allDay,
        dataType: 'script',
        type: 'post',
        url: "/events/move"
    });
}

function resizeEvent(event, dayDelta, minuteDelta){
    jQuery.ajax({
        data: 'id=' + event.id + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta,
        dataType: 'script',
        type: 'post',
        url: "/events/resize"
    });
}

function showEventDetails(event){
		$('#event_desc').load('/events/'+ event.id);
    $('#desc_dialog').dialog({
        title: event.title,
        modal: true,
        width: 500,
        close: function(event, ui) {
					$('#desc_dialog').dialog('destroy')
 				}
    });
}

function editEvent(event_id){
    jQuery.ajax({
        dataType: 'script',
        type: 'GET',
        url: "/events/" + event_id + "/edit"
    });  
}

function deleteEvent(event_id){
    jQuery.ajax({
        dataType: 'script',
        type: 'DELETE',
        url: "/events/" + event_id
    });  
}