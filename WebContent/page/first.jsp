<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>hello</title>
	<style type="text/css">@import url(${basePath}page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}page/css/style.css);</style>
	<style type="text/javascript">@import url(${basePath}page/js/jquery-3.1.1.min.js);</style>
</head>
<jsp:include page="File.jsp"/>
<jsp:include page="All.jsp"/>
<body>
		<div id="contents">
			<div id="adbox">
				<div id="search">
					<h3>快速搜索</h3>
					<p>
						请输入您想要的筛选条件
					</p>
					<form action="index.html" method="post">
						<ul>
							<li>
								<select id="shop">
									<option>搜索相关店铺</option>
								</select>
							</li>
							<li>
								<select id="product">
									<option>搜索相关产品</option>
								</select>
							</li>
							<li>
								<select id="category">
									<option>搜索相关分类</option>
								</select>
							</li>
							<li>
								<select id="price">
									<option>最低价</option>
									<option>最高价</option>
								</select>
							</li>
						</ul>
						<input type="submit" value="搜索" class="button">
					</form>
				</div>
				<c:forEach items="${productTop}" var="t" varStatus="currentStatus">
					 <a href="${basePath}product/findProductJSP?productId=${t.productId}">
						<img src="${basePath}page/images/${t.picAddress}" height="355" width="618" alt="Promo">
					</a>
				</c:forEach>
			</div>
			<div id="main">
				<div id="featured">
					<h4><span>热卖商品</span></h4>
					<ul class="items">
						<c:forEach items="${productHot}" var="p" varStatus="currentStatus">
						<li>
							<a href="${basePath}product/findProductJSP?productId=${p.productId}"> <img src="${basePath}page/images/${p.picAddress}"  style="width:169px;" alt="Img"> <span>${p.productPriceUser}</span>${p.productName} </a>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>