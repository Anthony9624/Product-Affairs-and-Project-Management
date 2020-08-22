package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.managesystem.utils.C3P0Utils;
import cn.managesystem.domain.Xinxuqiu;

public class XinxuqiuDao {

  public Long Count() throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from xinxuqiu";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;

  }

  public List<Xinxuqiu> findAllXinxuqiuListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xinxuqiu limit ?,?";
    return qr.query(sql, new BeanListHandler<Xinxuqiu>(Xinxuqiu.class), index, currentCount);
  }

  public List<Xinxuqiu> findAllXinxuqiu() throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xinxuqiu";
    return runner.query(sql, new BeanListHandler<Xinxuqiu>(Xinxuqiu.class));
  }

  public void delete(String id) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "delete from xinxuqiu where id=?";
    qr.update(sql, id);
  }

  public void add(Xinxuqiu c) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "insert into xinxuqiu values(null,?,?,?,?,?,?)";
    qr.update(sql, c.getTichushijian(), c.getWanchengtianshu(), c.getFuzeren(), c.getZhixingzu(), c.getXuqiuleixing(),
        c.getShuoming());
  }

  public void update(Xinxuqiu c) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "update xinxuqiu set tichushijian=?,wanchengtianshu=?,fuzeren=?,zhixingzu=?,xuqiuleixing=?,shuoming=? where id=?";
    qr.update(sql, c.getTichushijian(), c.getWanchengtianshu(), c.getFuzeren(), c.getZhixingzu(), c.getXuqiuleixing(),
        c.getShuoming(), c.getId());
  }

}
