package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.LogPojo;
import com.jk.service.RzService;
import com.jk.util.PagerUtil;

@Service
public class RzServiceImpl implements RzService {

    //注入MongoDB
    @Autowired
    private MongoTemplate mongoTemplate;

    //查询
    public JSONObject queryStudentPage(LogPojo logPojo, PagerUtil pager) {
        //查询总条数
        long total = mongoTemplate.count(new Query(Criteria.where("methodname").regex(logPojo.getMethodname())), LogPojo.class);
        Query query = new Query(Criteria.where("methodname").regex(logPojo.getMethodname()));
        query.skip(pager.getStart()).limit(pager.getRows());
        //查询当前页
        List<LogPojo> logPojos = mongoTemplate.find(query,LogPojo.class);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", logPojos);
        return json;
    }



}
