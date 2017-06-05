$(function(){
	
	var pass1 = $('#password1'),
		pass2 = $('#password2'),
		phone = $('#phone'),
		username = $('#username'),
		form = $('#main form'),
		arrow = $('#main .arrow');

	// Empty the fields on load
	$('#main .row input').val('');

	// Handle form submissions
	form.on('submit',function(e){
		
		// Is everything entered correctly?
		if($('#main .row.success').length == $('#main .row').length){

		}
		else{
			
			// No. Prevent form submission
			e.preventDefault();
			
		}
	});
	
	// Validate the username field
	username.on('blur',function(){
		
		// Very simple validation
		if (!/[^\d]{2,}/.test(username.val())){
			username.parent().addClass('error').removeClass('success');
		}
		else{
			username.parent().removeClass('error').addClass('success');
		}
		
	});
	
	// Validate the phone field
	phone.on('blur',function(){
		
		// Very simple validation
		if (!/^[1]+[3,5,8]+\d{9}/.test(phone.val())){
			phone.parent().addClass('error').removeClass('success');
		}
		else{
			phone.parent().removeClass('error').addClass('success');
		}
		
	});

	// Use the complexify plugin on the first password field
	pass1.complexify({minimumChars:2, strengthScaleFactor:0.7}, function(valid, complexity){
		
		if(valid){
			pass2.removeAttr('disabled');
			
			pass1.parent()
					.removeClass('error')
					.addClass('success');
		}
		else{
			pass2.attr('disabled','true');
			
			pass1.parent()
					.removeClass('success')
					.addClass('error');
		}
		
		var calculated = (complexity/100)*268 - 134;
		var prop = 'rotate('+(calculated)+'deg)';
		
		// Rotate the arrow
		arrow.css({
			'-moz-transform':prop,
			'-webkit-transform':prop,
			'-o-transform':prop,
			'-ms-transform':prop,
			'transform':prop
		});
	});
	
	// Validate the second password field
	pass2.on('keydown input',function(){
		
		// Make sure its value equals the first's
		if(pass2.val() == pass1.val()){
			
			pass2.parent()
					.removeClass('error')
					.addClass('success');
		}
		else{
			pass2.parent()
					.removeClass('success')
					.addClass('error');
		} 
	});
	
});



/*******************隐藏显示密码**********************/
var demoImg = document.getElementById("demo_img");
var demoInput = document.getElementById("password1");
function hideShowPsw(){
	if (demoInput.type == "password") {
		demoInput.type = "text";
		demo_img.src = "images/Visible.png";
	}else {
		demoInput.type = "password";
		demo_img.src = "images/Invisible.png";
	}
}
var demoImg2 = document.getElementById("demo_img2");
var demoInput2 = document.getElementById("password2");
function hideShowPsw2(){
	if (demoInput2.type == "password") {
		demoInput2.type = "text";
		demo_img2.src = "images/Visible.png";
	}else {
		demoInput2.type = "password";
		demo_img2.src = "images/Invisible.png";
	}
}

/*************************叉叉*****************/
$(function(){
	$("#clear1").click(function() {
        $("input[name='user_name']").val("").focus(); // 清空并获得焦点
    });
    $("#clear2").click(function() {
        $("input[name='user_phone']").val("").focus(); // 清空并获得焦点
    });
}) 