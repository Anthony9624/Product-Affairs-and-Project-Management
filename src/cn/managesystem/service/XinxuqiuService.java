package cn.managesystem.service;

import java.sql.SQLException;
import java.util.List;

import cn.managesystem.dao.XinxuqiuDao;
import cn.managesystem.domain.Xinxuqiu;
import cn.managesystem.domain.PageBean;

public class XinxuqiuService {
  public PageBean<Xinxuqiu> findPageBean(int currentPage, int currentCount) throws SQLException {
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    XinxuqiuDao dao = new XinxuqiuDao();
    int totalCount = dao.Count().intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<Xinxuqiu> xinxuqiuList = dao.findAllXinxuqiuListForPageBean(index, currentCount);
    pageBean.setXinxuqiuList(xinxuqiuList);
    return pageBean;
  }

  public List<Xinxuqiu> findAllXinxuqiu() throws SQLException {
    XinxuqiuDao dao = new XinxuqiuDao();
    return dao.findAllXinxuqiu();
  }

  public Long Count() throws SQLException {
    XinxuqiuDao dao = new XinxuqiuDao();
    return dao.Count();
  }

  public void del(String id) throws SQLException {
    // TODO Auto-generated method stub
    XinxuqiuDao dao = new XinxuqiuDao();
    dao.delete(id);
  }

  public void add(Xinxuqiu c) throws SQLException {
    // TODO Auto-generated method stub
    XinxuqiuDao dao = new XinxuqiuDao();
    dao.add(c);
  }

  public void update(Xinxuqiu c) throws SQLException {
    // TODO Auto-generated method stub
    XinxuqiuDao dao = new XinxuqiuDao();
    dao.update(c);
  }
}
