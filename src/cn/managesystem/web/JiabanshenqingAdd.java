package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.service.JiabanshenqingService;
import cn.managesystem.domain.Jiabanshenqing;

/**
 * Servlet implementation class JiabanshenqingAdd
 */
public class JiabanshenqingAdd extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public JiabanshenqingAdd() {
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
    String jiabanshijian = request.getParameter("jiabanshijian");
    String jiabanshichang = request.getParameter("jiabanshichang");
    String yuanyin = request.getParameter("yuanyin");
    String zhuangtai = request.getParameter("zhuangtai");
    Jiabanshenqing a = new Jiabanshenqing();
    a.setJiabanshichang(jiabanshichang);
    a.setJiabanshijian(jiabanshijian);
    a.setShenqingshijian(shenqingshijian);
    a.setStaffname(staffname);
    a.setYuanyin(yuanyin);
    a.setZhuangtai(zhuangtai);
    JiabanshenqingService service = new JiabanshenqingService();
    try {
      service.add(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/JiabanshenqingList");
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
