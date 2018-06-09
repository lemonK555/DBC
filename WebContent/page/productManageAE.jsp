<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>后台管理系统</title>
	<!-- basic styles -->
	<style type="text/css">@import url(${basePath}../page/assets/css/bootstrap.min.css);</style>
	<style type="text/css">@import url(${basePath}../page/assets/css/font-awesome.min.css);</style>
	<!-- page specific plugin styles -->
	<style type="text/css">@import url(${basePath}../page/assets/css/jquery-ui-1.10.3.full.min.css);</style>
	<style type="text/css">@import url(${basePath}../page/assets/css/datepicker.css);</style>
	<style type="text/css">@import url(${basePath}../page/assets/css/ui.jqgrid.css);</style>
	
	<style type="text/css">@import url(${basePath}../page/css/main.css);</style>

</head>
<jsp:include page="File.jsp"/>
<jsp:include page="allManage1.jsp"/>
<body>
	<div class="main-content">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">首页</a>
				</li>

				<li>
					<a href="#">产品</a>
				</li>
				<li class="active">产品管理</li>
			</ul><!-- .breadcrumb -->

			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!-- #nav-search -->
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					产品管理
					<small>
						<i class="icon-double-angle-right"></i>
						产品的新增、删除、修改、查询、设置
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
	
	<div class="col-xs-12">
			<form action="" class="form-horizontal" id="AEForm" style="display:none;position:relative;left:100%;float:left;">
				
				<div class="widget-header">
					<h4><span id="titleName"></span></h4>
				</div>
				<div class="space-4"></div>
				
				<input type="hidden" id="productId" name="productId" class="col-xs-10 col-sm-10"  />

				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-2">产品名称</label>
	
					<div class="col-sm-9">
						<input type="text" id="productName" name="productName" class="col-xs-10 col-sm-10" />
					</div>
				</div>	
				<div class="space-4"></div>
					
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">产品分类</label>
	
					<div class="col-sm-9">			
						<select class="col-xs-12 col-sm-6" id="categoryId" name="categoryId" style="width:40%">
							<option value="1001">普通</option>
							<option value="1002">热门</option>
							<option value="1003">TOP</option>
								
						</select>
					 </div>						
				</div>
	
				<div class="space-4"></div>	
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">关键字</label>
	
					<div class="col-sm-9">
						<input type="text" id="productKeys" name="productKeys" class="col-xs-10 col-sm-10" />
					</div>
				</div>
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">产品描述</label>
	
					<div class="col-sm-9">
						<input type="text" id="productDescription" name="productDescription" class="col-xs-10 col-sm-10" />
					</div>
				</div>
				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">图片名称</label>
	
					<div class="col-sm-9">			
						<select class="col-xs-12 col-sm-8" id="productImgId" name="productImgId" style="width:55%">
							<c:forEach items="${pictureForms}" var="p" varStatus="currentStatus">
								<option value="${p.PID}"><img src="${basePath}page/images/${p.picAddress}">${p.picName}</option>
							</c:forEach>
						</select>
					 </div>	
				</div>
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">产品价格</label>
	
					<div class="col-sm-9">
						<label>
							<input type="text" name="productPriceUser" id="productPriceUser" class="col-xs-10 col-sm-10" />
							<span class="lbl"></span>
		
						</label>
					</div>
				</div>
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否推荐</label>
	
					<div class="col-sm-9">
						<label>
							<input name="Checked" id="Checked" onclick="IsChecked()" value="false" class="ace ace-switch ace-switch-7" type="checkbox" />
							<span class="lbl"></span>
							<input type="hidden" name="productIsVouch" id="productIsVouch" value="false"/>
						</label>
					</div>
				</div>
				<div class="space-4"></div>
				<input type="hidden" name="productHits" id="productHits" value="0"/>
				<input type="hidden" name="productReviews" id="productReviews"value="0"/>
				<input type="hidden" name="productOrderNum" id="productOrderNum" value="0"/>
				<input type="hidden" name="productBuyNum" id="productBuyNum" value="0"/>
				<input type="hidden" name="productInTime" id="productInTime" value="0"/>
				

				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-5">
						<button class="btn btn-info" type="submit">
							<i class="icon-ok bigger-110"></i>
							提交
						</button>
	
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="reset">
							<i class="icon-undo bigger-110"></i>
							重写
						</button>
					</div>
				</div>
			</form>
	</div><!-- /row -->
	
					<script type="text/javascript">
						var $path_base = "/";//this will be used in gritter alerts containing images
					</script>

					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
<jsp:include page="allManage2.jsp"/>			
</body>	
	<!-- ace scripts -->
	<script src="${basePath}page/assets/js/ace-elements.min.js"></script>
	<script src="${basePath}page/assets/js/ace.min.js"></script>
	
<!-- inline scripts related to this page -->
	
<script type="text/javascript">
/*pictureManage*/
	var manageForm = document.getElementById('manageForm');
	var picId = document.getElementById('picId');
	var picName = document.getElementById('picName');
	var picFunctionName = document.getElementById('picFunctionName');
	var picAddress = document.getElementById('picAddress');
	var titleName = document.getElementById('titleName');
	var picIsChecked = document.getElementById('picIsChecked');
	
	function IsChecked(){
		var Checked = document.getElementById('Checked');
		var picIsChecked = document.getElementById('picIsChecked');	
		picIsChecked.value=Checked.checked;
	}
	/*添加图片*/
	function addPic(){
		titleName.innerHTML = "新增图片";
		manageForm.style.visibility = "visible";
		manageForm.action = "addPic";
	}
	/*修改图片*/
	function editPic(e){
		
		titleName.innerHTML = "修改图片";
		 $.ajax({
         type: "post",
         url: "/DBC/picture/findPicByPID?PID="+e,
   	    contentType:"application/json;charset=utf-8",
				data:null,
	   			dataType:"json",
         success: function(data){
        	 PID.value = data.pid;
        	 picId.value = data.picId;
        	 picName.value = data.picName;
        	 picFunctionName.value = data.picFunctionName;
        	 picAddress.value = data.picAddress;
        	 picIsChecked.value = data.picIsChecked;
        	 manageForm.style.visibility = "visible";
        	 manageForm.action = "editPic";
        }
    });
	}

</script>
</html>