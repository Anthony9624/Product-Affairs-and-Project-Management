package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.xiangmujilu;
import cn.managesystem.service.xiangmujiluService;

/**
 * Servlet implementation class xiangmujiluEdit
 */
public class xiangmujiluEdit extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public xiangmujiluEdit() {
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
    String kaishishijian = request.getParameter("kaishishijian");
    String jieduan = request.getParameter("jieduan");
    String staffname = request.getParameter("staffname");
    String xiangmumingcheng = request.getParameter("xiangmumingcheng");
    String shuoming = request.getParameter("shuoming");
    String youxianji = request.getParameter("youxianji");
    String jiluren = request.getParameter("jiluren");
    xiangmujilu a = new xiangmujilu();
    a.setId(id);
    a.setkaishishijian(kaishishijian);
    a.setjieduan(jieduan);
    a.setStaffname(staffname);
    a.setxiangmumingcheng(xiangmumingcheng);
    a.setyouxianji(youxianji);
    a.setShuoming(shuoming);
    a.setJiluren(jiluren);
    xiangmujiluService service = new xiangmujiluService();
    try {
      service.update(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/xiangmujiluList");
    } catch (Exception e) {
      // TODO: handle exception
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
