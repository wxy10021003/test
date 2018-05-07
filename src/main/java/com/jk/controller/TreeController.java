package com.jk.controller;

import com.jk.model.Tree;
import com.jk.service.ITreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/treeController")
public class TreeController {
	
	
	@Autowired
	private ITreeService treeService;
	
	
	@RequestMapping("/selectTreeList")
	@ResponseBody
	public List<Tree> selectTreeList(){
		List<Tree> treelist=null;
		try {
			Tree tree=new Tree();
			treelist=treeService.selectTreeList(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return treelist;
	}
	
	@RequestMapping("/tuTree")
	public String tuTree(Integer id,HttpServletRequest request){
		Tree tree=null;
		try {
			tree = treeService.tuTree(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("tree", tree);
		return "addTree";
	}
	
	@RequestMapping("/addTree")
	@ResponseBody
	public String addTree(Tree tree){
		try {
			treeService.addTree(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping("/deleteTree")
	@ResponseBody
	public String deleteTree(Integer id){
		try {
			treeService.deleteTree(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	
	@RequestMapping("/UpdateTree")
	@ResponseBody
	public String UpdateTree(Tree tree){
		try {
			treeService.UpdateTree(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
}
