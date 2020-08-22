<%@ page language="java"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Staff"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
</head>

<%
	String sql = "select groups from staff where account=?";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> group = qr.query(sql, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>
<body>
	<div class="layui-card">
		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="view/views/home/console.html">首页</a>
				<a> <cite>员工列表</cite></a>
			</span>
		</div>
		<div class="x-body">
			<xblock>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
			<button class="layui-btn" onclick="x_admin_show('添加员工','${pageContext.request.contextPath}/view/views/user/staff-add.jsp',600,400)">
				<i class="layui-icon"></i>添加
			</button>
			<%}
			}
			%>
			<span class="x-right" style="line-height: 40px">总员工：${count}</span>
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>账号</th>
						<th>密码</th>
						<th>权限组</th>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
						<th>操作</th>
			<%}
			}
			%>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.staffList}" var="staff">
						<tr>
							<td>${staff.id}</td>
							<td>${staff.staffname}</td>
							<td>${staff.account}</td>
							<td>${staff.password}</td>
							<td>${staff.groups}</td>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
							<td class="td-manage">
							<a title="编辑" onclick="x_admin_show('编辑','${pageContext.request.contextPath}/view/views/user/staff-edit.jsp?id=${staff.id}&staffname=${staff.staffname}&account=${staff.account}&password=${staff.password}&groups=${staff.groups}',600,400)" href="javascript:void(0);">
							<button type="button" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe642;</i></button>
							</a> <a title="删除" onclick="member_del('${staff.id}')" href="javascript:void(0);">
							<button type="button" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon">&#xe640;</i></button>
							</a></td>
			<%}
			}
			%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<div>
					<c:if test="${pageBean.currentPage==1 }">
						<a class="layui-btn-disabled"><<</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="prev"	href="${pageContext.request.contextPath}/StaffList?currentPage=${pageBean.currentPage-1 }"><<</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.currentPage==page}">
							<span class="current" href="javascript:void(0);">${page}</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page}">
							<a class="num"
								href="${pageContext.request.contextPath}/StaffList?currentPage=${page}">${page}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">>></a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<a class="next" href="${pageContext.request.contextPath}/StaffList?currentPage=${pageBean.currentPage+1 }">>></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
		function member_del(id) {
			layer.confirm('确认要删除员工吗？',function(index) {
				layer.msg('员工已删除！', {	
					icon : 1,
					time : 1000});
				setTimeout(function() {
					location.href = "${pageContext.request.contextPath}/StaffDel?id="+ id;
					}, 1000);
				});
			}
	</script>

</body>

</html>