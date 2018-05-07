package com.jk.model;

public class Img {
	private Integer imgid;
	private String imgname;
	private Integer fileid;
	private  String imgbewrite;   // 描述
	public Integer getImgid() {
		return imgid;
	}
	public void setImgid(Integer imgid) {
		this.imgid = imgid;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public Integer getFileid() {
		return fileid;
	}
	public void setFileid(Integer fileid) {
		this.fileid = fileid;
	}
	public String getImgbewrite() {
		return imgbewrite;
	}
	public void setImgbewrite(String imgbewrite) {
		this.imgbewrite = imgbewrite;
	}
	@Override
	public String toString() {
		return "Img [imgid=" + imgid + ", imgname=" + imgname + ", fileid=" + fileid + ", imgbewrite=" + imgbewrite
				+ "]";
	}
	
	
	
}
