package com.kyk.web.controller;

import com.kyk.web.model.TheUser;
import com.kyk.web.model.User;
import com.kyk.web.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by kyk on 2016/7/15.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;

    @RequestMapping("/showUser")
    public String showUser(HttpServletRequest request, Model model){
        log.info("查询所有用户信息");
        List<User> userList = userService.getAllUser();
//        log.info("userList="+userList.size());
//        for (User us:userList){
//            log.info("getUserName="+us.getUserName());
//            log.info("getUserPhone="+us.getUserPhone());
//            log.info("getUserEmail="+us.getUserEmail());
//        }
        model.addAttribute("userList",userList);
        model.addAttribute("msg", "hello world");
        return "showUser";
    }

    //页面传输，可空配置
    @RequestMapping("/addUser")
    public String addUser(@RequestParam("name") String name,
                         @RequestParam(value = "phone",required = false) String phone){
        System. out.println("name=" +name);
        System. out.println("phone=" +phone);
        return "showUser" ;
    }

    //页面传输，可空配置
    @RequestMapping(value = "/addUserByUser",method = RequestMethod.POST)
    public String addUser(User theUser){
        System. out.println("name=" +theUser.getUserName());
        System. out.println("phone=" +theUser.getUserPhone());
        int a=userService.add(theUser);
        System.out.println("int a="+a);
        return "showUser" ;
    }

    @RequestMapping(value = "/updateUserByUser",method = RequestMethod.POST)
    public String updateUser(User theUser,HttpServletRequest request, Model model){
        System. out.println("name=" +theUser.getUserName());
        System. out.println("phone=" +theUser.getUserPhone());
        int a=userService.update(theUser);
        System.out.println("int a="+a);

        return this.showUser(request,model);

    }
}
