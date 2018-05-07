package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.LogPojo;
import com.jk.util.PagerUtil;

public interface RzService {


    JSONObject queryStudentPage(LogPojo logPojo, PagerUtil pager);



}
