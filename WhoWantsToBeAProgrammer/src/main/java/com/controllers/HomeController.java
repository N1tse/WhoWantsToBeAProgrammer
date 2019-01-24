/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojos.QuestionDao;
import pojos.Questions;
import pojos.User;
import pojos.Userdao;

/**
 *
 * @author ntsep
 */
@Controller
public class HomeController {
    private int count = 1;
    private int rights=0;
    private ArrayList qlist = null;
    private boolean flagMain = false;
    
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
    
    @RequestMapping("adminLogin")
    public ModelAndView adminLogin(){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            return new ModelAndView("adminLogin");
        }
    }
    
    @RequestMapping("userProfile")
    public ModelAndView userProfile(){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            return new ModelAndView("userProfile");
        }
    }
    
    @RequestMapping("profile")
    public ModelAndView profile(){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            return new ModelAndView("profile");
        }
    }
    
    @PostMapping("addUserController")
    public ModelAndView Register (@ModelAttribute("username") String username,@ModelAttribute("password") String password,@ModelAttribute("fname") String fname,@ModelAttribute("lname") String lname,@ModelAttribute("image")  MultipartFile image) throws IOException{
        Userdao dao = new Userdao();
        System.out.println(image);
        dao.Register(username,password,fname,lname,image);
   return new ModelAndView("login");
    
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
            flagMain = true;
            HttpSession session =  session();
            session.setAttribute("u", u);
            return done;
        }
    }
    
     @PostMapping("loginAdminController")
    public ModelAndView loginAdminCheck(User user){
        Userdao dao = new Userdao();     
        User u = dao.loginAdmin(user.getUsername(), user.getPassword());
        if(u==null){
            ModelAndView model = new ModelAndView("adminLogin");           
            return model;
        }else{
            flagMain = true;
            ModelAndView done = new ModelAndView("homeAdmin"); 
            HttpSession session =  session();
            session.setAttribute("u", u);
            return done;
        }
    }
    

    @RequestMapping("javaQuestionsController{subject}")
    public ModelAndView javaQuestions(@PathVariable("subject") String subject){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            QuestionDao dao = new QuestionDao();
            qlist = dao.getQuestion(subject);
            ModelAndView model = new ModelAndView("questionView");
            model.addObject("q", qlist.get(0));
            return model;
        }
    }
    
    @PostMapping("turn")
    public ModelAndView turn(Questions question){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
                QuestionDao qdao = new QuestionDao();
                System.out.println("inside turn controller");
                System.out.println(question.getCorrect());
                boolean flag = qdao.checkQuestion(question.getCorrect(), question.getId());
                System.out.println(question.getId());
                System.out.println(flag);
                if(flag){
                    rights = rights + 1;
                }
                System.out.println("inside turn controller");
                for(int i=count; i<qlist.size();){
                    ModelAndView t = new ModelAndView("questionView");
                    count = count + 1;
                    t.addObject("q", qlist.get(i));
                    return t;
                }
                System.out.println(rights);
                String msg = "You got "+rights+" right answers";
                ModelAndView m = new ModelAndView("profile");
                m.addObject("msg", msg);
                count = 1 ;
                rights = 0 ;
                return m;
        }
    } 
    
    
 
}