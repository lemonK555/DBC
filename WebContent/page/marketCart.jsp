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
					<h4><span>会员购物车</span></h4>
					<table>
						<thead>
							<tr>
								<th style="width:50%;">产品信息</th>
								<th style="width:10%;">数量</th>
								<th style="width:20%;">单价</th>
								<th style="width:20%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${marketCarts}" var="p" varStatus="c">
							<tr>
								<td>
								<input name="marketCartId" id="marketCartId" type="hidden" value="${p.marketCartId}" >
									<img src="${basePath}page/images/${p.picAddress}" style="height:100px;width:100px;">
								 	<b>${p.productName}</b>
									<p style="padding-top:10px;">
										${p.productDescription}
									</p>
								</td>
								<td>
									<a href="#" id="minus"class="minus" style="float:left;margin-right:2px;margin-left:20%"></a>
									<input  onchange="getProductNum()" id="productNum" type="text" value="${p.marketProductNum}" style="width:20%;float:left;">
									<a href="#" id="plus" class="plus" style="float:left;"></a>
								</td>
								
								<td class="last">
									<div>
										${p.marketProductPrice} 
										<div class="del">
											<a href="${basePath}marketCart/delMarketCartById?marketCartId=${p.marketCartId}">删除</a>
										</div>
										<div class="buy">
											<a href="${basePath}order/addOrder?marketCartId=${p.marketCartId}" >购买</a>
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
</div>
</body>
<script src="${basePath}page/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var productNum = document.getElementById('productNum');
	var minus = document.getElementById('minus');
	var plus = document.getElementById('plus');
	var marketCartId = document.getElementById('marketCartId');
	minus.onclick=function(){
		if(parseInt(productNum.value)>1){
			productNum.value = parseInt(productNum.value)-1;
			getUrl();
		}	
	}
	plus.onclick=function(){
		productNum.value = parseInt(productNum.value)+1;
		getUrl();
	} 
	productNum.onchange=function getProductNum(e){
		getUrl();
				
	} 
	function getUrl(){
		var num = productNum.value;
		var id = marketCartId.value;
		$.ajax({
		    type: "post",
		    url: "/DBC/marketCart/editMarketCart?marketCartId="+id+"&&productNum="+num,
			    contentType:"application/json;charset=utf-8",
					data:null,
		   			dataType:"json",
		    success: function(data){        	
					
		        }
		    });
	}

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