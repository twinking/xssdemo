package com.zq.xssdemo.modules.msg.service;

import com.zq.xssdemo.modules.msg.entity.Msg;

import java.util.List;

public interface IMsgService {

    List<Msg> list();

    void insert(Msg msg);

}
