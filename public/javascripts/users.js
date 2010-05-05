$(document).ready(function(){
	if ($("#role_student").attr('checked')) {
		$('#is_student').show();
	}

	if ($("#role_campus_manager").attr('checked')) {
		$('#is_manager').show();
	}

	$("#role_campus_manager").click(function(){
		if ($(this).attr('checked'))
			$('#is_manager').show();
		else
			$('#is_manager').hide();
	})

	$("#role_student").click(function() {
		if ($(this).attr('checked'))
			$('#is_student').show();
		else
			$('#is_student').hide();
	});
});