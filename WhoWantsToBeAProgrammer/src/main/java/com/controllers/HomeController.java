/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import pojos.User;
import pojos.Userdao;

/**
 *
 * @author ntsep
 */
@Controller
public class HomeController {
    public static HttpSession session() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }
    @RequestMapping("index")
    public ModelAndView mainpage(){
        return new ModelAndView("home");
    }
    
    @RequestMapping("loginPage")
    public ModelAndView redirectLoginPage(){
        return new ModelAndView("login");
    }
    @RequestMapping("registerPage")
    public ModelAndView redirectRegisterPage(){
        return new ModelAndView("register");
    }
    
    //testComment
    @PostMapping("loginController")
    public ModelAndView loginCheck(User user){
        Userdao dao = new Userdao();     
        User u = dao.login(user.getUsername(), user.getPassword());
        if(u==null){
            ModelAndView model = new ModelAndView("home");           
            return model;
        }else{
            ModelAndView done = new ModelAndView("profile"); 
//            done.addObject("user", u);
            HttpSession session =  session();
            session.setAttribute("u", u);
            return done;
        }
    }
    
    
}
