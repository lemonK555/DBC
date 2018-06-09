<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- basic styles -->
	<style type="text/css">@import url(${basePath}page/assets/css/bootstrap.min.css);</style>
	<style type="text/css">@import url(${basePath}page/assets/css/font-awesome.min.css);</style>
	<!-- page specific plugin styles -->
	<style type="text/css">@import url(${basePath}page/assets/css/ace.min.css);</style>
	<style type="text/css">@import url(${basePath}page/assets/css/ace-rtl.min.css);</style>
	<style type="text/css">@import url(${basePath}page/assets/css/ace-skins.min.css);</style>
	<!-- fonts -->
	<style type="text/css">@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300);</style>
	<script type="text/javascript" src="${basePath}page/assets/js/ace-extra.min.js"></script>
</head>
<jsp:include page="File.jsp"/>
<body>		
	<div class="ace-settings-container" id="ace-settings-container">
		<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
			<i class="icon-cog bigger-150"></i>
		</div>

		<div class="ace-settings-box" id="ace-settings-box">
			<div>
				<div class="pull-left">
					<select id="skin-colorpicker" class="hide">
						<option data-skin="default" value="#438EB9">#438EB9</option>
						<option data-skin="skin-1" value="#222A2D">#222A2D</option>
						<option data-skin="skin-2" value="#C6487E">#C6487E</option>
						<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
					</select>
				</div>
				<span>&nbsp; 选择皮肤</span>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
				<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
				<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
				<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
				<label class="lbl" for="ace-settings-rtl">切换到左边</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
				<label class="lbl" for="ace-settings-add-container">
					切换窄屏
					<b></b>
				</label>
			</div>
		</div>
	</div><!-- /#ace-settings-container -->
</div><!-- /.main-container-inner -->

	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
		<i class="icon-double-angle-up icon-only bigger-110"></i>
	</a>
</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]>

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${basePath}page/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${basePath}page/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="${basePath}page/assets/js/bootstrap.min.js"></script>
		<script src="${basePath}page/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

</body>
</html>