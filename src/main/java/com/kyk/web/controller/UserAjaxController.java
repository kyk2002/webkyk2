package com.kyk.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.kyk.web.model.User;
import com.kyk.web.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by gjl on 17/7/6.
 */
@Controller
@RequestMapping("/AjaxUser")
public class UserAjaxController {
    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/testUpdate", method = RequestMethod.POST)
    public String TestUpdate(String foo, String bar){

        System.out.println("foo="+foo);
        System.out.println("bar="+bar);
        return "foo="+foo+"==bar="+bar;
    }

    @ResponseBody
    @RequestMapping(value = "/testUpObject", method = RequestMethod.POST)
    public String UpObject(User theUser){

        System.out.println("foo="+theUser.getUserName());
        System.out.println("bar="+theUser.getUserPhone());
        return "foo="+theUser.getUserName()+"==bar="+theUser.getUserPhone();
    }


    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestBody JSONObject requestJson, HttpServletRequest request){

        System.out.println(requestJson.toString());
        return "123";
    }
}
