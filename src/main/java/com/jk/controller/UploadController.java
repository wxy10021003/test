package com.jk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.jk.model.Img;
import com.jk.model.UploadUtil;
import com.jk.service.UploadService;

@Controller
@RequestMapping("controller")
public class UploadController {
	 @Autowired
	 private UploadService uploadService;
	 //上传
		@RequestMapping(value="/uploadImage")
		@ResponseBody
		public String uploadImage(@RequestParam("uploadFile")CommonsMultipartFile imageFile,HttpServletRequest request){
			String fileServerPath = UploadUtil.upload(request, imageFile, "upload");
			
			return fileServerPath;
		}	
	//下载
		@RequestMapping("/downloadFile")
		@ResponseBody
		public ResponseEntity<byte[]> downloadFile(String imgname,HttpServletRequest request){
			
			return 	UploadUtil.downFile(imgname, request);
		}
		
	//新增
		@RequestMapping("add")
		@ResponseBody
		public String add(Img img){
			uploadService.add(img);	
			return "add";	
	}
	
	//查询
		@RequestMapping(value="/query")
		@ResponseBody
		public String query(){
			List list=uploadService.query();
			return JSON.toJSONString(list);
		}
		//删除
		@RequestMapping(value="/del")
		@ResponseBody
		public String del(String id){
			uploadService.del(id);
			return "delSuccess";
		}
	
	@ResponseBody
	@RequestMapping("/fileList")
	public String fileList(){
		
		List list =uploadService.fileList();
		
		return JSON.toJSONString(list);
		
	}
	
	@ResponseBody
	@RequestMapping("/imglist")
	public String imglist(Integer fileid){
		
		List list=uploadService.imglist(fileid);
		
		return JSON.toJSONString(list);
	}
	
}
