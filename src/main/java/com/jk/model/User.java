package com.jk.model;

import java.util.HashSet;
import java.util.Set;

public class User {

	private Integer userid;

    private String username;
     
    private Integer age;
    
    private String birday;
    
    private String userpwd;
    
    private String userflag;
    
    private String deptid;
    
    private Set<String> resources = new HashSet<String>();
    
    private Set<Role> roles=new HashSet<Role>();

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

	public Set<String> getResources() {
		return resources;
	}

	public void setResources(Set<String> resources) {
		this.resources = resources;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", age="
				+ age + ", birday=" + birday + ", userpwd=" + userpwd
				+ ", userflag=" + userflag + ", deptid=" + deptid
				+ ", resources=" + resources + ", roles=" + roles + "]";
	}

}
