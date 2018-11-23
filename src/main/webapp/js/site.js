(function ($, undefined) {	
	$(document).ready(function() {		
		$('.demo-box').css({opacity: 1});
		// Contacts Page
		$('#contact-submit').on('click', h_contact_submit);
	});
	
	
	function h_contact_submit(e) {
		var errors = validate_contact_form();
			$('.error').removeClass('error');
		if (errors) {
			$('input').removeClass('error');
			var len = errors.length;

			for (var i=0; i<len; i++) {
				$('#'+errors[i]).addClass('error');
			}			
		} else {
			var name = $('#name').val(),
				email = $('#email').val(),
				subject = $('#subject').val(),
				message = $('#message').val();
			
			$.ajax({
				type : 'POST',
				url : '../wp-content/themes/nikolaydyankovdesign/email.php',
				data : { name : name, email : email, subject : subject, message : message }, success : function(msg) {
					$('#result').html('Thank you for sending me an email, I will get back to you as soon as possible.');
					$('form').remove();
				}
			});
		}
		e.preventDefault();
		return false;
	}
	function validate_contact_form() {
		var re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		var name = $('#name').val().length,
			email = $('#email').val().length,
			emailStr = $('#email').val();
			subject = $('#subject').val().length,
			message = $('#message').val().length;
		var errors = new Array(), hasError = false, index=0;

		if (name == 0) {
			errors[index] = 'name';
			index++;
			hasError = true;
		}
		if (email == 0 || !re.test(emailStr)) {
			errors[index] = 'email';
			index++;
			hasError = true;
		}
		if (subject == 0) {
			errors[index] = 'subject';
			index++;
			hasError = true;
		}
		if (message == 0) {
			errors[index] = 'message';
			index++;
			hasError = true;
		}

		if (hasError) {
			return errors;
		} else {
			return false;
		}
	}
}(jQuery));