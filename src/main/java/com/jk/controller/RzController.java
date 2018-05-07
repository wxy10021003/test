package com.jk.controller;

import com.jk.service.RzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.LogPojo;
import com.jk.util.PagerUtil;


@Controller
@RequestMapping("rz")
public class RzController {

    @Autowired
    private RzService rzService;

    //跳转展示页面
    @RequestMapping("/toshowStuPage")
    public String toshowStuPage(){
        return "show";
    }

    //查询
    @RequestMapping("/queryLogPojoPage")
    @ResponseBody
    public Object queryLogPojoPage(LogPojo logPojo,PagerUtil pager){
        JSONObject json = rzService.queryStudentPage(logPojo,pager);
        return json;
    }

}
