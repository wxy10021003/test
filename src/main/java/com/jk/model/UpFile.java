/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:UpFile.java 
 * 包名:com.wuzu.lk.vo 
 * 创建日期:2018年3月13日上午11:26:34 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.io.Serializable;

/**
 *   王云聪
 */

public class UpFile implements Serializable{
	private static final long serialVersionUID = -6635665586511910367L;
	private Integer upload_file_id;
	private String file_name;
	private String file_path;
	private Integer userid;
	private Integer driectoryid;
	private String upload_file_date;
	public Integer getUpload_file_id() {
		return upload_file_id;
	}
	public void setUpload_file_id(Integer upload_file_id) {
		this.upload_file_id = upload_file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getDriectoryid() {
		return driectoryid;
	}
	public void setDriectoryid(Integer driectoryid) {
		this.driectoryid = driectoryid;
	}
	public String getUpload_file_date() {
		return upload_file_date;
	}
	public void setUpload_file_date(String upload_file_date) {
		this.upload_file_date = upload_file_date;
	}
	@Override
	public String toString() {
		return "UpFile [upload_file_id=" + upload_file_id + ", file_name="
				+ file_name + ", file_path=" + file_path + ", userid=" + userid
				+ ", driectoryid=" + driectoryid + ", upload_file_date="
				+ upload_file_date + "]";
	}
}
