package cn.managesystem.domain;

public class Staff {

  private int id;
  private String staffname;
  private String account;
  private String password;
  private String groups;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getStaffname() {
    return staffname;
  }

  public void setStaffname(String staffname) {
    this.staffname = staffname;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getGroups() {
    return groups;
  }

  public void setGroups(String groups) {
    this.groups = groups;
  }

}
