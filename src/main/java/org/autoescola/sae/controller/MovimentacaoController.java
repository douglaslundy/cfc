package org.autoescola.sae.controller;

import java.math.BigDecimal;
import java.util.GregorianCalendar;
import java.util.List;

import org.autoescola.sae.daos.MovimentacaoDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Movimentacao;
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
@RequestMapping("/movimentacao")
public class MovimentacaoController {
	
	@Autowired
	private MovimentacaoDAO movimentacaoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
		
	@RequestMapping("/form")
	public ModelAndView form(Movimentacao movimentacao) {
		return new ModelAndView("movimentacao/form");
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(Movimentacao movimentacao, BindingResult result, RedirectAttributes redirectAttributes) {
		movimentacao.setData(new GregorianCalendar());
		
		movimentacao.setValor(movimentacao.getTipo().equals(new String("saida")) ? 
				movimentacao.getValor().multiply(new BigDecimal(-1)) : movimentacao.getValor());
		
		movimentacao.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		
		
		movimentacaoDAO.gravar(movimentacao);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Movimentação registrada Sucesso!</div>");
		return new ModelAndView("redirect:movimentacao");
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView movimentacao() {
		List<Movimentacao> movimentacao = movimentacaoDAO.listar(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		BigDecimal total = movimentacaoDAO.pegaTotal(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		ModelAndView modelAndView = new ModelAndView("movimentacao/movimentacao");
		modelAndView.addObject("movimentacao", movimentacao);
		modelAndView.addObject("total", total);
		return modelAndView;
	}
	
	@RequestMapping("/{id}")
	public Movimentacao detalheJSON(@PathVariable("id") Integer id){
	    return movimentacaoDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}
	
	@ExceptionHandler(Exception.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
	
}
