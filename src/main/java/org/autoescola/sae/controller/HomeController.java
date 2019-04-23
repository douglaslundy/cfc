package org.autoescola.sae.controller;
// SAE - Sistema de Auto Escola

import javax.persistence.NoResultException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		System.out.println("Teste");
		return "home";
	}
	
	@ExceptionHandler(NoResultException.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
	
}
