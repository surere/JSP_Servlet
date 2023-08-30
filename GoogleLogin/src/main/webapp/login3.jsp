<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글 아이디로 로그인하기 2</title>
	<script src="http://code.jquery.com/jquery.js"></script>
	
	<meta name="google-signin-client_id"
	content="38687560353-6lmvsl14qibd7pt43qt8otucb8r3gqdq.apps.googleusercontent.com">
	<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		$('#my-signin2').css('display','none');
		$('#logout').css('display','block');
		$('#upic').attr('src','profile.getImageUrl())');
		$('#uname').html('[ ' +profile.getName() + ' ]');
	}
	function onFailure(error) {
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
			$('#my-signin2').css('display','block');
			$('#logout').css('display','none');
			$('#upic').attr('src','');
			$('#uname').html('');
		});
	}	
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope': 'profile email',
			'width': 240,
			'height': 50,
			'longtitle': true,
			'theme': 'dark', 
			'onsuccess': onSignIn,
			'onfailure': onFailure
		});
	}
	$(document).ready(function(){
		
	
	});
	</script>
</head>
<body>
	<div id="my-signin2"></div>
	
	<div id="logout" style="display: none;">
	<input type="button" onclick="signOut();" value="로그아웃" /><br>
	
	<img id="upic" src=""><br>
	<span id="uname"></span>
	</div>
	
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer>
	</script>
	
</body>
</html>