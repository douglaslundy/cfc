package org.autoescola.sae.controller;

import java.util.List;

import org.autoescola.sae.daos.VeiculoDAO;
import org.autoescola.sae.models.Veiculo;
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
@RequestMapping("/veiculos")
public class VeiculoController {
	
	@Autowired
	private VeiculoDAO veiculoDAO;

	@RequestMapping("/form")
	public ModelAndView form(Veiculo veiculo) {
		return new ModelAndView("veiculos/form");
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(Veiculo veiculo, BindingResult result, RedirectAttributes redirectAttributes) {		
		veiculoDAO.gravar(veiculo);
		redirectAttributes.addFlashAttribute("mensagem", "Veiculo Cadastrado com Sucesso!");
		return new ModelAndView("redirect:veiculos");
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView veiculos() {
		List<Veiculo> veiculos = veiculoDAO.listar();
		ModelAndView modelAndView = new ModelAndView("veiculos/veiculos");
		modelAndView.addObject("veiculos", veiculos);
		return modelAndView;
	}
	
	@RequestMapping("/{id}")
	public Veiculo detalheJSON(@PathVariable("id") Integer id){
	    return veiculoDAO.find(id);
	}
	
	@ExceptionHandler(Exception.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
}
