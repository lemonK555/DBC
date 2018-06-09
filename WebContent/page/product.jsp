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
			<div id="product">
				<div class="section">
					<ul>
						<li>
							<a href="#"><img src="${basePath}page/images/p1${product.picAddress}" style="width: 50px;"alt="thumbnail"></a>
						</li>
						<li>
							<a href="#"><img src="${basePath}page/images/p2${product.picAddress}" style="width: 50px;"alt="thumbnail"></a>
						</li>
						<li>
							<a href="#"><img src="${basePath}page/images/p3${product.picAddress}" style="width: 50px;"alt="thumbnail"></a>
						</li>
						<li>
							<a href="#"><img src="${basePath}page/images/p4${product.picAddress}" style="width: 50px;"alt="thumbnail"></a>
						</li>
						<li>
							<a href="#"><img src="${basePath}page/images/p5${product.picAddress}" style="width: 50px;"alt="thumbnail"></a>
						</li>
					</ul>
					<div>
						<img src="${basePath}page/images/${product.picAddress}" alt="view" style="height:290px;width:290px;">
					</div>
				</div>
				<div class="section">
						<h2>${product.productName}</h2>
						<p>${product.productDescription}</p>
						<form action="marketCart/addMarketCart" method="post">
							
							<p class="sectionTop">价格：
								<span style="text-decoration: line-through;">${product.productPriceUser}</span>
							</p>
							<p class="sectionTop">会员价：
								<span style="color:red;font-size:25px;font-weight:bold;">14.00</span>
							</p>	

							<div class="sectionCenter" style="border-style: dashed dashed dashed none;">
								累计销量：<em>${product.productOrderNum}</em>
							</div>
							<div class="sectionCenter">
								累计评论：<em>${product.productReviews}</em>
							</div>
							<div id="checkout" style="height:50px;width:100%;padding:0">
								<table style="height:50px;margin:0;width:100%;">
									<tr>
										<td class="sectionButton">
											<span>数量：</span>
											<a href="#" class="minus" style="float:left;margin-right:2px;"></a>
											<input type="text" value="1" id="productNum">
											<a href="#" class="plus" style="float:left;"></a>
											<span style="margin-left:20%;">库存：<em>50</em></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="cart">
								<a href="#" id="addMarketCart"onclick="addMarketCart(${product.productId},${product.productPriceUser})">加入购物车</a>
							</div>
							<div class="collect">
								<a href="#" id="addCollect"onclick="addCollect(${product.productId})">加入收藏夹</a>
							</div>
						</form>
					</div>
				</div>
			<div id="contents">
				<div id="checkout">
					<h4><span>累计评论</span></h4>
					<table>
						<thead>
							<tr>
								<th>内容</th>
								<th>类型</th>
								<th>评论人</th>
								<th>评论时间</th>
							</tr>
						</thead>
						<tbody>
							<tr>					
								<td><img src="images/leather-boots3.jpg" alt="Thumbnail"> 
									<b>Hukbalahap Boots</b>
									<p> blandit vel sit amet ipsum. Nam accumsan turpid id mauris fermentum</p>
								</td>
								<td>
									<p>好评</p>
								</td>
								<td>
									<p>LKJ</p>
								</td>
								<td class="last">
									<div>$8.50</div>
								</td>
							</tr>
						</tbody>
					</table>
					<a href="checkout.html" class="proceed-btn">Proceed to Checkout</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="${basePath}page/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function addMarketCart(e,price){
	var addMarket = document.getElementById('addMarket');
	var productNum = document.getElementById('productNum').value;
	$.ajax({
	    type: "post",
	    url: "/DBC/marketCart/addMarketCart?productId="+e+"&productNum="+productNum+"&productPriceUser="+price,
		    contentType:"application/json;charset=utf-8",
				data:null,
	   			dataType:"json",
	    success: function(data){        	
				alert(data);
				addCollect.innerHtml = data;
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
		
					addCollect.style.color = "green";
		        }
		    });
	}
</script>
</html>