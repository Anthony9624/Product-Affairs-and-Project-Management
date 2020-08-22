package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.PageBean;
import cn.managesystem.domain.Huiyishenqing;
import cn.managesystem.service.HuiyishenqingService;

/**
 * Servlet implementation class HuiyishenqingList
 */
public class HuiyishenqingList extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public HuiyishenqingList() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HuiyishenqingService service = new HuiyishenqingService();
    String currentPageStr = request.getParameter("currentPage");
    if (currentPageStr == null)
      currentPageStr = "1";
    int currentPage = Integer.parseInt(currentPageStr);
    int currentCount = 10;
    Long count = null;
    PageBean<Huiyishenqing> pageBean = null;
    List<Huiyishenqing> huiyishenqingList = null;
    try {
      pageBean = service.findPageBean(currentPage, currentCount);
      huiyishenqingList = service.findAllHuiyishenqing();
      count = service.Count();
      request.setAttribute("pageBean", pageBean);
      request.setAttribute("huiyishenqingList", huiyishenqingList);
      request.setAttribute("count", count);
      request.getRequestDispatcher("view/views/fanction/huiyishenqing/huiyishenqing.jsp").forward(request, response);
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
