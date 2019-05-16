package org.autoescola.sae.controller;

import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping("/form")
	public ModelAndView form(Usuario usuario) {
		usuario = usuarioDAO.pegaUsuarioLogado();
		ModelAndView modelAndView = new  ModelAndView("usuario/form");		
		modelAndView.addObject("meusDados", usuario);
		return modelAndView; 
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(Usuario usuario, BindingResult result, RedirectAttributes redirectAttributes) {		
		usuarioDAO.gravar(usuario);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Dados atualizados com Sucesso!</div>");
		return new ModelAndView("redirect:usuario/form");
	}

}
