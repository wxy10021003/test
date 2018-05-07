package com.jk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import com.jk.dao.HxDao;
import com.jk.service.HxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HxServiceImpl implements HxService {

    @Autowired
    private HxDao hxDao;

   /* public Object queryEx() {

        final List list2 = new ArrayList();
        final List<Object[]> list= (List<Object[]>)hxDao.queryEx(list);



        Map map = new HashMap(){{
            put("type","pie");
            put("name","产品合格统计");
            put("data",list);
        }};
        list2.add(map);
        return  list2;
    }*/


}
