package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.User;
import com.shopping.entity.UserDetail;
import com.shopping.service.UserDetailService;
import com.shopping.service.UserService;
import com.shopping.utils.Response;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class UserController {

    @Resource
    UserService userService;

    @Resource
    UserDetailService userDetailService;


    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/amend_info")
    public String amend_info() {
        return "amend_info";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/main")
    public String main() {
        return "main";
    }

    @RequestMapping(value = "/control")
    public String control() {
        return "control.jspbackup";
    }

    @RequestMapping(value = "/second_hand_manage")
    public String second_hand_manage() {
        return "second_hand_manage";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userNameOrEmail, String password, HttpSession httpSession) {
        System.out.println("我接收到了登录请求" + userNameOrEmail + " " + password);
        String result = "fail";
        User user = userService.getUser(userNameOrEmail);
        if (user == null)
            result = "unexist";
        else {
            UserDetail userDetail = userDetailService.getUserDetail(user.getId());
            if (userDetail.getPassword().equals(password)) {
                result = "success";
                httpSession.setAttribute("currentUser", user);
            } else
                result = "wrong";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doRegister(String userName, String email, String nickName, String password, String phoneNumber,
                                          int sex, String birthday, String postNumber, String address) {
        String result = "fail";
        User user = userService.getUser(userName);
        if (user != null) {
            result = "nameExist";
        } else {
            user = userService.getUser(email);
            if (user != null)
                result = "emailExist";
            else {
                User user1 = new User();
                user1.setName(userName);
                System.out.println(userName);
                user1.setEmail(email);
                System.out.println(email);
                user1.setNickName(nickName);
                System.out.println(nickName);
                UUID uuid = UUID.randomUUID();
                String user_id = uuid.toString().replaceAll("-","");
                user1.setUser_id(user_id);
                System.out.println(user_id);
                userService.addUser(user1);
                user1 = userService.getUser(userName);
                UserDetail userDetail = new UserDetail();
                userDetail.setId(user1.getId());
                userDetail.setAddress(address);
                userDetail.setBirthday(birthday);
                userDetail.setPassword(password);
                userDetail.setPhoneNumber(phoneNumber);
                userDetail.setSex(sex);
                userDetail.setPostNumber(postNumber);
                Date date = new Date();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                userDetail.setRegisterTime(sf.format(date));
                userDetailService.addUserDetail(userDetail);
                result = "success";
            }
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doUpdate(String userName, String email, String nickName, String password,
                                        String phoneNumber, int sex, String birthday, String postNumber, String address) {
        String result = "fail";
        User user = userService.getUser(userName);
        user.setEmail(email);
        user.setNickName(nickName);
        userService.updateUser(user);
        UserDetail userDetail = userDetailService.getUserDetail(user.getId());
        userDetail.setAddress(address);
        userDetail.setBirthday(birthday);
        userDetail.setPassword(password);
        userDetail.setPhoneNumber(phoneNumber);
        userDetail.setSex(sex);
        userDetail.setPostNumber(postNumber);
        userDetailService.updateUserDetail(userDetail);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }


    @RequestMapping(value = "/getUserAddressAndPhoneNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserAddressAndPhoneNumber(int id) {
        String address = userDetailService.getUserDetail(id).getAddress();
        String phoneNumber = userDetailService.getUserDetail(id).getPhoneNumber();
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("address",address);
        resultMap.put("phoneNumber",phoneNumber);
        return resultMap;
    }

    @RequestMapping(value = "/doLogout")
    public String doLogout(HttpSession httpSession){
        httpSession.setAttribute("currentUser","");
        return "redirect:login";
    }

    @RequestMapping(value = "/getUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserById(int id) {
        User user = userService.getUser(id);
        String result = JSON.toJSONString(user);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getUserByUserId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserByUserId(String user_id) {
        User user = userService.getUserByUserId(user_id);
        String result = JSON.toJSONString(user);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getUserDetailById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserDetailById(int id) {
        UserDetail userDetail = userDetailService.getUserDetail(id);
        String result = JSON.toJSONString(userDetail);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

}
