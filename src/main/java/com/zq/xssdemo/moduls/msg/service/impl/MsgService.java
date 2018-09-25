package com.zq.xssdemo.moduls.msg.service.impl;

import com.zq.xssdemo.moduls.msg.dao.IMsgDao;
import com.zq.xssdemo.moduls.msg.entity.Msg;
import com.zq.xssdemo.moduls.msg.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = false)
@Service
public class MsgService implements IMsgService {

    @Autowired
    private IMsgDao msgDao;

    @Override
    public List<Msg> list() {
        return msgDao.list();
    }

    @Override
    public void insert(Msg msg) {
        msgDao.insert(msg);
    }
}
