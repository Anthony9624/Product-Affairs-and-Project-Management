package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.Staff;
import cn.managesystem.service.StaffService;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public LoginServlet() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    request.setCharacterEncoding("utf-8");
    String staffname = request.getParameter("staffname");
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    StaffService service = new StaffService();
    Staff staff = null;
    try {
      staff = service.login(staffname, account, password);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    if (staff != null) {
      request.getSession().setAttribute("account", account);
      response.sendRedirect(request.getContextPath() + "/view/views/index.jsp");
    } else {
      response.sendRedirect(request.getContextPath() + "/view/views/error.jsp");
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
