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
	String result = request.getParameter("fuzeren");
	String[] people = result.split(",");
	request.setCharacterEncoding("utf-8");
	String sql = "select staffname from staff";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr.query(sql, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form" action="${pageContext.request.contextPath}/XinxuqiuEdit" method="post">
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
				<label class="layui-form-label">
					<span class="x-red">*</span>提出时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="会议开始时间" name="tichushijian" value="<%=request.getParameter("tichushijian")%>" id="tichushijian" required="" lay-verify="required" autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label">
					<span class="x-red">*</span>完成天数
				</label>
				<div class="layui-input-inline">
					<input type="text" id="wanchengtianshu" value="<%=request.getParameter("wanchengtianshu")%>" name="wanchengtianshu" required="" lay-verify="day" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">天</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>负责人</label>
				<div class="layui-input-inline">
					<%
						for (Staff s : staff) {
					%>
						<input type="checkbox" name="fuzeren" title="<%=s.getStaffname()%>" value="<%=s.getStaffname()%>">
					<%
						}
					%>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>执行组
				</label>
				<div class="layui-input-inline">
					<input type="text" id="zhixingzu" name="zhixingzu" required="" value="<%=request.getParameter("zhixingzu") %>" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>需求类型</label>
				<div class="layui-input-inline">
					<select name="xuqiuleixing" required="" lay-verify="required">
						<option class="layui-input" value="<%=request.getParameter("xuqiuleixing") %>" lay-skin="primary"><%=request.getParameter("xuqiuleixing") %></option>
						<option class="layui-input" value="新增功能" lay-skin="primary">新增功能</option>
						<option class="layui-input" value="修改功能" lay-skin="primary">修改功能</option>
						<option class="layui-input" value="问题修复" lay-skin="primary">问题修复</option>
						<option class="layui-input" value="其他" lay-skin="primary">其他</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>说明
				</label>
				<div class="layui-input-block">
					<textarea type="text" id="shuoming" name="shuoming" required="" value="" lay-verify="required" autocomplete="off" class="layui-textarea"><%=request.getParameter("shuoming") %></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add" lay-submit="">修改</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			var laydate = layui.laydate;
			form.verify({
				wanchengtianshu : [ /^\d+$/, '天数必须>=0' ]
			});
			laydate.render({
				elem : '#tichushijian'
					,calendar: true	
			});

			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("修改成功", {
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