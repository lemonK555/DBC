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
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand">
					<small>
						<i class="icon-leaf"></i>
						DBC后台管理系统
					</small>
				</a><!-- /.brand -->
			</div><!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="grey">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="icon-tasks"></i>
							<span class="badge badge-grey">4</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="icon-ok"></i>
								还有4个任务完成
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">软件更新</span>
										<span class="pull-right">65%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width:65%" class="progress-bar "></div>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">硬件更新</span>
										<span class="pull-right">35%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width:35%" class="progress-bar progress-bar-danger"></div>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">单元测试</span>
										<span class="pull-right">15%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width:15%" class="progress-bar progress-bar-warning"></div>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">错误修复</span>
										<span class="pull-right">90%</span>
									</div>

									<div class="progress progress-mini progress-striped active">
										<div style="width:90%" class="progress-bar progress-bar-success"></div>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									查看任务详情
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<li class="purple">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="icon-bell-alt icon-animated-bell"></i>
							<span class="badge badge-important">8</span>
						</a>

						<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="icon-warning-sign"></i>
								8条通知
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">
											<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
											新闻评论
										</span>
										<span class="pull-right badge badge-info">+12</span>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									<i class="btn btn-xs btn-primary icon-user"></i>
									切换为编辑登录..
								</a>
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">
											<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
											新订单
										</span>
										<span class="pull-right badge badge-success">+8</span>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">
											<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
											粉丝
										</span>
										<span class="pull-right badge badge-info">+11</span>
									</div>
								</a>
							</li>

							<li>
								<a href="#">
									查看所有通知
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<li class="green">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="icon-envelope icon-animated-vertical"></i>
							<span class="badge badge-success">5</span>
						</a>

						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="icon-envelope-alt"></i>
								5条消息
							</li>

							<li>
								<a href="#">
									<img src="${basePath}page/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Alex:</span>
											不知道写啥 ...
										</span>

										<span class="msg-time">
											<i class="icon-time"></i>
											<span>1分钟以前</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<img src="${basePath}page/assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Susan:</span>
											不知道翻译...
										</span>

										<span class="msg-time">
											<i class="icon-time"></i>
											<span>20分钟以前</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<img src="${basePath}page/assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Bob:</span>
											到底是不是英文 ...
										</span>

										<span class="msg-time">
											<i class="icon-time"></i>
											<span>下午3:15</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="inbox.html">
									查看所有消息
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<li class="light-blue">
						<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							<img class="nav-user-photo" src="${basePath}page/assets/avatars/user.jpg" alt="Jason's Photo" />
							<span class="user-info">
								<small>欢迎光临,</small>
								Jason
							</span>

							<i class="icon-caret-down"></i>
						</a>

						<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li>
								<a href="#">
									<i class="icon-cog"></i>
									设置
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-user"></i>
									个人资料
								</a>
							</li>

							<li class="divider"></li>

							<li>
								<a href="#">
									<i class="icon-off"></i>
									退出
								</a>
							</li>
						</ul>
					</li>
				</ul><!-- /.ace-nav -->
			</div><!-- /.navbar-header -->
		</div><!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="icon-dashboard"></i>
							<span class="menu-text"> 控制台 </span>
						</a>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-list"></i>
							<span class="menu-text"> 用户管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="tables.html">
									<i class="icon-double-angle-right"></i>
									简单 &amp; 动态（用户申请）
								</a>
							</li>

							<li>
								<a href="${basePath}user/findUser">
									<i class="icon-double-angle-right"></i>
									用户信息
								</a>
							</li>
							<li>
								<a href="${basePath}user/findUserByBlackList">
									<i class="icon-double-angle-right"></i>
									黑名单
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-edit"></i>
							<span class="menu-text"> 表单 </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="form-elements.html">
									<i class="icon-double-angle-right"></i>
									表单组件
								</a>
							</li>

							<li>
								<a href="form-wizard.html">
									<i class="icon-double-angle-right"></i>
									向导提示 &amp; 验证
								</a>
							</li>

							<li>
								<a href="wysiwyg.html">
									<i class="icon-double-angle-right"></i>
									编辑器
								</a>
							</li>

							<li>
								<a href="dropzone.html">
									<i class="icon-double-angle-right"></i>
									文件上传
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="${basePath}picture/queryPic">
							<i class="icon-picture"></i>
							<span class="menu-text"> 图片管理 </span>
						</a>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-tag"></i>
							<span class="menu-text"> 产品管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="profile.html">
									<i class="icon-double-angle-right"></i>
									用户信息
								</a>
							</li>

							<li>
								<a href="inbox.html">
									<i class="icon-double-angle-right"></i>
									收件箱
								</a>
							</li>

							<li>
								<a href="pricing.html">
									<i class="icon-double-angle-right"></i>
									售价单
								</a>
							</li>

							<li>
								<a href="invoice.html">
									<i class="icon-double-angle-right"></i>
									购物车
								</a>
							</li>

							<li>
								<a href="${basePath}product/findProduct?id=2">
									<i class="icon-double-angle-right"></i>
									产品信息管理
								</a>
							</li>

							<li>
								<a href="${basePath}page/testManage.jsp">
									<i class="icon-double-angle-right"></i>
									图片轮播管理
								</a>
							</li>
						</ul>
					</li>
				</ul><!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>
	</body>
</html>