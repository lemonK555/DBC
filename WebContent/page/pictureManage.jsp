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
					<a href="#">图片</a>
				</li>
				<li class="active">图片管理</li>
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
					图片管理
					<small>
						<i class="icon-double-angle-right"></i>
						图片的新增、删除、修改、查询、设置
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div class="alert alert-info">
						<i class="icon-hand-right"></i>

						请注意操作的规范合理性
						<button class="close" data-dismiss="alert">
							<i class="icon-remove"></i>
						</button>
					</div>
					
					
					
<div class="row">
	<div class="col-xs-9">
		<div class="widget-header">
			<div class="col-sm-10">
				<h4>管理图片</h4>
			</div>
		</div>
		<div class="table-responsive">
			<table id="sample-table-1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>		
						</th>
						<th>图片序号</th>
						<th class="hidden-480">图片名称</th>
						<th class="hidden-480">图片功能</th>
						<th class="hidden-480">图片地址</th>
						<th class="hidden-480">图片</th>
						<th class="hidden-480">是否应用</th>
						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							更新时间
						</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${pictureForms}" var="p" varStatus="currentStatus">
						<tr>
							<td class="center">
								<label>
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${p.PID}</td>
							<td class="hidden-480">${p.picName}</td>
							<td class="hidden-480">${p.picFunctionName}</td>
							<td class="hidden-480">${p.picAddress}</td>
							<td class="hidden-480"><img src='${basePath}page/images/${p.picAddress}' style='height:50px;width:50px;'/></td>
							<td class="hidden-480">${p.picIsChecked}</td>
							<td class="hidden-480">${p.picReTime}</td>
							<td>
								<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
									<a href="#" onclick="addPic()" title="新增">
										<i class="icon-plus bigger-100"></i>
									</a>
									<a class="green" href="#" onclick="editPic(${p.PID})" title="修改">
										<i class="icon-pencil bigger-100"></i>
									</a>

									<a class="red" href="${basePath}picture/delPic?PID=${p.PID}" title="删除">
										<i class="icon-trash bigger-100"></i>
									</a>
									<a href="${basePath}picture/findPicByFunction" title="搜索">	
										<i class="icon-search bigger-100 red"></i>
									</a>
								</div>						
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- /.table-responsive -->
	</div><!-- /col -->
	
	<div class="col-xs-3">
			<form action=""class="form-horizontal" id="manageForm" style="visibility: hidden;position:relative;">
				
				<div class="widget-header">
					<h4><span id="titleName"></span></h4>
				</div>
				<div class="space-4"></div>
				<input type="hidden" id="PID" name="PID"/>
				
				<div class="form-group" name="picId">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">图片ID</label>
	
					<div class="col-sm-9">
						<input type="text" id="picId" name="picId" class="col-xs-10 col-sm-10" />
					</div>
				</div>

				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-2">图片名称</label>
	
					<div class="col-sm-9">
						<input type="text" id="picName" name="picName" class="col-xs-10 col-sm-10" />
					</div>
				</div>	
				<div class="space-4"></div>
					
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">功能名称</label>
	
					<div class="col-sm-9">			
						<select class="col-xs-12 col-sm-8" id="picFunctionName" name="picFunctionName" style="width:55%">
							<option value="lunbo">轮播图片</option>
							<option value="hot">热门图片</option>
							<option value="show">展示图</option>
							<option value="welcome">欢迎图</option>
							<option value="other">其他图片</option>	
						</select>
					 </div>						
				</div>
	
				<div class="space-4"></div>	
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">图片地址</label>
	
					<div class="col-sm-9">
						<input type="text" id="picAddress" name="picAddress" class="col-xs-10 col-sm-10" />
					</div>
				</div>
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否应用</label>
	
					<div class="col-sm-9">
						<label>
							<input name="Checked" id="Checked" onclick="IsChecked()" class="ace ace-switch ace-switch-7" type="checkbox" />
							<span class="lbl"></span>
							<input name="picIsChecked" id="picIsChecked" value="false" type="hidden">
						</label>
					</div>
				</div>

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

        	 manageForm.style.visibility = "visible";
        	 manageForm.action = "editPic";
        }
    });
	}

</script>
</html>