package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.dao.UploadDao;
import com.jk.model.File;
import com.jk.model.Img;
import com.jk.service.UploadService;
@Service
public class UploadServiceImpl implements UploadService {
	@Autowired
	private UploadDao  uploadDao;

	public void add(Img img) {
		// TODO Auto-generated method stub
		uploadDao.add(img);
	}

	public List query() {
		// TODO Auto-generated method stub
		return uploadDao.query();
	}

	public void del(String id) {
		// TODO Auto-generated method stub
		uploadDao.del(id);
	}

	public List fileList() {
		// TODO Auto-generated method stub
		return uploadDao.fileList();
	}

	public List imglist(Integer fileid) {
		// TODO Auto-generated method stub
		return uploadDao.imglist( fileid);
	}
}
