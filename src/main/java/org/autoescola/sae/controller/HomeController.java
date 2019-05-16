package org.autoescola.sae.controller;
// SAE - Sistema de Auto Escola

import javax.persistence.NoResultException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "home";
	}
	
	@RequestMapping(value="/sair", name="sair", method=RequestMethod.GET)
	public String logout(RedirectAttributes redirectAttributes) {
		return "redirect:logout";
	}
	
	@ExceptionHandler(NoResultException.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
	
}
