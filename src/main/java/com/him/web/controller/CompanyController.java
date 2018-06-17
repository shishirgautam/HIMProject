/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.him.web.controller;

import com.him.web.entity.Company;
import com.him.web.repository.CompanyRepository;
import com.him.web.util.Mailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sony
 */
@Controller
@RequestMapping(value = "/companies")
public class CompanyController {
    
    @Autowired
     private CompanyRepository companyRepository;
     @Autowired
    private Mailer mailer;
    
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public String  index(Model model){
        model.addAttribute("companies",
                companyRepository.findAll());
        return "companies/index";
    }
    
    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String add(){
        return "companies/add";
    }
    
    @RequestMapping(value="/edit/{id}",method = RequestMethod.GET)
    public String edit(@PathVariable("id")Long id,Model model){
        model.addAttribute("company",companyRepository.findById(id).get());
        return "companies/edit";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    public String save(@ModelAttribute("Company")Company company){
        //company.setLatitude("");
        //company.setLongitude("");
        //company.setLogo("");
        companyRepository.save(company);
        System.out.println(company);
        return "redirect:/companies";
    }
    
    @RequestMapping(value = "mail",method = RequestMethod.POST)
    @ResponseBody
    public String mail(@RequestParam("email")String email,
            @RequestParam("subject")String subject,
            @RequestParam("message")String message){
        mailer.setTo(email);
        mailer.setSubject(subject);
        mailer.setBody(message);
        System.out.println(mailer);
        //mailer.send();
        return "mail sent";
    }
   
    
}
