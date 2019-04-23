package org.autoescola.sae.controller;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@ExceptionHandler(NoResultException.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}

}
