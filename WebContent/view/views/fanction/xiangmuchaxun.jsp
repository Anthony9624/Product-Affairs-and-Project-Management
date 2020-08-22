<%@ page language="java"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Xiangmuchaxun"
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
	request.setCharacterEncoding("utf-8");
	String sql = "select distinct youxianji from xiangmujilu";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Xiangmuchaxun> youxianji = qr.query(sql, new BeanListHandler<Xiangmuchaxun>(Xiangmuchaxun.class));
%>
<body>
	<div class="layui-card">

		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="view/views/home/console.html">首页</a>
				<a> <cite>项目查询</cite></a>
			</span>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/XiangmuchaxunList">
					<div class="layui-form-item">
						<label class="layui-form-label">选择优先级</label>
						<div class="layui-input-inline">
							<select name="youxianji">
								<option value="">${xiangmuchaxunyouxianji}</option>
								<option class="layui-input" value="" lay-skin="primary">全部</option>
								<%
									for (Xiangmuchaxun b : youxianji) {
								%>
								<option class="layui-input" value="<%=b.getyouxianji()%>" lay-skin="primary"><%=b.getyouxianji()%></option>
								<%
									}
								%>
							</select>
						</div>
						<button class="layui-btn" type="submit">查询</button>
					</div>
				</form>
			</div>
			<xblock>
			<span class="x-right" style="line-height: 40px">共有数据：${count }条</span>
			</xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>优先级</th>
						<th>项目名称</th>
						<th>负责人</th>
						<th>开始时间</th>
						<th>编号</th>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.xiangmuchaxunList}" var="xiangmu">
						<tr>
							<td>${xiangmu.youxianji}</td>
							<td>${xiangmu.xiangmumingcheng}</td>
							<td>${xiangmu.staffname}</td>
							<td>${xiangmu.kaishishijian}</td>
							<td>${xiangmu.id}</td>
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
						<a class="prev"	href="${pageContext.request.contextPath}/XiangmuchaxunList?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.currentPage==page}">
							<span class="current" href="javascript:void(0);">${page}</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page}">
							<a class="num" href="${pageContext.request.contextPath}/XiangmuchaxunList?currentPage=${page}">${page}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<a class="next" href="${pageContext.request.contextPath}/XiangmuchaxunList?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>

</html>