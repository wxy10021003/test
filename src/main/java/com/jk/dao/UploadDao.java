package com.jk.dao;

import java.util.List;

import com.jk.model.Img;

public interface UploadDao {


	void add(Img img);

	List query();

	void del(String id);

	List fileList();

	List imglist(Integer fileid);
}
