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
	
	<style type="text/css">@import url(${basePath}../page/res/bootstrap.min.css)</style>
	<style type="text/css">@import url(${basePath}../page/res/myPage.css)</style>
    
	
</head>
<jsp:include page="File.jsp"/>
<jsp:include page="allManage1.jsp"/>
	<script src="${basePath}page/res/jquery-1.7.2.min.js"></script>
    <script src="${basePath}page/res/jqPaginator.min.js"></script>
    <script src="${basePath}page/res/myPage.js"></script>
    <script type="text/javascript">
    function loadData(num) {
    	var count = document.getElementById('count').value;
    	$("#PageCount").val(count);
    
    }
    </script>
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
					<!-- PAGE CONTENT BEGINS -->

					<div class="alert alert-info">
						<i class="icon-hand-right"></i>

						请注意操作的规范合理性
						<button class="close" data-dismiss="alert">
							<i class="icon-remove"></i>
						</button>
					</div>
					
	<form id="form1" runat="server">					
		<div>	
		
				
<div class="row">
	<div class="col-xs-12"  id="products" style="display: block;float:left;">
		<div class="widget-header">
			<div class="col-sm-10">
				<h4>管理产品
					<a href="#" onclick="addProduct(${p.productId})" title="新增" style="margin-left:10px;">
						<i class="icon-plus bigger-100"></i>
					</a>					
				</h4>
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
						<th>产品序号</th>
						<th>产品名称</th>
						<th class="hidden-480">分类</th>
						<th class="hidden-480">关键字</th>
						<th class="hidden-480">描述</th>
						<th class="hidden-480">展示图</th>
						<th class="hidden-480">价格</th>
						<th class="hidden-480">是否推荐</th>
						<th class="hidden-480">点击数</th>
						<th class="hidden-480">评论数</th>
						<th class="hidden-480">下单数</th>
						<th class="hidden-480">交易成功</th>
						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							上架时间
						</th>
						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							更新时间
						</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${products}" var="p" varStatus="currentStatus">
						<c:if test="${currentStatus.last}">
							<input type="hidden" id="count" value="${currentStatus.count}">
						</c:if>
						<tr>
							<td class="center">
								<label>
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${p.productId}</td>
							<td>${p.productName}</td>
							<td>${p.categoryId}</td>
							<td>${p.productKeys}</td>
							<td>${p.productDescription}</td>
							<td><img src='${basePath}page/images/${p.picAddress}' style='height:50px;width:50px;'/></td>
							<td>${p.productPriceUser}</td>
							<td>${p.productIsVouch}</td>
							<td>${p.productHits}</td>
							<td>${p.productReviews}</td>
							<td>${p.productOrderNum}</td>
							<td>${p.productBuyNum}</td>
							<td>${p.productInTime}</td>
							<td>${p.productReTime}</td>
							<td>
								<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
									<a class="green" href="#" onclick="editProduct(${p.productId})" title="修改">
										<i class="icon-pencil bigger-100"></i>
									</a>

									<a class="red" href="${basePath}product/delProduct?productId=${p.productId}" title="删除">
										<i class="icon-trash bigger-100"></i>
									</a>
								</div>						
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- /.table-responsive -->
	</div><!-- /col -->
	

	    </div>
	    <div>
	        <ul class="pagination" id="pagination">
	        </ul>
	        <input type="hidden" id="PageCount" runat="server" />
	        <input type="hidden" id="PageSize" runat="server" value="5" />
	        <input type="hidden" id="countindex" runat="server" />
	        <!--设置最多显示的页码数 可以手动设置 默认为7-->
	        <input type="hidden" id="visiblePages" runat="server" value="5" />
	    </div>
	    
    </form>
	
	
	
	
	
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
							<option value="1004">新品</option>
								
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
						<select onchange="ImgId()" id="productImgId" name="productImgId" value="${pictureForms[0].PID}" class="col-xs-12 col-sm-8" style="width:55%">
							<c:forEach items="${pictureForms}" var="p" varStatus="currentStatus">
								<option value="${p.PID}">${p.picName}</option>
					
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

function loadData(num) {
	var count = document.getElementById('count').value;
	$("#PageCount").val(count);
	

}
/*pictureManage*/

	var products = document.getElementById('products');
	var AEForm = document.getElementById('AEForm');
	var titleName = document.getElementById('titleName');
	
	var productId = document.getElementById('productId');
	var productImgId = document.getElementById('productImgId');
	var productName = document.getElementById('productName');
	var picAddress = document.getElementById('picAddress');
	var categoryId = document.getElementById('categoryId');
	var productKeys = document.getElementById('productKeys');
	var productDescription = document.getElementById('productDescription');
	var productPriceUser = document.getElementById('productPriceUser');
	var productIsVouch = document.getElementById('productIsVouch');
	var productInTime = document.getElementById('productInTime');

	function editProduct(e){	
		titleName.innerHTML = "修改产品";
		$.ajax({
        type: "post",
        url: "/DBC/product/findProductById?productId="+e,
  	    contentType:"application/json;charset=utf-8",
				data:null,
	   			dataType:"json",
        success: function(data){        	
        	productId.value = data.productId;
        	productName.value = data.productName;
        	categoryId.value = data.categoryId;
        	productKeys.value = data.productKeys;
        	productDescription.value = data.productDescription;
        	productPriceUser.value = data.productPriceUser;
        	
        	var date = new Date();
        	var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        	var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        	date.setTime(data.productInTime);  //value通过截取字符串只取数字。
        	productInTime.value = date.getFullYear() + "-" + month + "-" + currentDate + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        	
        	products.style.display = "none";
    		AEForm.style.display = "block";          	
       	 	AEForm.action = "editProduct";
	        }
	    });
	}
	function addProduct(e){
		titleName.innerHTML = "新增产品";
		products.style.display = "none";
		AEForm.style.display = "block";
		AEForm.action = "addProduct";
	}
	
	function IsChecked(){
		var Checked = document.getElementById('Checked');
		var productIsVouch = document.getElementById('productIsVouch');	
		productIsVouch.value=Checked.checked;
	}
	function ImgId(){
		var productImgId = document.getElementById('productImgId');
		var index = productImgId.selectedIndex;
		productImgId.value = productImgId.options[index].value;
	}
</script>
</html>