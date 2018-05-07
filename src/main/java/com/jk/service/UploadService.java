package com.jk.service;

import java.util.List;

import com.jk.model.File;
import com.jk.model.Img;

public interface UploadService {

	void add(Img img);

	List query();

	void del(String id);

	List fileList();

	List imglist(Integer fileid);
	
}
