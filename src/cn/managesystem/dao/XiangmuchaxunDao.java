package cn.managesystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.managesystem.domain.Xiangmuchaxun;
import cn.managesystem.utils.C3P0Utils;

public class XiangmuchaxunDao {

  public Long Count() throws SQLException {
    // TODO Auto-generated method stub
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from xiangmujilu";
    Long count = (Long) qr.query(sql, new ScalarHandler());
    return count;
  }

  public List<Xiangmuchaxun> findXiangmuchaxunListForPageBean(int index, int currentCount) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu ORDER BY youxianji limit ?,?";
    return qr.query(sql, new BeanListHandler<Xiangmuchaxun>(Xiangmuchaxun.class), index, currentCount);
  }

  public List<Xiangmuchaxun> findAllXiangmuchaxun() throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu ORDER BY youxianji";
    List<Xiangmuchaxun> xiangmuchaxunList = runner.query(sql, new BeanListHandler<Xiangmuchaxun>(Xiangmuchaxun.class));
    return xiangmuchaxunList;
  }

  public List<Xiangmuchaxun> findXiangmuchaxunByyouxianji(String youxianji) throws SQLException {
    QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu where youxianji = ?";
    List<Xiangmuchaxun> xiangmuchaxunList = runner.query(sql, new BeanListHandler<Xiangmuchaxun>(Xiangmuchaxun.class),
        youxianji);
    return xiangmuchaxunList;
  }

  public Long CountByyouxianji(String youxianji) throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select count(*) from xiangmujilu where youxianji = ?";
    Long count = (Long) qr.query(sql, new ScalarHandler(), youxianji);
    return count;
  }

  public List<Xiangmuchaxun> findXiangmuchaxunListForPageBean(String youxianji, int index, int currentCount)
      throws SQLException {
    QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    String sql = "select * from xiangmujilu where youxianji = ? limit ?,?";
    return qr.query(sql, new BeanListHandler<Xiangmuchaxun>(Xiangmuchaxun.class), youxianji, index, currentCount);
  }
}
