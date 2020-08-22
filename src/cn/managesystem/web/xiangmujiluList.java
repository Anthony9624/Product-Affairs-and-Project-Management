package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.xiangmujilu;
import cn.managesystem.domain.PageBean;
import cn.managesystem.service.xiangmujiluService;

/**
 * Servlet implementation class xiangmujiluList
 */
public class xiangmujiluList extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public xiangmujiluList() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    xiangmujiluService service = new xiangmujiluService();
    String currentPageStr = request.getParameter("currentPage");
    if (currentPageStr == null)
      currentPageStr = "1";
    int currentPage = Integer.parseInt(currentPageStr);
    int currentCount = 10;
    Long count = null;
    PageBean<xiangmujilu> pageBean = null;
    List<xiangmujilu> xiangmujiluList = null;
    try {
      pageBean = service.findPageBean(currentPage, currentCount);
      xiangmujiluList = service.findAllxiangmujilu();
      count = service.Count();
      request.setAttribute("pageBean", pageBean);
      request.setAttribute("xiangmujiluList", xiangmujiluList);
      request.setAttribute("count", count);
      request.getRequestDispatcher("view/views/fanction/xiangmujilu/xiangmujilu.jsp").forward(request, response);
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
