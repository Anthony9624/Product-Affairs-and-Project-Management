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
	request.setCharacterEncoding("utf-8");
	String sql = "select groups FROM staff where account=?";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> group = qr.query(sql, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
	String sql2 = "select staffname from staff where account=?";
	QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr2.query(sql2, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>

<body>
	<div class="layui-card">
		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="view/views/home/console.html">首页</a>
				<a> <cite>项目管理</cite></a>
			</span>
		</div>
		<div class="x-body">
			<xblock>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
			<button class="layui-btn" onclick="x_admin_show('添加项目记录','${pageContext.request.contextPath}/view/views/fanction/xiangmujilu/xiangmujilu-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>				
			<%}
			}
			%>
			<span class="x-right" style="line-height: 40px">共有项目记录：${count} 条</span> 
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>项目编号</th>
						<th>项目开始时间</th>
						<th>项目阶段</th>
						<th>项目负责人</th>
						<th>项目名称</th>
						<th>说明</th>
						<th>优先级</th>
						<th>记录人</th>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
						<th>操作</th>				
			<%}
			}
			%>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.xiangmujiluList}" var="xiangmujilu">
						<tr>
							<td>${xiangmujilu.id}</td>
							<td>${xiangmujilu.kaishishijian}</td>
							<td>${xiangmujilu.jieduan}</td>
							<td>${xiangmujilu.staffname}</td>
							<td>${xiangmujilu.xiangmumingcheng}</td>
							<td>${xiangmujilu.shuoming}</td>
							<td>${xiangmujilu.youxianji}</td>
							<td>${xiangmujilu.jiluren}</td>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
							<td class="td-manage"><a title="编辑"
								onclick="x_admin_show('编辑','${pageContext.request.contextPath}/view/views/fanction/xiangmujilu/xiangmujilu-edit.jsp?id=${xiangmujilu.id}&kaishishijian=${xiangmujilu.kaishishijian}&jieduan=${xiangmujilu.jieduan}&staffname=${xiangmujilu.staffname}&xiangmumingcheng=${xiangmujilu.xiangmumingcheng}&shuoming=${xiangmujilu.shuoming}&youxianji=${xiangmujilu.youxianji}&jiluren=${xiangmujilu.jiluren}')" href="javascript:void(0);"> <button type="button" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe642;</i></button>
							</a> <a title="删除" onclick="member_del('${xiangmujilu.id}')" href="javascript:void(0);"> <button type="button" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon">&#xe640;</i></button>
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
						<a class="layui-btn-disabled">&lt;&lt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="prev" href="${pageContext.request.contextPath}/xiangmujiluList?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.currentPage==page}">
							<span class="current" href="javascript:void(0);">${page}</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page}">
							<a class="num"
								href="${pageContext.request.contextPath}/xiangmujiluList?currentPage=${page}">${page}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<a class="next" href="${pageContext.request.contextPath}/xiangmujiluList?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
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
							location.href = "${pageContext.request.contextPath}/xiangmujiluDel?id="
									+ id;
							}, 1000);
					});
		}
	</script>

</body>

</html>