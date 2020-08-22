package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.service.XinxuqiuService;
import cn.managesystem.domain.Xinxuqiu;
import cn.managesystem.domain.PageBean;

/**
 * Servlet implementation class XinxuqiuList
 */
public class XinxuqiuList extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public XinxuqiuList() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    XinxuqiuService service = new XinxuqiuService();
    String currentPageStr = request.getParameter("currentPage");
    if (currentPageStr == null)
      currentPageStr = "1";
    int currentPage = Integer.parseInt(currentPageStr);
    int currentCount = 10;
    Long count = null;
    PageBean<Xinxuqiu> pageBean = null;
    List<Xinxuqiu> xinxuqiuList = null;
    try {
      pageBean = service.findPageBean(currentPage, currentCount);
      xinxuqiuList = service.findAllXinxuqiu();
      count = service.Count();
      request.setAttribute("pageBean", pageBean);
      request.setAttribute("xinxuqiuList", xinxuqiuList);
      request.setAttribute("count", count);
      request.getRequestDispatcher("view/views/fanction/xinxuqiu/xinxuqiu.jsp").forward(request, response);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}
