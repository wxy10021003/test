/** 
 * <pre>项目名称:ssm_login 
 * 文件名称:User.java 
 * 包名:com.lz.color.model 
 * 创建日期:2018年1月24日下午2:16:20 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

public class UserLogin {
	private Integer userid;
    private String username;
    private Integer age;
    private String birday;
    private String userpwd;
    private String userflag;
    private String deptid;
    private String loginname;
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getBirday() {
		return birday;
	}
	public void setBirday(String birday) {
		this.birday = birday;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUserflag() {
		return userflag;
	}
	public void setUserflag(String userflag) {
		this.userflag = userflag;
	}
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	@Override
	public String toString() {
		return "UserLogin [userid=" + userid + ", username=" + username + ", age=" + age + ", birday=" + birday
				+ ", userpwd=" + userpwd + ", userflag=" + userflag + ", deptid=" + deptid + ", loginname=" + loginname
				+ "]";
	}
    
    
    

	
}
