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
import pojos.ScoreDao;
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
    private User currentUser;
    private String currentSubject;
    private int currentSubject_id;
    
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
            return new ModelAndView("adminLogin");
    }
    @RequestMapping("logout")
    public ModelAndView logout(){
        flagMain = false;
        return new ModelAndView("home");
    }
    
    @RequestMapping("mainpage")
    public ModelAndView returnToMain(){
        return new ModelAndView("profile");
    }
    
    @RequestMapping("userProfile")
    public ModelAndView userProfile(){
        ScoreDao sdao = new ScoreDao();
        int javaScore = 0;
        int cSharp = 0;
        int javascriptScore = 0;
        int pythonScore = 0;
        ArrayList list;
        ScoreDao scoredao = new ScoreDao();
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            HttpSession session1 =  session();
            list = scoredao.getLogById(currentUser.getId());
            cSharp = scoredao.getCsharpScoreById(currentUser.getId());
            javaScore = scoredao.getJavaScoreById(currentUser.getId());
            javascriptScore = scoredao.getJavascriptpScoreById(currentUser.getId());
            pythonScore = scoredao.getPythonScoreById(currentUser.getId());
            ModelAndView model =  new ModelAndView("userProfile");
            System.out.println(list.size());
            model.addObject("cSharpScore", cSharp);
            model.addObject("javaScore", javaScore);
            model.addObject("javascriptScore", javascriptScore);
            model.addObject("pythonScore", pythonScore);
            session1.setAttribute("log", list);
            return model;
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
        ScoreDao scoreDao = new ScoreDao();
        ArrayList topJava;
        ArrayList topCsharp;
        ArrayList topJs;
        ArrayList topPython;
        Userdao dao = new Userdao();     
        User u = dao.login(user.getUsername(), user.getPassword());
        if(u==null){
            ModelAndView model = new ModelAndView("home");           
            return model;
        }else{
            topJava = scoreDao.top3("java");
            topCsharp = scoreDao.top3("c_sharp");
            topJs = scoreDao.top3("javascript");
            topPython = scoreDao.top3("python");
            ModelAndView done = new ModelAndView("profile"); 
            flagMain = true;
            currentUser = u;
            HttpSession session =  session();
            session.setAttribute("topjava", topJava);
            session.setAttribute("topcsharp", topCsharp);
            session.setAttribute("topjavascript", topJs);
            session.setAttribute("toppython", topPython);
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
    

    @RequestMapping("QuestionsController{subject}")
    public ModelAndView javaQuestions(@PathVariable("subject") String subject){
        if(flagMain==false){
            return new ModelAndView("home");
        }else{
            currentSubject = subject;
            QuestionDao dao = new QuestionDao();
            qlist = dao.getQuestion(subject);
            ModelAndView model = new ModelAndView("questionView");
            model.addObject("q", qlist.get(0));
            return model;
        }
    }
    
    @PostMapping("turn")
    public ModelAndView turn(Questions question){
        ScoreDao score = new ScoreDao();
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
                for(int i=count; i<qlist.size();){
                    ModelAndView t = new ModelAndView("questionView");
                    count = count + 1;
                    t.addObject("q", qlist.get(i));
                    return t;
                }
                switch(currentSubject){
                    case "java":
                        currentSubject_id = 1;
                        break;
                    case "c_sharp":
                        currentSubject_id = 2;
                        break;
                    case "javascript":
                        currentSubject_id = 3;
                        break;
                    case "python":
                        currentSubject_id = 4;
                        break;
                }
                score.setLog(rights, currentUser.getId(), currentSubject_id);
                String msg = "You got "+rights+" right answers";
                ModelAndView m = new ModelAndView("profile");
                m.addObject("msg", msg);
                count = 1 ;
                rights = 0 ;
                return m;
        }
    } 
    
    
 
}