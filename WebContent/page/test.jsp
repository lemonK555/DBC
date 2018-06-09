<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="File.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">@import url(${basePath}page/main.css);</style>
<title>图片轮播</title>
</head>
<script type="text/javascript">
	window.onload=function()
	{
		var content = document.getElementById('content');
		var list = document.getElementById('img-list');
		var buttons = document.getElementById('buttons').getElementsByTagName('span');
		var left = document.getElementById('left');
		var right = document.getElementById('right');
		var index = 1;
		
		function showButton(){
			for(var i = 0; i<buttons.length;i++){
				if(buttons[i].className == 'on'){
					buttons[i].className =" ";
					break;
				}
			}
			buttons[index-1].className='on';
		}
		function annimate(offset)
		{
			var newLeft = parseInt(list.style.left)+offset;
			var time = 300;
			var interval = 10;
			var speed = offset/(time/interval);
			//判断是否位移
			function go(){
				if((speed<0&&parseInt(list.style.left)>newLeft)||(speed>0&&parseInt(list.style.left)<newLeft)){
					list.style.left = parseInt(list.style.left) +speed +'px';
					setTimeout(go,interval);
				}else{
					list.style.left = newLeft+'px';
					if(newLeft>-290){
						list.style.left = -870+'px';
					}
					if(newLeft<-870){
						list.style.left = -290+'px';
					}
				}
			}
			go();
		}
		left.onclick=function()
		{
			if(index == 1){
				index = 3;
			}else{
				index-=1;
			}
			showButton();
			annimate(290);
		}
		right.onclick=function()
		{
			if(index == 3){
				index = 1;
			}else{
				index+=1;
			}
			showButton();
			annimate(-290);
		}
		//按钮切换
		for(var i = 0; i<buttons.length;i++){
			buttons[i].onclick = function(){
				var myIndex = parseInt(this.getAttribute('index'));
				var offset = -290*(myIndex-index);
				annimate(offset);
				index = myIndex;//更新当前index值
				showButton();
			}
		}
	}
</script>
<body>
	<div id="content">
		<div id="img-list" style="left:-290px;">
			<img src="${basePath}page/images/${images[2]}">
			<img src="${basePath}page/images/${images[0]}">
			<img src="${basePath}page/images/${images[1]}">
			<img src="${basePath}page/images/${images[2]}">
			<img src="${basePath}page/images/${images[0]}">
		</div>
		<div id="buttons">
			<span index="1" class="on"></span>
			<span index="2"></span>
			<span index="3"></span>
		</div>
		<a href="javascript:;" id="left" class="arrow">&lt;</a>
		<a href="javascript:;" id="right" class="arrow">&gt;</a>
	</div>
	<table border="1px">
							<thead>
								<tr>
									<th>序号</th>
									<th>产品名称</th>
									<th>产品分类</th>
									<th>产品描述</th>
									<th>产品价格</th>
									<th>产品描述</th>
									<th>产品价格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${pictures}" var="p" varStatus="currentStatus">
								<tr>
									<td><c:out value="${currentStatus.count }"/></td>
									<td>${p.picId}</td>
									<td>${p.picName}</td>
									<td>${p.picFunctionName}</td>
									<td>${p.picAddress}</td>
									<td>${p.picIsChecked}</td>
									<td>${p.picReTime}</td>
									<td><a type="button" href="${basePath}product/update-product?id=${p.id}">修改</a>
									<a type="button" href="${basePath}product/delete-product?id=${p.id}">删除</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
</body>
</html>