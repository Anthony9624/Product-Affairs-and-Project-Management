<%@ page language="java" contentType="text/html; charset=utf-8"
	import="cn.managesystem.utils.C3P0Utils,java.util.*,java.sql.*,org.apache.commons.dbutils.QueryRunner,
org.apache.commons.dbutils.handlers.ScalarHandler,org.apache.commons.dbutils.handlers.BeanListHandler,cn.managesystem.domain.Staff"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String sql = "select groups from staff where account=?";
	QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
	List<Staff> group = qr.query(sql, new BeanListHandler<Staff>(Staff.class),request.getSession().getAttribute("account"));
%>
  <meta charset="utf-8">
  <title>项目与事务管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
</head>
<body class="layui-layout-body">
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-4"></i>
            </a>
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <cite>当前使用账号: <%=request.getSession().getAttribute("account") %></cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a href="/ManageSystem/view/views/login.jsp">退出</a></dd>
            </dl>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll"> 
          <div class="layui-logo" lay-href="home/console.html">
            <span>项目与事务管理系统</span>
          </div>
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="console" class="layui-this">
                  <a lay-href="home/console.html">首页</a>
                </dd>
              </dl>
            </li>
            <li data-name="component" class="layui-nav-item">
              <a href="javascript:;" lay-tips="项目管理" lay-direction="2">
                <i class="layui-icon layui-icon-component"></i>
                <cite>项目管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="button">
                  <a lay-href="${pageContext.request.contextPath}/xiangmujiluList">项目记录</a>
                </dd>
                <dd data-name="tabs">
                  <a lay-href="${pageContext.request.contextPath}/XinxuqiuList">新增需求</a>
                </dd>
                <dd data-name="panel"> 
                  <a lay-href="${pageContext.request.contextPath}/HuiyishenqingList">会议申请</a>
                </dd>
                <dd>
                  <a lay-href="${pageContext.request.contextPath}/XiangmuchaxunList">项目查询</a>   
                </dd>
              </dl>
            </li>
           
            <li data-name="senior" class="layui-nav-item">
              <a href="javascript:;" lay-tips="日常事务" lay-direction="2">
                <i class="layui-icon layui-icon-list"></i>
                <cite>日常事务</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="nav">
                  <a lay-href="${pageContext.request.contextPath}/JiaqishenqingList">假期申请</a>
                </dd>
                <dd data-name="progress">
                  <a lay-href="${pageContext.request.contextPath}/JiabanshenqingList">加班申请</a>
                </dd>
              </dl>
            </li>
			<%
			for (Staff s : group) {
				if(s.getGroups().equals("admin")){%>
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="员工管理" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>员工管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
                <a lay-href="${pageContext.request.contextPath}/StaffList">员工列表</a>  
                </dd>
              </dl>
            </li>
			<%}
			}
			%>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="home/console.html" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="../layuiadmin/layui/layui.js"></script>
  <script>
  layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script>
</body>
</html>


