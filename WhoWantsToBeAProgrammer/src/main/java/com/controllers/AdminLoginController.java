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
public class AdminLoginController {
   
 
    @RequestMapping("viewQuestions")
    public ModelAndView question(Questions quest){
        Userdao dao = new Userdao();
        ArrayList<Questions> list = new ArrayList();
        list = dao.getQuestion();
        
      ModelAndView model = new ModelAndView("homeAdmin");
      
      
      model.addObject("list", list);
      
    return model;
    }
    
    
    
    
    
    
 
}