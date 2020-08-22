package cn.managesystem.service;

import java.sql.SQLException;
import java.util.List;

import cn.managesystem.domain.xiangmujilu;
import cn.managesystem.domain.PageBean;
import cn.managesystem.dao.xiangmujiluDao;

public class xiangmujiluService {

  public PageBean<xiangmujilu> findPageBean(int currentPage, int currentCount) throws SQLException {
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    xiangmujiluDao dao = new xiangmujiluDao();
    int totalCount = dao.Count().intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<xiangmujilu> xiangmujiluList = dao.findAllxiangmujiluListForPageBean(index, currentCount);
    pageBean.setxiangmujiluList(xiangmujiluList);
    return pageBean;
  }

  public List<xiangmujilu> findAllxiangmujilu() throws SQLException {
    // TODO Auto-generated method stub
    xiangmujiluDao dao = new xiangmujiluDao();
    return dao.findAllxiangmujilu();
  }

  public Long Count() throws SQLException {
    xiangmujiluDao dao = new xiangmujiluDao();
    return dao.Count();
  }

  public void del(String id) throws SQLException {
    // TODO Auto-generated method stub
    xiangmujiluDao dao = new xiangmujiluDao();
    dao.delete(id);
  }

  public void add(xiangmujilu k) throws SQLException {
    // TODO Auto-generated method stub
    xiangmujiluDao dao = new xiangmujiluDao();
    dao.add(k);
  }

  public void update(xiangmujilu k) throws SQLException {
    // TODO Auto-generated method stub
    xiangmujiluDao dao = new xiangmujiluDao();
    dao.update(k);
  }

}
