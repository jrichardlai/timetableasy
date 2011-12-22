$(document).ready(function(){
	$('#classroom_campus_id').change(function(){
		if ($(this).val()) {
			$('#classroom_cursus').show();
			$.get('/javascripts/cursuses', {id: $(this).val()});
		}
		else
			$('#classroom_cursus').hide();
	})
});