package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.managesystem.domain.Xiangmuchaxun;
import cn.managesystem.domain.Staff;
import cn.managesystem.utils.C3P0Utils;

public class StaffDao {

  public Long Count() throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from staff";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;
  }

  public List<Staff> findAllStaffListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from staff limit ?,?";
    return qr.query(sql, new BeanListHandler<Staff>(Staff.class), index, currentCount);
  }

  public List<Staff> findAllStaff() throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from staff";
    return qr.query(sql, new BeanListHandler<Staff>(Staff.class));
  }

  public void add(Staff k) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "insert into staff values(null,?,?,?,?)";
    qr.update(sql, k.getStaffname(), k.getAccount(), k.getPassword(), k.getGroups());
  }

  public void delete(String id) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "delete from staff where id=?";
    qr.update(sql, id);
  }

  public void update(Staff k) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "update staff set staffname=?,account=?,password=?,groups=? where id=?";
    qr.update(sql, k.getStaffname(), k.getAccount(), k.getPassword(), k.getGroups(), k.getId());
  }

  public Staff login(String staffname, String account, String password) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from staff where staffname=? and account=? and password=?";
    Staff staff = runner.query(sql, new BeanHandler<Staff>(Staff.class), staffname, account, password);
    return staff;
  }
}
