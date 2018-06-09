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
					<table id="grid-table"></table>
					<div id="grid-pager"></div>

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
	<!-- page specific plugin scripts -->
	<script src="${basePath}page/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${basePath}page/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="${basePath}page/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
	<!-- ace scripts -->
	<script src="${basePath}page/assets/js/ace-elements.min.js"></script>
	<script src="${basePath}page/assets/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

	<script type="text/javascript">
		var grid_data = 
		[ 
			<c:forEach items="${pictures}" var="p" varStatus="currentStatus">
				{PID:"${p.PID}",picId:"${p.picId}",picName:"${p.picName}",picFunctionName:"${p.picFunctionName}",picImage:"<img src='${basePath}page/images/${p.picAddress}' style='height:50px;width:50px;'/>",picAddress:"${p.picAddress}",stock:"${p.picIsChecked}", picReTime:"${p.picReTime}"},
			</c:forEach>
			
		];	
		
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
			
			
			jQuery(grid_selector).jqGrid({
				//direction: "rtl",
				data: grid_data,
				datatype: "local",
				height: 250,
				colNames:[' ', '序号','图片ID','图片名称','图片功能','图片','图片地址', '是否应用','更新时间'],
				colModel:[
					{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
						formatter:'actions', 
						formatoptions:{ 
							keys:true,
							
							delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
							//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
						}
					},
					{name:'PID',index:'PID',width:30, editable: false,key:true},
					{name:'picId',index:'picId',width:60, editable: true},
					{name:'picName',index:'picName',width:150,editable: true, sortable:false,edittype:"textarea", editoptions:{rows:"2",cols:"20"}},
					{name:'picFunctionName',index:'picFunctionName', width:60, editable: true,edittype:"select",editoptions:{value:"lunbo:轮播图片;hot:热门图片;large:展示大图;small:展示小图;other:其他图片"}},
					{name:'picImage',index:'picImage', width:60, editable: false},
					{name:'picAddress',id:'picAddress',index:'picAddress', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'stock',index:'stock',width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
					{name:'picReTime',index:'picReTime',width:90, editable:false, sorttype:"date",unformat: pickDate},
				], 
		
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,30],
				pager : pager_selector,
				altRows: true,
				toppager: true,//
				
				multiselect: true,
				multikey: "ctrlKey",//
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				},
		
				editurl: $path_base+"DBC/picture/manage",//nothing is saved
				caption: "jqGrid with inline editing",
		
		
				autowidth: true
		
			});
				
			//enable search/filter toolbar
			//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
		
			//switch element when editing inline
			function aceSwitch( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
							.wrap('<label class="inline" />')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			function pickDate( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=text]')
							.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
				}, 0);
			}
		
		
			//navButtons
			jQuery(grid_selector).jqGrid('navGrid',pager_selector,
				{ 	//navbar options
					edit: true,
					editicon : 'icon-pencil blue',
					add: true,
					addicon : 'icon-plus-sign purple',
					del: true,
					delicon : 'icon-trash red',
					search: true,
					searchicon : 'icon-search orange',
					refresh: true,
					refreshicon : 'icon-refresh green',
					view: true,
					viewicon : 'icon-zoom-in grey',
				},
				{
					//edit record form
					//closeAfterEdit: true,
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//new record form
					closeAfterAdd: true,
					recreateForm: true,
					viewPagerButtons: false,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//delete record form
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						if(form.data('styled')) return false;
						
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_delete_form(form);
						form.data('styled', true);
					},
					onClick : function(e) {
						alert(1);
					}
				},
				{
					//search form
					recreateForm: true,
					afterShowSearch: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						style_search_form(form);
					},
					afterRedraw: function(){
						style_search_filters($(this));
					}
					,
					multipleSearch: true,
					/**
					multipleGroup:true,
					showQuery: true
					*/
				},
				{
					//view record form
					recreateForm: true,
					beforeShowForm: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					}
				}
			)
	
			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					.end().find('input[name=stock]')
						  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
		
				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
				//document.getElementById('sData').setAttribute("href","DBC/picture/addPic");//
				buttons.eq(1).prepend('<i class="icon-remove"></i>')
				
				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').remove();
				buttons.eq(0).append('<i class="icon-chevron-left"></i>');
				buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
			}
		
			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
				buttons.eq(1).prepend('<i class="icon-remove"></i>')
			}
			
			function style_search_filters(form) {
				form.find('.delete-rule').val('X');
				form.find('.add-rule').addClass('btn btn-xs btn-primary');
				form.find('.add-group').addClass('btn btn-xs btn-success');
				form.find('.delete-group').addClass('btn btn-xs btn-danger');
			}
			function style_search_form(form) {
				var dialog = form.closest('.ui-jqdialog');
				var buttons = dialog.find('.EditTable')
				buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
				buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
			}
			
			function beforeDeleteCallback(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			}
			
			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		
		
		
			//it causes some flicker when reloading or navigating grid
			//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
			//or go back to default browser checkbox styles for the grid
			function styleCheckbox(table) {

/*
				$(table).find('input:checkbox').addClass('ace')
				.wrap('<label />')
				.after('<span class="lbl align-top" />')
		
		
				$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
				.find('input.cbox[type=checkbox]').addClass('ace')
				.wrap('<label />').after('<span class="lbl align-top" />');
*/

			}
			
		
			//unlike navButtons icons, action icons in rows seem to be hard-coded
			//you can change them like this in here if you want
			function updateActionIcons(table) {
			/*	
				var replacement = 
				{
					'ui-icon-pencil' : 'icon-pencil blue',
					'ui-icon-trash' : 'icon-trash red',
					'ui-icon-disk' : 'icon-ok green',
					'ui-icon-cancel' : 'icon-remove red'
				};
				$(table).find('.ui-pg-div span.ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
				*/
			}
			
			//replace icons with FontAwesome icons like above
			function updatePagerIcons(table) {
				var replacement = 
				{
					'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
					'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
					'ui-icon-seek-next' : 'icon-angle-right bigger-140',
					'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
				};
				$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
			}
		
			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({container:'body'});
				$(table).find('.ui-pg-div').tooltip({container:'body'});
			}
		
			//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
		
		
		});
	</script>
</html>