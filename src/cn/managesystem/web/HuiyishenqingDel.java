package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.service.XinxuqiuService;
import cn.managesystem.service.HuiyishenqingService;

/**
 * Servlet implementation class HuiyishenqingDel
 */
public class HuiyishenqingDel extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public HuiyishenqingDel() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    HuiyishenqingService service = new HuiyishenqingService();
    try {
      service.del(id);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    response.sendRedirect(request.getContextPath() + "/HuiyishenqingList");
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
