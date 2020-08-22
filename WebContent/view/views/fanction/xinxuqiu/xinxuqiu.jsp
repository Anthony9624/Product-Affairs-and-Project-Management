<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Staff"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title></title>
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
	String sql = "select groups from staff where account=?";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> group = qr.query(sql, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>

<body>
	<div class="layui-card">

		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="view/views/home/console.html">首页</a>
				<a> <cite>新增需求</cite></a>
			</span>
		</div>
		<div class="x-body">
			<xblock>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
			<button class="layui-btn" onclick="x_admin_show('添加新增需求','${pageContext.request.contextPath}/view/views/fanction/xinxuqiu/xinxuqiu-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>
			<%}
				else if(s.getGroups().equals("member")){%>
			<button class="layui-btn" onclick="x_admin_show('添加新增需求','${pageContext.request.contextPath}/view/views/fanction/xinxuqiu/xinxuqiu-add.jsp')">
				<i class="layui-icon"></i>添加
			</button><%
				}
			}
			%>
			<span class="x-right" style="line-height: 40px">共有需求：${count } 条</span> 
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>编号</th>
						<th>提出时间</th>
						<th>完成天数</th>
						<th>负责人</th>
						<th>执行组</th>
						<th>需求类型</th>
						<th>说明</th>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
						<th>操作</th>
			<%}
			}
			%>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.xinxuqiuList}" var="xinxuqiu">
						<tr>
							<td>${xinxuqiu.id}</td>
							<td>${xinxuqiu.tichushijian}</td>
							<td>${xinxuqiu.wanchengtianshu}天</td>
							<td>${xinxuqiu.fuzeren}</td>
							<td>${xinxuqiu.zhixingzu}</td>
							<td>${xinxuqiu.xuqiuleixing}</td>
							<td>${xinxuqiu.shuoming}</td>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
							<td class="td-manage">
							<a title="编辑"
								onclick="x_admin_show('编辑','${pageContext.request.contextPath}/view/views/fanction/xinxuqiu/xinxuqiu-edit.jsp?id=${xinxuqiu.id}&tichushijian=${xinxuqiu.tichushijian}&wanchengtianshu=${xinxuqiu.wanchengtianshu}&fuzeren=${xinxuqiu.fuzeren}&zhixingzu=${xinxuqiu.zhixingzu}&xuqiuleixing=${xinxuqiu.xuqiuleixing}&shuoming=${xinxuqiu.shuoming}')" href="javascript:void(0);">
								 <button type="button" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe642;</i></button>
							</a>
							 <a title="删除" onclick="member_del('${xinxuqiu.id}')" href="javascript:void(0);"> <button type="button" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon">&#xe640;</i></button>
							</a>
			<%}
			}
			%></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<div>
					<c:if test="${pageBean.currentPage==1 }">
						<a class="layui-btn-disabled">&lt;&lt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="prev" href="${pageContext.request.contextPath}/XinxuqiuList?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.currentPage==page}">
							<span class="current" href="javascript:void(0);">${page}</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page}">
							<a class="num" href="${pageContext.request.contextPath}/XinxuqiuList?currentPage=${page}">${page}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<a class="next" href="${pageContext.request.contextPath}/XinxuqiuList?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			laydate.render({
				elem : '#start'
				,calendar: true	
			});

			laydate.render({
				elem : '#end'
				,calendar: true	
			});
		});

		function member_del(id) {
			layer.confirm(
				'确认要删除吗？',
				function(index) {
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
						});
					setTimeout(
						function() {
							location.href = "${pageContext.request.contextPath}/XinxuqiuDel?id="
									+ id;
							}, 1000);
					});
		}
	</script>

</body>

</html>