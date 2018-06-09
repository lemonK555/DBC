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
					<a href="#">用户</a>
				</li>
				<li class="active">信息管理</li>
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
					用户信息管理
					<small>
						<i class="icon-double-angle-right"></i>
						用户删除、修改、查询、设置
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
	<div class="col-xs-12">
		<div class="widget-header">
			<div class="col-sm-10">
				<h4>管理用户</h4>
			</div>
		</div>
		<div class="table-responsive" id="sample">
			<table id="sample-table-1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>		
						</th>
						<th>用户ID</th>
						<th>vipID</th>
						<th class="hidden-480">昵称</th>
						<th class="hidden-480">密码</th>
						<th class="hidden-480">真实姓名</th>
						<th class="hidden-480">性别</th>
						<th class="hidden-480">生日</th>
						<th class="hidden-480">手机号码</th>
						<th class="hidden-480">电子邮箱</th>
						<th class="hidden-480">积分</th>
						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							创建时间
						</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody>
					<tr id="findOne">
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>
						<td>${userForm.userID}</td>
						<td>${userForm.vipID}</td>
						<td class="hidden-480">${userForm.userName}</td>
						<td class="hidden-480">${userForm.userPwd}</td>
						<td class="hidden-480">${userForm.userRealName}</td>
						<td class="hidden-480">${userForm.userSex}</td>
						<td class="hidden-480">${userForm.userBirthday}</td>
						<td class="hidden-480">${userForm.userMobile}</td>
						<td class="hidden-480">${userForm.userEmail}</td>
						<td class="hidden-480">${userForm.userPoint}</td>
						<td class="hidden-480">${userForm.userCreatTime}</td>
						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
	
								<a class="yellow" href="${basePath}user/addUserInBlackList?userName=${p.userName}" title="加入黑名单">
									<i class="icon-remove-sign bigger-100"></i>
								</a>
								
							</div>						
						</td>
					</tr>
				</tbody>
			</table>
			
		</div><!-- /.table-responsive -->
	</div><!-- /col -->
	
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

</script>
</html>