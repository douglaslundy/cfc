package org.autoescola.sae.controller;

import java.util.List;

import org.autoescola.sae.daos.AgendaDAO;
import org.autoescola.sae.models.Agenda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/agenda")
public class AgendaController {

	@Autowired
	private AgendaDAO agendaDAO;
	
	@RequestMapping(value="/form", name="agenda_form")
	public ModelAndView form() {
		List<Agenda> eventos = agendaDAO.listar();
		
		ModelAndView modelAndView = new  ModelAndView("agenda/form");
		modelAndView.addObject("eventos", eventos);
		return modelAndView;
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(Agenda evento, BindingResult result, RedirectAttributes redirectAttributes) {		
		agendaDAO.gravar(evento);
		redirectAttributes.addFlashAttribute("mensagem", "Evento Cadastrado com Sucesso!");
		return new ModelAndView("redirect:form");
	}
	
	
	@RequestMapping("/{id}")
	public Agenda detalheJSON(@PathVariable("id") Integer id){
	    return agendaDAO.find(id);
	}
	
	@ExceptionHandler(Exception.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
}
