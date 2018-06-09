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
			<div class="orderList">
				<h4><span>用户订单</span></h4>
				<div id="orderList">
					<form action="" id="AEForm" style="border: 1px solid red;border-style:dashed;">
						<input type="hidden" id="userCookId" name="userCookId" value="${marketCart.userCookId}"/>
						<input type="hidden" name="orderReTime" id="orderReTime" value="0"/>
						
						<table>
							<thead>
								<tr>
									<th style="width:40%;">商品信息</th>
									<th>数量</th>
									<th>价格</th>
									<th>收件人姓名</th>
									<th>收件人地址</th>
									<th>收件人电话</th>
									<th>操作</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input name="marketCartId" id="marketCartId" type="hidden" value="${marketCart.marketCartId}" >
										<img src="${basePath}page/images/${marketCart.picAddress}" style="height:100px;width:100px;">
									 	<b>${marketCart.productName}</b></br>
										<p style="padding-top:10px;">
											${marketCart.productDescription}
										</p>
									</td>
									<td><p id="marketProductNum" name="marketProductNum">${marketCart.marketProductNum}</p></td>
									<td><p id="marketTotalPrice" name="marketTotalPrice">${marketCart.marketTotalPrice}</td>
									<td><input type="text" id="orderUserRealName" name="orderUserRealName" style="width:50px;"/></td>
									<td><input type="text" id="orderUserAddress" name="orderUserAddress"style="width:200px;"></td>
									<td><input type="text" id="orderUserMobil" name="orderUserMobil"style="width:80px;"/></td>
									<td class="last" style="width:70px">
										<div>
											<div class="del">
												<a href="${basePath}marketCart/delMarketCartById?marketCartId=${p.marketCartId}">删除</a>
											</div>
											<div class="buy">
												<a href="#" onclick="orderCheck()">购买</a>
											</div>
										</div>
									</td>
									
								</tr>
							</tbody>
						</table>
					</form>
			</div><!-- /row -->
		</div>
	</div>
</div>
</body>
<script src="${basePath}page/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function orderCheck(){
	if($("#orderUserRealName").val()==""||$("#orderUserAddress").val()==""||$("#orderUserMobil").val()==""){
		alert("*请输入收件人姓名、地址、电话");
		$("#AEForm").action = "";
	}else{
		alert("购买成功");
		$("#AEForm").attr("action","${basePath}order/saveOrder");
	}
}
</script>
</html>