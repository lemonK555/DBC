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
		<div id="contents" style="height:1200px;">
				<div id="userList">
					<h3>用户信息</h3>
					<p>
						*请谨慎修改您的信息
					</p>
					<form action="#" method="post">
						<ul>
							<li>
								<span>昵称</span>${user.userName}
							</li>
							<li>
								<span>密码</span>${user.userPwd}
							</li>
							<li>
								<span>真实姓名</span>${user.userRealName}
							</li>
							<li>
								<span>性别</span>${user.userSex}
							</li>
							<li>
								<span>生日</span>${user.userBirthday}
							</li>
							<li>
								<span>电话</span>${user.userMobil}
							</li>
							<li>
								<span>电子邮箱</span>${user.userEmail}
							</li>
							<li>
								<span>积分</span>${user.userPoint}
							</li>
						</ul>
						<input type="submit" value="搜索" class="button">
					</form>
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