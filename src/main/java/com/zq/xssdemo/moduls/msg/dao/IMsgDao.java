package com.zq.xssdemo.moduls.msg.dao;

import com.zq.xssdemo.moduls.msg.entity.Msg;

import java.util.List;

public interface IMsgDao {

    List<Msg> list();

    void insert(Msg msg);

}
