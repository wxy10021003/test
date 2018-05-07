package com.jk.model;

public class File {
	private Integer fileid;
	private String filename;
	public Integer getFileid() {
		return fileid;
	}
	public void setFileid(Integer fileid) {
		this.fileid = fileid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "File [fileid=" + fileid + ", filename=" + filename + "]";
	}
	
	
	
	
}
