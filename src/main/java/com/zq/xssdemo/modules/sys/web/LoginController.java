package com.zq.xssdemo.modules.sys.web;

import com.zq.xssdemo.modules.sys.entity.User;
import com.zq.xssdemo.modules.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("")
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = {"login", ""})
    public ModelAndView login(){
        return new ModelAndView("modules/sys/login");
    }


    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public ModelAndView login(User u){
        try {
            List<User> list = userService.findUserByNameAndPassword(u);
            if(list.size() > 0)
                return new ModelAndView("/index","user", list.get(0)) ;
            else
                return  new ModelAndView("modules/sys/login","info","用户名不存在或密码错误");
        }catch (Exception e){
            return  new ModelAndView("error/404","info","未知错误" + e.getMessage());
        }
    }

    @RequestMapping(value = "/registe.do",method = RequestMethod.POST)
    public ModelAndView registe(User u){
        try {
            User user = userService.findUserByName(u);
            if(user == null){
                u.setId("0");
                userService.insert(u);
                return new ModelAndView("modules/sys/login","user", u) ;
            }
            else
                return  new ModelAndView("modules/sys/registe","info","用户名已存在");
        }catch (Exception e){
            return  new ModelAndView("error/404","info","未知错误" + e.getMessage());
        }
    }
}
