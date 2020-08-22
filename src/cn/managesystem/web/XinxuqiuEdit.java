package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.service.XinxuqiuService;
import cn.managesystem.domain.Xinxuqiu;

/**
 * Servlet implementation class XinxuqiuEdit
 */
public class XinxuqiuEdit extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public XinxuqiuEdit() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");
    String tichushijian = request.getParameter("tichushijian");
    String wanchengtianshu = request.getParameter("wanchengtianshu");
    String[] fuzeren = request.getParameterValues("fuzeren");
    StringBuilder sb = new StringBuilder();
    String zhixingzu = request.getParameter("zhixingzu");
    String xuqiuleixing = request.getParameter("xuqiuleixing");
    String shuoming = request.getParameter("shuoming");
    for (int i = 0; i < fuzeren.length - 1; i++) {
      sb.append(fuzeren[i]).append(',');
    }
    sb.append(fuzeren[fuzeren.length - 1]);
    Xinxuqiu a = new Xinxuqiu();
    a.setId(Integer.parseInt(id));
    a.setTichushijian(tichushijian);
    a.setWanchengtianshu(wanchengtianshu);
    a.setFuzeren(sb.toString());
    a.setZhixingzu(zhixingzu);
    a.setXuqiuleixing(xuqiuleixing);
    a.setShuoming(shuoming);
    XinxuqiuService service = new XinxuqiuService();
    try {
      service.update(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/XinxuqiuList");
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
