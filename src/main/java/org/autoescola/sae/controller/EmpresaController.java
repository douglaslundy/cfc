package org.autoescola.sae.controller;

import org.autoescola.sae.daos.EmpresaDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Empresa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/empresa")
public class EmpresaController {

	@Autowired
	private EmpresaDAO empresaDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping("/form")
	public ModelAndView form(Empresa dadosEmpresa) {
		dadosEmpresa = empresaDAO.find(usuarioDAO.pegaUsuarioLogado().getId());
		ModelAndView modelAndView = new  ModelAndView("empresa/form");		
		modelAndView.addObject("dadosEmpresa", dadosEmpresa);
		return modelAndView; 
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(Empresa empresa, BindingResult result, RedirectAttributes redirectAttributes) {		
		empresaDAO.gravar(empresa);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Dados atualizados com Sucesso!</div>");
		return new ModelAndView("redirect:empresa/form");
	}
	
}
