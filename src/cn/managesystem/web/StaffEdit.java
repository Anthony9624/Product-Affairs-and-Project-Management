package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.Staff;
import cn.managesystem.service.XiangmuchaxunService;
import cn.managesystem.service.StaffService;

/**
 * Servlet implementation class StaffEdit
 */
public class StaffEdit extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public StaffEdit() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String staffname = request.getParameter("staffname");
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String groups = request.getParameter("groups");
    Staff a = new Staff();
    a.setId(id);
    a.setStaffname(staffname);
    a.setAccount(account);
    a.setPassword(password);
    a.setGroups(groups);
    StaffService service = new StaffService();
    try {
      service.update(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/StaffList");
    } catch (Exception e) {

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
