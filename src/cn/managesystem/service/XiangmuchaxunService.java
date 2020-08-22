package cn.managesystem.service;

import java.sql.SQLException;
import java.util.List;

import cn.managesystem.domain.PageBean;
import cn.managesystem.domain.Xiangmuchaxun;
import cn.managesystem.dao.XiangmuchaxunDao;

public class XiangmuchaxunService {

  public PageBean<Xiangmuchaxun> findPageBean(int currentPage, int currentCount) throws SQLException {
    // TODO Auto-generated method stub
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    int totalCount = dao.Count().intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<Xiangmuchaxun> xiangmuchaxunList = dao.findXiangmuchaxunListForPageBean(index, currentCount);
    pageBean.setXiangmuchaxunList(xiangmuchaxunList);
    return pageBean;
  }

  public List<Xiangmuchaxun> findAllXiangmuchaxun() throws SQLException {
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    return dao.findAllXiangmuchaxun();
  }

  public Long Count() throws SQLException {
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    return dao.Count();
  }

  public List<Xiangmuchaxun> findXiangmuchaxunByyouxianji(String youxianji) throws SQLException {
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    return dao.findXiangmuchaxunByyouxianji(youxianji);
  }

  public Long CountByyouxianji(String youxianji) throws SQLException {
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    return dao.CountByyouxianji(youxianji);
  }

  public PageBean<Xiangmuchaxun> findPageBean(String youxianji, int currentPage, int currentCount) throws SQLException {
    // TODO Auto-generated method stub
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    XiangmuchaxunDao dao = new XiangmuchaxunDao();
    int totalCount = dao.CountByyouxianji(youxianji).intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<Xiangmuchaxun> xiangmuchaxunList = dao.findXiangmuchaxunListForPageBean(youxianji, index, currentCount);
    pageBean.setXiangmuchaxunList(xiangmuchaxunList);
    return pageBean;
  }
}
