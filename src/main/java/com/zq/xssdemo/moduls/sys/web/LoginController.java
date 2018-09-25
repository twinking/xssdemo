package com.zq.xssdemo.moduls.sys.web;

import com.zq.xssdemo.moduls.sys.entity.User;
import com.zq.xssdemo.moduls.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/index")
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public ModelAndView login(User u){
        try {
            List<User> list = userService.findUserByNameAndPassword(u);
            if(list.size() > 0)
                return new ModelAndView("/home","user", list.get(0)) ;
            else
                return  new ModelAndView("/index","infor","用户名不存在或密码错误");
        }catch (Exception e){
            return  new ModelAndView("sys/404","infor","未知错误" + e.getMessage());
        }
    }

    @RequestMapping(value = "/registe.do",method = RequestMethod.POST)
    public ModelAndView registe(User u){
        try {
            User user = userService.findUserByName(u);
            if(user == null){
                u.setId("0");
                userService.insert(u);
                return new ModelAndView("/index","user", u) ;
            }
            else
                return  new ModelAndView("/user/registe","infor","用户名已存在");
        }catch (Exception e){
            return  new ModelAndView("sys/404","infor","未知错误" + e.getMessage());
        }
    }
}
