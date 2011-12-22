$(document).ready(function(){
	$('#classroom_campus_id').change(function(){
		value = $(this).val();
		if (value) {
			$.get('/javascripts/cursuses', {campus_id: value})
		}
	});
	$('#classroom_campus_id').each(function(){
		value = $(this).val();
		if (value) {
			$.get('/javascripts/cursuses', {campus_id: value})
		}
		else {
			$('#classroom_cursus').hide();
		}
	});

});