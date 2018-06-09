<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片库</title>

	<!-- basic styles -->
	<style type="text/css">@import url(${basePath}../page/assets/css/bootstrap.min.css);</style>
	<style type="text/css">@import url(${basePath}../page/assets/css/font-awesome.min.css);</style>
	<!-- page specific plugin styles -->
	<style type="text/css">@import url(${basePath}../page/main.css);</style>
</head>
<jsp:include page="File.jsp"/>
<jsp:include page="allManage1.jsp"/>
<script type="text/javascript">
	function Yes(){
		var SOS = document.getElementsByName('SOS');
		var shezhi = "";
		for(var i=0;i<SOS.length;i++){
			if(SOS[i].checked){
				shezhi = shezhi +SOS[i].value+" ";
			}
		}		
	}
</script>
<body>
	<form action="${basePath}picture/newPic">
		<div id="img-list2">
			<div class="img">
				<img src="${basePath}page/images/1-1.jpg">
				<input type="checkbox" name="SOS" value="1-1.jpg">
			</div>
			<div class="img">
				<img src="${basePath}page/images/2-1.jpg">
				<input type="checkbox" name="SOS" value="2-1.jpg">
			</div>
			<div class="img">
				<img src="${basePath}page/images/2-2.jpg">
				<input type="checkbox" name="SOS" value="2-2.jpg">
			</div>
			<div class="img">
				<img src="${basePath}page/images/3-1.jpg">
				<input type="checkbox" name="SOS" value="3-1.jpg">
			</div>
			<div class="img">
				<img src="${basePath}page/images/4.jpg">
				<input type="checkbox" name="SOS" value="4.jpg">
			</div>
			<div class="img">
				<img src="${basePath}page/images/5.jpg">
				<input type="checkbox" name="SOS" value="5.jpg">
			</div>
		</div>
		<input type="submit" value="提交" onclick="Yes()"/>
	</form>
	<div id="shezhi" >
		选择需要轮播的图片（三张）：

	</div>
</body>
<jsp:include page="allManage2.jsp"/>
</html>