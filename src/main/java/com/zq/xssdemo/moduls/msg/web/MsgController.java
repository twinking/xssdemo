package com.zq.xssdemo.moduls.msg.web;

import com.zq.xssdemo.moduls.msg.entity.Msg;
import com.zq.xssdemo.moduls.msg.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/msg")
public class MsgController {

    @Autowired
    private IMsgService msgService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @ResponseBody
    @RequestMapping(value = "/list.do", method = RequestMethod.POST)
    public Map<String,List<Msg>> list() {
        Map<String,List<Msg>> map = new HashMap<String,List<Msg>>();
        List<Msg> list = msgService.list();
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setDate(sdf.format(list.get(i).getTime()));
        }
        map.put("res",list);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public Map<String,String> add(Msg msg) {
        Map<String,String> map = new HashMap<String,String>();
        if(msg != null){
            msg.setId(0);
            msg.setTime(new Date());
            msgService.insert(msg);
            map.put("res","发表成功！");
        }else
            map.put("res","内容不能为空！");
        return map;
    }

}
