<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<style type="text/css">@import url(${basePath}page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}page/css/style.css);</style>
  </head>
  <jsp:include page="File.jsp"/>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="${basePath}product/findProductFrist"><img src="${basePath}page/images/logo.png" alt="LOGO"></a>
				</div>
				<div id="navigation">
					<ul id="primary">
						<li class="selected">
							<a href="${basePath}product/findProductFrist">首页</a>
						</li>
						<li>
							<a href="${basePath}product/findProductByVouch">推荐</a>
						</li>
						<li>
							<a href="${basePath}product/findProduct?id=1">全部商品</a>
						</li>
						<li>
							<a href="#">伴手礼</a>
						</li>
						<li>
							<a href="#">商城说明</a>
						</li>
						<li class="highlight">
							<a href="sale.html">欢迎您,${userForm.userName}</a>
						</li>
					</ul>
					<ul id="secondary">
						<li>
							<a href="${basePath}marketCart/findMarketCart">购物车</a>
						</li>
						<li>
							<a href="${basePath}collect/findCollect">收藏夹<img src="${basePath}page/images/collect.jpg"style="width:20px;margin:0 10px;"></a>
						</li>
						<li>
							<a href="${basePath}page/login.jsp">登录</a> | <a href="${basePath}user/input-user">注册</a>
						</li>
					</ul>
				</div>
			</div>
			
</body>
<script src="${basePath}page/js/jquery-3.1.1.min.js"></script>
<script src="${basePath}page/assets/js/bootstrap.min.js"></script>
</html>