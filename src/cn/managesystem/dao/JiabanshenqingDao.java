package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.managesystem.utils.C3P0Utils;
import cn.managesystem.domain.Xinxuqiu;
import cn.managesystem.domain.Jiabanshenqing;

public class JiabanshenqingDao {
  public Long Count() throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from jiabanshenqing";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;
  }

  public List<Jiabanshenqing> findAllJiabanshenqingListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from jiabanshenqing limit ?,?";
    return qr.query(sql, new BeanListHandler<Jiabanshenqing>(Jiabanshenqing.class), index, currentCount);
  }

  public List<Jiabanshenqing> findAllJiabanshenqing() throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from jiabanshenqing";
    return runner.query(sql, new BeanListHandler<Jiabanshenqing>(Jiabanshenqing.class));
  }

  public void delete(String id) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "delete from jiabanshenqing where id=?";
    qr.update(sql, id);
  }

  public void add(Jiabanshenqing j) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "insert into jiabanshenqing values(null,?,?,?,?,?,?)";
    qr.update(sql, j.getStaffname(), j.getShenqingshijian(), j.getJiabanshijian(), j.getJiabanshichang(),
        j.getYuanyin(), j.getZhuangtai());
  }

  public void update(Jiabanshenqing j) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "update jiabanshenqing set staffname=?,shenqingshijian=?,jiabanshijian=?,jiabanshichang=?,yuanyin=?,zhuangtai=? where id=?";
    qr.update(sql, j.getStaffname(), j.getShenqingshijian(), j.getJiabanshijian(), j.getJiabanshichang(),
        j.getYuanyin(), j.getZhuangtai(), j.getId());
  }
}
