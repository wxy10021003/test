package com.jk.controller;

import com.jk.service.HxService;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/hxController")
@Controller
public class HxController {

      @Autowired
      private HxService hxService;


      /*@RequestMapping("/queryEx")
      @ResponseBody
     public void queryEx(){
        Object hx = hxService.queryEx();
    }*/



}
