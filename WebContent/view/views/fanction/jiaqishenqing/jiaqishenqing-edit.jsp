<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Staff"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
</head>
<%
	String day = request.getParameter("shichang");
	request.setCharacterEncoding("utf-8");
	String sql = "select staffname from staff";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr.query(sql, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form" action="${pageContext.request.contextPath}/JiaqishenqingEdit" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>ID
				</label>
				<div class="layui-input-inline">
					<input type="text" id="id" name="id" required=""
						readonly="readonly" value="<%=request.getParameter("id")%>" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>申请人</label>
				<div class="layui-input-inline">
					<select name="staffname" required="" lay-verify="required">
						<option class="layui-input" value="<%=request.getParameter("staffname")%>" lay-skin="primary"><%=request.getParameter("staffname")%></option>
						<%
							for (Staff sta : staff) {
						%>
						<option class="layui-input" value="<%=sta.getStaffname()%>" lay-skin="primary"><%=sta.getStaffname()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>开始时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="开始时间" name="kaishishijian"
						value="<%=request.getParameter("kaishishijian")%>" id="kaishishijian" required="" lay-verify="required" autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>结束时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="结束时间" name="jieshushijian"
						value="<%=request.getParameter("jieshushijian")%>" id="jieshushijian" required="" lay-verify="required" autocomplete="off" type="text">
				<div class="layui-form-mid layui-word-aux">（需先选择开始时间）</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label">
					<span class="x-red">*</span>时长
				</label>
				<div class="layui-input-inline">
					<input type="text" id="day" name="day" required="" lay-verify="day"
						value="<%=day%>" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">天</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>假期类别</label>
				<div class="layui-input-inline">
					<select name="jiaqileixing" required="" lay-verify="required">
						<option class="layui-input" value="<%=request.getParameter("jiaqileixing")%>" lay-skin="primary"><%=request.getParameter("jiaqileixing")%></option>
						<option class="layui-input" value="事假" lay-skin="primary">事假</option>
						<option class="layui-input" value="病假" lay-skin="primary">病假</option>
						<option class="layui-input" value="产假" lay-skin="primary">产假</option>
						<option class="layui-input" value="调休" lay-skin="primary">调休</option>
						<option class="layui-input" value="出差" lay-skin="primary">出差</option>
						<option class="layui-input" value="其他原因" lay-skin="primary">其他原因</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>原因
				</label>
				<div class="layui-input-block">
					<textarea type="text" id="yuanyin" name="yuanyin" required="" value="" lay-verify="required" autocomplete="off" class="layui-textarea"><%=request.getParameter("yuanyin")%></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>状态</label>
				<div class="layui-input-inline">
					<select name="zhuangtai" required="" lay-verify="required">
						<option class="layui-input" value="<%=request.getParameter("zhuangtai")%>" lay-skin="primary"><%=request.getParameter("zhuangtai")%></option>
						<option class="layui-input" value="等待批准" lay-skin="primary">等待批准</option>
						<option class="layui-input" value="已通过" lay-skin="primary">已通过</option>
						<option class="layui-input" value="未通过" lay-skin="primary">未通过</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add" lay-submit="">保存</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var laydate = layui.laydate;
			form.verify({
				day : [ /^\d+$/, '天数必须>=0' ],
			});
			//执行一个laydate实例
			laydate.render({
				elem : '#kaishishijian'
				,type : 'date'
				,calendar: true	
			});
			laydate.render({
				elem : '#jieshushijian'
				,type : 'date'
				,calendar: true	
			});
			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("保存成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
					parent.location.reload();

				});

			});

		});
	</script>

</body>

</html>