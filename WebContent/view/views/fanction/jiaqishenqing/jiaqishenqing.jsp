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
	String sql2 = "select staffname from staff where account=?";
	QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> staff = qr2.query(sql2, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>

<body>
	<div class="layui-card">
		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="view/views/home/console.html">首页</a>
				<a> <cite>假期申请</cite></a>
			</span>
		</div>
		<div class="x-body">
			<xblock>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
			<button class="layui-btn" onclick="x_admin_show('添加假期申请','${pageContext.request.contextPath}/view/views/fanction/jiaqishenqing/jiaqishenqing-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>
			<%}
				else if(s.getGroups().equals("member")){%>
			<button class="layui-btn" onclick="x_admin_show('添加假期申请','${pageContext.request.contextPath}/view/views/fanction/jiaqishenqing/jiaqishenqing-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>
      <%}
			}
			%>
			<span class="x-right" style="line-height: 40px">共有假期申请：${count } 条</span> 
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>编号</th>
						<th>申请人</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>时长</th>
						<th>假期类别</th>
						<th>原因</th>
						<th>状态</th>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
						<th>操作</th>
			<%}
			}%>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.jiaqishenqingList}"
						var="jiaqishenqing">
						<tr>
							<td>${jiaqishenqing.id}</td>
							<td>${jiaqishenqing.staffname}</td>
							<td>${jiaqishenqing.kaishishijian}</td>
							<td>${jiaqishenqing.jieshushijian}</td>
							<td>${jiaqishenqing.shichang}天</td>
							<td>${jiaqishenqing.jiaqileixing}</td>
							<td>${jiaqishenqing.yuanyin}</td>
							<td>${jiaqishenqing.zhuangtai}</td>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
						<td class="td-manage"> 
						<a title="编辑" 
						  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/view/views/fanction/jiaqishenqing/jiaqishenqing-edit.jsp?id=${jiaqishenqing.id}&staffname=${jiaqishenqing.staffname }&kaishishijian=${jiaqishenqing.kaishishijian}&jieshushijian=${jiaqishenqing.jieshushijian}&shichang=${jiaqishenqing.shichang}&jiaqileixing=${jiaqishenqing.jiaqileixing}&yuanyin=${jiaqishenqing.yuanyin}')" href="javascript:void(0);"> 
							<button type="button" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe642;</i></button>
						</a>
							<a title="删除" onclick="member_del('${jiaqishenqing.id}')"	href="javascript:void(0);"> 
						<button type="button" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon">&#xe640;</i></button>
							</a>	
						</td>
			<%}
			}%>
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
						<a class="prev" href="${pageContext.request.contextPath}/JiaqishenqingList?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.currentPage==page}">
							<span class="current" href="javascript:void(0);">${page}</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page}">
							<a class="num"
								href="${pageContext.request.contextPath}/JiaqishenqingList?currentPage=${page}">${page}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<a class="next" href="${pageContext.request.contextPath}/JiaqishenqingList?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
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
							location.href = "${pageContext.request.contextPath}/JiaqishenqingDel?id="
								+ id;
							}, 1000);
					});
		}
	</script>

</body>

</html>