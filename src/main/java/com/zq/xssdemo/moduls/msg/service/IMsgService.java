package com.zq.xssdemo.moduls.msg.service;

import com.zq.xssdemo.moduls.msg.entity.Msg;

import java.util.List;

public interface IMsgService {

    List<Msg> list();

    void insert(Msg msg);

}
