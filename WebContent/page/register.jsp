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
	<style type="text/css">@import url(${basePath}page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}page/css/style.css);</style>
</head>
<jsp:include page="All.jsp"/>
<body> 
		<div id="contents">
	    	<div class="content">
	        <p>注册</p>
	        <form action="" id="form" name="form1">
	    
	          <div class="row">
	             <span>用户名：</span>
	             <input type="text" id="userName" name="userName" value="${userForm.userName}"onblur="W_userName()"/>
	          </div>
	            <div id="N1" name="tishi">* 请输入6-15字符，由中文、数字、字母、下划线组成</div>
	            <div id="no1" name="tishi">*请填写用户名<div id="message"></div></div>
	            
	          <div class="row">
	             <span>密码：</span>
	             <input type="password" id="userPwd" name="userPwd" value="${userForm.userPwd}"onblur="W_userPwd()">
	          </div>
	            <div id="N2" name="tishi">* 请输入8-20字符的密码，由数字、字母、下划线组成</div>
	            <div id="no2" name="tishi">*请填写您的密码</div> 
	          <div class="row">
	              <span>真实姓名：</span>
	              <input type="text" name="userRealName" id="userRealName" value="${userForm.userRealName}" onblur="W_userRealName()"/>
	          </div>
	            <div id="N3" name="tishi">* 您的格式不正确，请输入中文或英文</div>
	            <div id="no3" name="tishi">* 请输入真实姓名</div>
	          <div class="row">
	            <span>性别：</span>
	            <input type="radio" name="userSex" value="女">女
	            <input type="radio" name="userSex" value="男">男
	          </div>
	            <div id="N4" name="tishi"></div>
	            <div id="no4" name="tishi">* 请选择您的性别</div>
	          <div class="row">
	            <span>生日：</span> 
	              <select name=YYYY onchange="YYYYMM(this.value)">  
	                <option value="">年</option>  
	              </select>  
	              <select name=MM onchange="MMDD(this.value)">  
	                <option value="">月</option>  
	              </select>  
	              <select name=DD>  
	                <option value="">日</option>  
	              </select> 
	              <input type="hidden" name="userBirthday" id="userBirthday">
	          </div>
	            <div id="N5" name="tishi">* 请输入正确的生日</div>
	            <div id="no5" name="tishi">* 请选择您的生日</div>
	          <div class="row">
	            <span>电话：</span>
	            <input type="text" name="userMobile" id="userMobile" onblur="W_userMobile()">
	          </div>
	           <div id="N6" name="tishi">* 请输入11个由数字组成的手机号码</div>
	           <div id="no6" name="tishi">* 请输入手机号码</div>
	          <div class="row">
	            <span>邮箱：</span>
	            <input type="text" name="userEmail" id="userEmail" onblur="W_userEmail()">
	          </div>
	            <div id="N7" name="tishi">* 请输入正确格式的邮箱地址</div>
	            <div id="no7" name="tishi">* 请输入邮箱地址</div>
	            <input type="hidden" name="userPoint" id="userPoint" placeholder="0" value="0">
	            <input type="hidden" name="userCreatTime" id="userCreatTime">
	            <input type="hidden" name="userBlackTime" id="userBlackTime" placeholder="0" value="0">
	          <div class="row">
	            <input type='submit' value="注册" onmouseover="check()" style="background:green;width:150px;"/>
	          </div>
	        </form>
	      </div>
	    </div>
	  </div>
  </div>
</body>
<jsp:include page="footer.jsp"/>
</html>