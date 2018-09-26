package com.zq.xssdemo.modules.sys.service.Impl;

import com.zq.xssdemo.modules.sys.dao.IUserDao;
import com.zq.xssdemo.modules.sys.entity.User;
import com.zq.xssdemo.modules.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=false)
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public List<User> findUserByNameAndPassword(User user) {
        return userDao.findUserByNameAndPassword(user);
    }

    @Override
    public User findUserByName(User user) {
        return userDao.findUserByName(user);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }
}
