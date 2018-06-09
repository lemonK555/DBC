<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>hello</title>
	<style type="text/css">@import url(${basePath}../page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}../page/css/style.css);</style>
	<style type="text/javascript">@import url(${basePath}page/js/jquery-3.1.1.min.js);</style>
</head>
<jsp:include page="File.jsp"/>
<jsp:include page="All.jsp"/>
<body>
		<div id="contents">
			<div id="main">
				<div id="featured">
					<h4><span>全部商品</span></h4>
					<ul class="items">
						<c:forEach items="${products}" var="p" varStatus="currentStatus" end="24">
						<c:choose>
						      <c:when test="${currentStatus.count==5||currentStatus.count==10||currentStatus.count==15||currentStatus.count==20}">
						            <li style="margin-left:0;">
										<a href="${basePath}product/findProductJSP?productId=${p.productId}"> <img src="${basePath}page/images/${p.picAddress}"  style="width:169px;height:169px;" alt="Img"> <span>${p.productPriceUser}</span>${p.productName} </a>
									</li>
						      </c:when>
						      <c:otherwise>
						            <li>
										<a href="${basePath}product/findProductJSP?productId=${p.productId}"> <img src="${basePath}page/images/${p.picAddress}"  style="width:169px;height:169px;" alt="Img"> <span>${p.productPriceUser}</span>${p.productName} </a>
									</li>
						      </c:otherwise>
						</c:choose>												
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