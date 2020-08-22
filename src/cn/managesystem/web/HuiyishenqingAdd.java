package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.Huiyishenqing;
import cn.managesystem.service.HuiyishenqingService;

/**
 * Servlet implementation class HuiyishenqingAdd
 */
public class HuiyishenqingAdd extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public HuiyishenqingAdd() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String staffname = request.getParameter("staffname");
    String shenqingshijian = request.getParameter("shenqingshijian");
    String begin = request.getParameter("begin");
    String huiyididian = request.getParameter("huiyididian");
    String huiyineirong = request.getParameter("huiyineirong");
    Huiyishenqing a = new Huiyishenqing();
    a.setBegin(begin);
    a.setShenqingshijian(shenqingshijian);
    a.setStaffname(staffname);
    a.setHuiyididian(huiyididian);
    a.setHuiyineirong(huiyineirong);
    HuiyishenqingService service = new HuiyishenqingService();
    try {
      service.add(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/HuiyishenqingList");
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
