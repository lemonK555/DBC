<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">@import url(${basePath}../page/css/main.css);</style>
	<style type="text/css">@import url(${basePath}../page/css/style.css);</style>
	
</head>
<jsp:include page="File.jsp"/>
<jsp:include page="All.jsp"/>
<body>
		<div id="contents">
				<div id="checkout">
					<h4><span>会员收藏夹</span></h4>
					<table>
						<thead>
							<tr>
								<th>产品信息</th>
								<th>价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${collects}" var="p" varStatus="c">
							<tr>
								<td>
									<img src="${basePath}page/images/${p.picAddress}" style="height:100px;width:100px;">
								 	<b>${p.productName}</b>
									<p style="padding-top:10px;">
										${p.productDescription}
									</p>
								</td>
								<td class="last">
									<div>
										${p.productPriceUser} 
										<div class="del">
											<a href="${basePath}collect/delCollectById?collectId=${p.collectId}">删除</a>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="#" class="proceed-btn">购买</a>
				</div>
			</div>
	</div>
</div>
</body>
<script src="${basePath}page/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	function addCollect(e){
		var addCollect = document.getElementById('addCollect');
		$.ajax({
		    type: "post",
		    url: "/DBC/collect/addCollect?productId="+e,
			    contentType:"application/json;charset=utf-8",
					data:null,
		   			dataType:"json",
		    success: function(data){        	
					alert(data);
					addCollect.innerHtml = data;
					addCollect.style.color = "green";
		        }
		    });
	}
</script>
</html>