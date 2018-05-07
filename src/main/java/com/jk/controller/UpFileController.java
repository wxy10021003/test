/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:UpFileController.java 
 * 包名:com.wuzu.lk.controller 
 * 创建日期:2018年3月13日上午11:20:56 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.controller;
/**
 *   王云聪
 */
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.jk.model.Driectory;
import com.jk.model.UpFile;
import com.jk.model.UploadUtil;
import com.jk.service.UpFileService;


@Controller
@RequestMapping("upFile")
public class UpFileController {
	@Autowired
	private UpFileService upFileService;
	@RequestMapping("toUpFile")
	public String toUpFile(){
		return "upfile/xiangceShow";
	}
	@RequestMapping("toUpFileAdd")
	public String toUpFileAdd(){
		return "upfile/xiangceAdd";
	}
	@RequestMapping("toPhotoAdd")
	public String toPhotoAdd(HttpServletRequest request){
		int userid = 1;
		List<Driectory>list = upFileService.queryXiangce(userid);
		request.setAttribute("driectory",list );
		return "upfile/photoAdd";
	}
	@RequestMapping("toPhotoShow")
	public String toPhotoShow(int driectoryid,HttpServletRequest request){
		request.setAttribute("driectoryid", driectoryid);
		return "upfile/photoShow";
	}
	@RequestMapping("xiangceAdd")
	@ResponseBody
	public String xiangceAdd(String driectoryname,HttpServletRequest request){
		int userid = 1;
		Driectory dr = new Driectory();
		dr.setDriectoryname(driectoryname);
		dr.setUserid(userid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dr.setDriectorydate(sdf.format(new Date()));
		upFileService.xiangceAdd(dr);
		return "success";
	}
	@RequestMapping("queryXiangce")
	@ResponseBody
	public String queryXiangce(HttpServletRequest request){
		int userid = 1;
		List<Driectory>list = upFileService.queryXiangce(userid);
		return JSON.toJSONString(list);
	}
	@RequestMapping("queryPhoto")
	@ResponseBody
	public String queryPhoto(String driectoryid,HttpServletRequest request){
		int userid = 1;
		List<UpFile>list = upFileService.queryPhoto(driectoryid,userid);
		return JSON.toJSONString(list);
	}
	@RequestMapping("uploadImage")
	@ResponseBody
	public String uploadImage(@RequestParam("uploadFile")CommonsMultipartFile imageFile,HttpServletRequest request){
		String fileServerPath = UploadUtil.upload(request, imageFile, "images");
		return fileServerPath;
	}
	@RequestMapping("photoAdd")
	@ResponseBody
	public String photoAdd(String driectoryid,String file_path,String file_name,HttpServletRequest request){
		int userid = 1;
		UpFile upFile = new UpFile();
		upFile.setDriectoryid(Integer.parseInt(driectoryid));
		upFile.setFile_path(file_path);
		upFile.setFile_name(file_name);
		upFile.setUserid(userid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		upFile.setUpload_file_date(sdf.format(new Date()));
		upFileService.photoAdd(upFile);
		return "success";
	}
}
