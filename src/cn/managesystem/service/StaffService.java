package cn.managesystem.service;

import java.sql.SQLException;
import java.util.List;

import cn.managesystem.domain.PageBean;
import cn.managesystem.domain.Staff;
import cn.managesystem.dao.StaffDao;

public class StaffService {

  public PageBean<Staff> findPageBean(int currentPage, int currentCount) throws SQLException {
    PageBean pageBean = new PageBean();
    pageBean.setCurrentPage(currentPage);
    pageBean.setCurrentCount(currentCount);
    StaffDao dao = new StaffDao();
    int totalCount = dao.Count().intValue();
    pageBean.setTotalCount(totalCount);
    int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
    pageBean.setTotalPage(totalPage);
    int index = (currentPage - 1) * currentCount;
    List<Staff> staffList = dao.findAllStaffListForPageBean(index, currentCount);
    pageBean.setStaffList(staffList);
    return pageBean;
  }

  public List<Staff> findAllStaff() throws SQLException {
    StaffDao dao = new StaffDao();
    return dao.findAllStaff();
  }

  public Long Count() throws SQLException {
    StaffDao dao = new StaffDao();
    return dao.Count();
  }

  public void add(Staff k) throws SQLException {
    // TODO Auto-generated method stub
    StaffDao dao = new StaffDao();
    dao.add(k);
  }

  public void del(String id) throws SQLException {
    // TODO Auto-generated method stub
    StaffDao dao = new StaffDao();
    dao.delete(id);
  }

  public void update(Staff k) throws SQLException {
    // TODO Auto-generated method stub
    StaffDao dao = new StaffDao();
    dao.update(k);
  }

  public Staff login(String staffname, String account, String password) throws SQLException {
    // TODO Auto-generated method stub
    StaffDao dao = new StaffDao();
    return dao.login(staffname, account, password);
  }

}
