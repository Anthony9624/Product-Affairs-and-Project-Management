package cn.managesystem.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
  private int currentPage;
  private int currentCount;
  private int totalCount;
  private int totalPage;
  private List<T> xiangmuchaxunList = new ArrayList<T>();
  private List<T> staffList = new ArrayList<T>();
  private List<T> xiangmujiluList = new ArrayList<T>();
  private List<T> jiaqishenqingList = new ArrayList<T>();
  private List<T> xinxuqiuList = new ArrayList<T>();
  private List<T> jiabanshenqingList = new ArrayList<T>();
  private List<T> huiyishenqingList = new ArrayList<T>();

  public List<T> getHuiyishenqingList() {
    return huiyishenqingList;
  }

  public void setHuiyishenqingList(List<T> huiyishenqingList) {
    this.huiyishenqingList = huiyishenqingList;
  }

  public List<T> getJiabanshenqingList() {
    return jiabanshenqingList;
  }

  public void setJiabanshenqingList(List<T> jiabanshenqingList) {
    this.jiabanshenqingList = jiabanshenqingList;
  }

  public List<T> getXinxuqiuList() {
    return xinxuqiuList;
  }

  public void setXinxuqiuList(List<T> xinxuqiuList) {
    this.xinxuqiuList = xinxuqiuList;
  }

  public List<T> getJiaqishenqingList() {
    return jiaqishenqingList;
  }

  public void setJiaqishenqingList(List<T> jiaqishenqingList) {
    this.jiaqishenqingList = jiaqishenqingList;
  }

  public List<T> getxiangmujiluList() {
    return xiangmujiluList;
  }

  public void setxiangmujiluList(List<T> xiangmujiluList) {
    this.xiangmujiluList = xiangmujiluList;
  }

  public List<T> getStaffList() {
    return staffList;
  }

  public void setStaffList(List<T> staffList) {
    this.staffList = staffList;
  }

  public int getCurrentPage() {
    return currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public int getCurrentCount() {
    return currentCount;
  }

  public void setCurrentCount(int currentCount) {
    this.currentCount = currentCount;
  }

  public int getTotalCount() {
    return totalCount;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;
  }

  public int getTotalPage() {
    return totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public List<T> getXiangmuchaxunList() {
    return xiangmuchaxunList;
  }

  public void setXiangmuchaxunList(List<T> xiangmuchaxunList) {
    this.xiangmuchaxunList = xiangmuchaxunList;
  }

}
