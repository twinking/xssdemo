package com.zq.xssdemo.moduls.sys.service;

import com.zq.xssdemo.moduls.sys.entity.User;

import java.util.List;

public interface IUserService {

    List<User> findUserByNameAndPassword(User user);

    User findUserByName(User user);

    void insert(User user);

}
