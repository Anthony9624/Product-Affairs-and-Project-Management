package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.managesystem.domain.Huiyishenqing;
import cn.managesystem.utils.C3P0Utils;

public class HuiyishenqingDao {
  public Long Count() throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from huiyishenqing";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;

  }

  public List<Huiyishenqing> findAllHuiyishenqingListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from huiyishenqing limit ?,?";
    return qr.query(sql, new BeanListHandler<Huiyishenqing>(Huiyishenqing.class), index, currentCount);
  }

  public List<Huiyishenqing> findAllHuiyishenqing() throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from huiyishenqing";
    return runner.query(sql, new BeanListHandler<Huiyishenqing>(Huiyishenqing.class));
  }

  public void delete(String id) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "delete from huiyishenqing where id=?";
    qr.update(sql, id);
  }

  public void add(Huiyishenqing t) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "insert into huiyishenqing values(null,?,?,?,?,?)";
    qr.update(sql, t.getStaffname(), t.getShenqingshijian(), t.getBegin(), t.getHuiyididian(), t.getHuiyineirong());
  }

  public void update(Huiyishenqing t) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "update huiyishenqing set staffname=?,shenqingshijian=?,begin=?,huiyididian=?,huiyineirong=? where id=?";
    qr.update(sql, t.getStaffname(), t.getShenqingshijian(), t.getBegin(), t.getHuiyididian(), t.getHuiyineirong(),
        t.getId());
  }
}
