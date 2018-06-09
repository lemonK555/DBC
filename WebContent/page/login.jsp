<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="File.jsp"/>
<head>
	<meta charset="UTF-8">
	<title>欢迎来到DBC-用户注册</title>
 	<script type="text/javascript" src="${basePath}page/js/jquery-3.1.1.min.js;"></script>
	<script type="text/javascript" src="${basePath}page/js/main.js"></script>
	<style type="text/css">@import url(${basePath}../page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}../page/css/style.css);</style>
</head>
<jsp:include page="All.jsp"/>
<body> 
		<div id="contents">
	    	<div class="content" style="height:350px;">
	        <p>登录</p>
	        <form action="${basePath}user/user-login" method="post" id="formOne">
	          <div class="row">
	             <span>用户名：</span>
	             <input type="text" id="userName" name="userName" value="${userForm.userName}"onblur="W_userName()"/>
	          </div>
	            <div id="N1" name="tishi">* 请输入6-15字符，由中文、数字、字母、下划线组成</div>
	            <div id="no1" name="tishi">*请填写用户名</div>
	          <div class="row">
	             <span>密码：</span>
	             <input type="password" id="userPwd" name="userPwd" value="${userForm.userPwd}"onblur="W_userPwd()">
	          </div>
	            <div id="N2" name="tishi">* 请输入8-20字符的密码，由数字、字母、下划线组成</div>
	            <div id="no2" name="tishi">*请填写您的密码</div> 
	          <div class="row">
	            <input type='submit' value="登录" style="background:green;width:150px;"/>
	          </div>
	        </form>
	      </div>
	    </div>
	  </div>
  </div>
</body>
<jsp:include page="footer.jsp"/>
</html>