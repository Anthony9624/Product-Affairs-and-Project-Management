package cn.managesystem.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.service.JiaqishenqingService;
import cn.managesystem.domain.Jiaqishenqing;

/**
 * Servlet implementation class JiaqishenqingEdit
 */
public class JiaqishenqingEdit extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public JiaqishenqingEdit() {
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
    String kaishishijian = request.getParameter("kaishishijian");
    String jieshushijian = request.getParameter("jieshushijian");
    String day = request.getParameter("day");
    String jiaqileixing = request.getParameter("jiaqileixing");
    String yuanyin = request.getParameter("yuanyin");
    String zhuangtai = request.getParameter("zhuangtai");
    Jiaqishenqing a = new Jiaqishenqing();
    a.setId(id);
    a.setStaffname(staffname);
    a.setKaishishijian(kaishishijian);
    a.setJieshushijian(jieshushijian);
    a.setShichang(day);
    a.setJiaqileixing(jiaqileixing);
    a.setYuanyin(yuanyin);
    a.setZhuangtai(zhuangtai);
    JiaqishenqingService service = new JiaqishenqingService();
    try {
      service.update(a);
      Thread.sleep(3000);
      response.sendRedirect(request.getContextPath() + "/JiaqishenqingList");
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
