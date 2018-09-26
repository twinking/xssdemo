package com.zq.xssdemo.modules.msg.dao;

import com.zq.xssdemo.modules.msg.entity.Msg;

import java.util.List;

public interface IMsgDao {

    List<Msg> list();

    void insert(Msg msg);

}
