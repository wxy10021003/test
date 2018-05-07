package com.jk.model;

public class DeptCong {
	
	private Integer deptid; 
	private String deptname;
	private Integer userid;
	private Integer countsums;
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getCountsums() {
		return countsums;
	}
	public void setCountsums(Integer countsums) {
		this.countsums = countsums;
	}
	@Override
	public String toString() {
		return "DeptCong [deptid=" + deptid + ", deptname=" + deptname + ", userid=" + userid + ", countsums="
				+ countsums + "]";
	}
	
	
}
