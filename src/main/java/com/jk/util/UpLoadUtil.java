package com.jk.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UpLoadUtil {

	/**
	 * <pre>uploadImg(作用：)   
	 * 创建人：李岳         
	 * 创建时间：2018年1月19日 上午9:05:21    
	 * 修改人：李岳       
	 * 修改时间：2018年1月19日 上午9:05:21    
	 * 修改备注： 
	 * @param artImg :需要上传的文件
	 * @param folderPath：项目的磁盘路径
	 * 			folderName:文件夹名
	 * @return</pre>
	 * @throws FileNotFoundException 
	 */
	public static String uploadImg(MultipartFile artImg,String folderPath,String folderName){
		//获取原文件名称
        String fileName = artImg.getOriginalFilename();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    
        File file = new File(folderPath+folderName);
//        该目录是否已经存在
        if(!file.exists()){
         //   创建文件夹
            file.mkdir();
        }
        String onlyFileName = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
        FileOutputStream fos;
		try {
			fos = new FileOutputStream(folderPath+folderName+onlyFileName);
			fos.write(artImg.getBytes());
		    fos.flush();
		    fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
		return folderName+onlyFileName;
	}
	

}

