package com.zq.xssdemo.modules.sys.dao;

import com.zq.xssdemo.modules.sys.entity.User;

import java.util.List;

public interface IUserDao {

    List<User> findUserByNameAndPassword(User user);

    User findUserByName(User user);

    void insert(User user);

}
