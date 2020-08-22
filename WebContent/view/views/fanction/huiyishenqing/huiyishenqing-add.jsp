<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Staff,java.util.Calendar,java.text.SimpleDateFormat"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript"	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js"	charset="utf-8"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String sql = "select staffname from staff";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr.query(sql, new BeanListHandler<Staff>(Staff.class));
%>
<body>
	<div class="x-body">
		<form class="layui-form" action="${pageContext.request.contextPath}/HuiyishenqingAdd"	method="post">
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>申请人</label>
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
				<label class="layui-form-label">
         <span	class="x-red">*</span>申请时间
				</label>
				<%
				Calendar calendar= Calendar.getInstance();
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
				%>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="申请时间" value="<%=dateFormat.format(calendar.getTime()) %>" name="shenqingshijian" id="shenqingshijian" required="" lay-verify="required" autocomplete="off" type="text">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
         <span	class="x-red">*</span>会议开始时间
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="会议开始时间" name="begin"	id="begin" required="" lay-verify="required" autocomplete="off"	type="text">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">
        
         <span class="x-red">*</span>会议地点
				</label>
				<div class="layui-input-inline">
					<input type="text" id="huiyididian" name="huiyididian" required="" lay-verify="huiyididian" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">
        
         <span class="x-red">*</span>会议内容
				</label>
				<div class="layui-input-block">
					<textarea type="text" id="huiyineirong" name="huiyineirong" required=""	lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button type="submit" class="layui-btn" lay-filter="add"	lay-submit="">增加</button>
			</div>
		</form>
	</div>
	<script>
	layui.use([ 'form', 'layer', 'laydate' ], function() {
		$ = layui.jquery;
		var form = layui.form, layer = layui.layer;

		var laydate = layui.laydate;
		
		laydate.render({
			elem : '#begin'
			,calendar: true
			,type: 'datetime'
		});
		
		laydate.render({
			elem : '#shenqingshijian'
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