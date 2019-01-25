/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;


import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
;
import org.springframework.web.servlet.ModelAndView;

import pojos.Questions;

import pojos.Userdao;

/**
 *
 * @author ntsep
 */
@Controller
public class AdminLoginController {
   private boolean flagMain = false;
 
    @RequestMapping("viewQuestions")
    public ModelAndView question(Questions quest){
        Userdao dao = new Userdao();
        ArrayList<Questions> list = new ArrayList();
        list = dao.getQuestion();
        
      ModelAndView model = new ModelAndView("homeAdmin");
       
      model.addObject("list", list);
      
    return model;
    }
    
    @GetMapping("editQuestion{id}")
    
   public ModelAndView editQuestion(@PathVariable("id") int id){
       Userdao dao = new Userdao();
       Questions quest = new Questions();
       quest=dao.getQuestionById(id);
       
        ModelAndView model = new ModelAndView("editQuestion");
            model.addObject("quest", quest);
        
      return model;  
   }
   
   @PostMapping("updateQuestion{id}")
   
    public ModelAndView updateQuestion(@PathVariable("id") int id,Questions quest){
     Userdao dao = new Userdao();
    dao.updateQuestion(id,quest.getQuestion(),quest.getA(),quest.getB(),quest.getC(),quest.getD(),quest.getCorrect());
    return new ModelAndView("homeAdmin");
    
    }
    
    
    
    
    
    
    @RequestMapping("logoutAdmin")
       public ModelAndView logoutAdmin(){
        flagMain = false;
        return new ModelAndView("home");
    }
    
    
    
    
 
}