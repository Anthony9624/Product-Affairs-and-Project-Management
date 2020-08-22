package cn.managesystem.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.managesystem.domain.PageBean;
import cn.managesystem.domain.Xiangmuchaxun;
import cn.managesystem.service.XiangmuchaxunService;

/**
 * Servlet implementation class XiangmuchaxunList
 */
public class XiangmuchaxunList extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public XiangmuchaxunList() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    XiangmuchaxunService service = new XiangmuchaxunService();
    String currentPageStr = request.getParameter("currentPage");
    String youxianji = request.getParameter("youxianji");
    if (currentPageStr == null)
      currentPageStr = "1";
    int currentPage = Integer.parseInt(currentPageStr);
    int currentCount = 10;
    Long count = null;
    PageBean<Xiangmuchaxun> pageBean = null;
    List<Xiangmuchaxun> xiangmuchaxunList = null;
    try {
      if (youxianji == null || youxianji.isEmpty()) {
        pageBean = service.findPageBean(currentPage, currentCount);
        xiangmuchaxunList = service.findAllXiangmuchaxun();
        count = service.Count();
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("xiangmuchaxunList", xiangmuchaxunList);
        request.setAttribute("count", count);
        request.getRequestDispatcher("view/views/fanction/xiangmuchaxun.jsp").forward(request, response);
      } else {
        pageBean = service.findPageBean(youxianji, currentPage, currentCount);
        xiangmuchaxunList = service.findXiangmuchaxunByyouxianji(youxianji);
        count = service.CountByyouxianji(youxianji);
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("xiangmuchaxunyouxianji", youxianji);
        request.setAttribute("xiangmuchaxunValueList", xiangmuchaxunList);
        request.setAttribute("count", count);
        request.getRequestDispatcher("view/views/fanction/xiangmuchaxun.jsp").forward(request, response);
      }
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
