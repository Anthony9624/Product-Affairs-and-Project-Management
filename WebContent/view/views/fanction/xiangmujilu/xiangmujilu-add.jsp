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
	request.setCharacterEncoding("utf-8");
	String sql = "select staffname from staff";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr.query(sql, new BeanListHandler<Staff>(Staff.class));
	String sql2 = "select staffname from staff where account=?";
	QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff1 = qr2.query(sql2, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>
<body>
	<div class="x-body">
		<form class="layui-form" action="${pageContext.request.contextPath}/xiangmujiluAdd" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>项目开始时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="项目开始时间" name="kaishishijian" id="kaishishijian" required="" lay-verify="required" autocomplete="off" type="text">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>项目阶段</label>
				<div class="layui-input-inline">
					<select name="jieduan" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">项目阶段</option>
						<option class="layui-input" value="需求整理" lay-skin="primary">需求整理</option>
						<option class="layui-input" value="原型设计" lay-skin="primary">原型设计</option>
						<option class="layui-input" value="UI设计" lay-skin="primary">UI设计</option>
						<option class="layui-input" value="开发中" lay-skin="primary">开发中</option>
						<option class="layui-input" value="测试" lay-skin="primary">测试</option>
						<option class="layui-input" value="返工" lay-skin="primary">返工</option>
						<option class="layui-input" value="交付" lay-skin="primary">交付</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>项目负责人</label>
				<div class="layui-input-inline">
					<select name="staffname" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">请选择</option>
						<%
							for (Staff s : staff) {
						%>
						<option class="layui-input" value="<%=s.getStaffname()%>" lay-skin="primary"><%=s.getStaffname()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>项目名称</label>
				<div class="layui-input-inline">
					<input type="text" id="xiangmumingcheng" name="xiangmumingcheng" required="" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>说明
				</label>
				<div class="layui-input-block">
					<textarea type="text" id="shuoming" name="shuoming" required="" lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>优先级</label>
				<div class="layui-input-inline">
					<select name="youxianji" required="" lay-verify="required">
						<option class="layui-input" value="" lay-skin="primary">优先级</option>
						<option class="layui-input" value="最高" lay-skin="primary">最高</option>
						<option class="layui-input" value="高" lay-skin="primary">高</option>
						<option class="layui-input" value="中等" lay-skin="primary">中等</option>
						<option class="layui-input" value="低" lay-skin="primary">低</option>
						<option class="layui-input" value="很低" lay-skin="primary">很低</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">
					<span class="x-red">*</span>记录人
				</label>
				<div class="layui-input-inline">
	          		<%
						for (Staff s : staff1) {
					%>
					<input type="text" id="jiluren" name="jiluren" required="" readonly="readonly" 
					value="<%=s.getStaffname()%>" lay-verify="required" autocomplete="off" class="layui-input">
					<%
						}
					%>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add" lay-submit="">增加</button>
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer', 'laydate' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#kaishishijian'
				,calendar: true				
			});

			form.on('submit(add)', function(data) {
				console.log(data);
				layer.alert("增加成功", {
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