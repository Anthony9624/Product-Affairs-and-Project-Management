package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import cn.managesystem.domain.xiangmujilu;
import cn.managesystem.utils.C3P0Utils;

public class xiangmujiluDao {

  public Long Count() throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from xiangmujilu";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;
  }

  public List<xiangmujilu> findAllxiangmujiluListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu limit ?,?";
    return qr.query(sql, new BeanListHandler<xiangmujilu>(xiangmujilu.class), index, currentCount);
  }

  public void delete(String id) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "delete from xiangmujilu where id=?";
    qr.update(sql, id);
  }

  public void add(xiangmujilu k) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "insert into xiangmujilu values(null,?,?,?,?,?,?,?)";
    qr.update(sql, k.getkaishishijian(), k.getjieduan(), k.getStaffname(), k.getxiangmumingcheng(), k.getShuoming(),
        k.getyouxianji(), k.getJiluren());
  }

  public void update(xiangmujilu k) throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "update xiangmujilu set kaishishijian=?,jieduan=?,staffname=?,xiangmumingcheng=?,shuoming=?,youxianji=?,jiluren=? where id=?";
    qr.update(sql, k.getkaishishijian(), k.getjieduan(), k.getStaffname(), k.getxiangmumingcheng(), k.getShuoming(),
        k.getyouxianji(), k.getJiluren(), k.getId());

  }

  public List<xiangmujilu> findAllxiangmujilu() throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu";
    List<xiangmujilu> xiangmujiluList = runner.query(sql, new BeanListHandler<xiangmujilu>(xiangmujilu.class));
    return xiangmujiluList;
  }

}
