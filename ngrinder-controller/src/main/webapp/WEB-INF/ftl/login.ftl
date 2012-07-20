<!DOCTYPE html>
<html lang="en">
	<head>
		<title>nGrinder Login</title>
		<#include "common/common.ftl">
		<style>
			body { overflow-y:hidden; background-color:white }
			.content { height:635px; margin-top:30px; padding-top:30px; background-color:#f5f4f2 }
			.logo { margin-top:150px; text-align:center }
			.login { text-align:center }
			.login input { border:1px solid #e0e0e0 }
			.login .input { margin-bottom:6px; height:13px }
			.lgn_ipt { display:inline-block }
			.btn_lgn { display:inline-block; *margin-left:5px; vertical-align:top }
			.prompt { text-align:center; margin-top:5px; *margin-top:2px; height:30px }
			.prompt select { width:75px }
			.prompt .chk { vertical-align:middle; margin-right:5px; *margin-right:2px }
		</style>
	</head>
<body>
<div>
	<div class="logo"><img src="${req.getContextPath()}/img/logo_ngrinder_a.png" width="400" height="106" alt="nGrinder"></div>
	<div class="content">
		<form action="${req.getContextPath()}/form_Login" method="POST">
			<fieldset>
				<div class="login">
					<span class="lgn_ipt">
						<input type="text" class="span2 input" name="j_username" id="j_username" placeholder="User ID"><br>
						<input type="password" class="span2 input" name="j_password" id="j_password" placeholder="Password">			
					</span>
					<input id="loginBtn" type="image" src="${req.getContextPath()}/img/login.gif" alt="Login" class="btn_lgn" width="60px">
				</div>
				
				<div class="prompt">
					<input type="checkbox" class="chk" name='_spring_security_remember_me'>Remeber me:
					<select  id="native_language" name="native_language" style="margin-left:30px;">
						  <option value="en">English</option>
						  <option value="kr">한국어</option>
						  <option value="cn">中文</option>
					</select>
				</div>
				
				<div class="prompt">
					   Regional Location:     
					<select  id="user_locale"  name="user_locale" style="margin-left:19px;">
					  <option value="Asia/Seoul">한국</option>
					  <option value="Asia/Shanghai">中国</option>
					  <option value="America/New_York">USA</option>
					  <option value="all">All</option>
					</select>
				</div>
			</fieldset>
		</form>
	</div>
</div>

<script language="javascript">
	$.ajaxSetup({ cache: false });
	$(function(){
		var language=getCookie("org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE");
		$("#user_locale").val("${defaultTime!''}");
		if (language.indexOf("kr") > -1){
			$("#native_language").val("kr");
		} else if (language.indexOf("cn") > -1) {
			$("#native_language").val("cn");
		} else {
			$("#native_language").val("en");
		}
		
		$("#user_locale").change(function() {
			if ($("#user_locale option:selected").val() == "all") {
				$("#user_locale").load("${req.getContextPath()}/allTimeZone");
			}
		});
	});
</script>
</body>
</html>