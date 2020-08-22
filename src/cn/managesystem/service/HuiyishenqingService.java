package cn.managesystem.service;

import java.sql.SQLException;
import java.util.List;
import cn.managesystem.domain.PageBean;
import cn.managesystem.domain.Huiyishenqing;
import cn.managesystem.dao.HuiyishenqingDao;

public class HuiyishenqingService {
  public PageBean<Huiyishenqing> findPageBean(int currentPage, int currentCount) throws SQLException {
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    HuiyishenqingDao dao = new HuiyishenqingDao();
    int totalCount = dao.Count().intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<Huiyishenqing> huiyishenqingList = dao.findAllHuiyishenqingListForPageBean(index, currentCount);
    pageBean.setHuiyishenqingList(huiyishenqingList);
    return pageBean;
  }

  public List<Huiyishenqing> findAllHuiyishenqing() throws SQLException {
    HuiyishenqingDao dao = new HuiyishenqingDao();
    return dao.findAllHuiyishenqing();
  }

  public Long Count() throws SQLException {
    HuiyishenqingDao dao = new HuiyishenqingDao();
    return dao.Count();
  }

  public void del(String id) throws SQLException {
    // TODO Auto-generated method stub
    HuiyishenqingDao dao = new HuiyishenqingDao();
    dao.delete(id);
  }

  public void add(Huiyishenqing t) throws SQLException {
    // TODO Auto-generated method stub
    HuiyishenqingDao dao = new HuiyishenqingDao();
    dao.add(t);
  }

  public void update(Huiyishenqing t) throws SQLException {
    // TODO Auto-generated method stub
    HuiyishenqingDao dao = new HuiyishenqingDao();
    dao.update(t);
  }
}
