package org.autoescola.sae.controller;

import java.util.List;

import javax.validation.Valid;

import org.autoescola.sae.daos.InstrutorDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Instrutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/instrutor")
public class InstrutorController {
	
	@Autowired
	private InstrutorDAO instrutorDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	//@Autowired
	//private FileSaver fileSaver;
	
	@RequestMapping("/form")
	public ModelAndView form(Instrutor instrutor) {
		return new ModelAndView("instrutor/form");
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView editar(@PathVariable("id") Integer id){
	    ModelAndView modelAndView = new ModelAndView("instrutor/form");
	    Instrutor instrutor = instrutorDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());		
		modelAndView.addObject("instrutor", instrutor);
		return modelAndView;
	}
	
	@RequestMapping("/editDataList")
	public ModelAndView editDataList(String instrutorDataList){
		 ModelAndView modelAndView = new ModelAndView("instrutor/form");
		    Instrutor instrutor = instrutorDAO.find(extraiId(instrutorDataList), usuarioDAO.pegaUsuarioLogado().getEmpresa());		
			modelAndView.addObject("instrutor", instrutor);
			return modelAndView;
	}
	
	public Integer extraiId(String str) {
		String[] array = str.split("-");
		return  Integer.parseInt(array[0].trim().replace(",", ""));
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView grava(MultipartFile foto, @Valid Instrutor instrutor, BindingResult result, RedirectAttributes redirectAttributes) {
		
		instrutor.setCpf(instrutor.getCpf().trim().replace(".", "").replace("-",""));
		instrutor.setTelefone(instrutor.getTelefone().trim().replace("(", "").replace(")","").replace("-", ""));

		if(result.hasErrors()) {
			return form(instrutor);
		}		
		
		instrutor.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		
		if(instrutor.getId() > 0) {
			instrutorDAO.editar(instrutor);
			redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Informações do Instrutor atualizadas com Sucesso!</div>");
		} else {
			instrutorDAO.gravar(instrutor);
			redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Instrutor Cadastrado com Sucesso!</div>");
		}
		
		return new ModelAndView("redirect:instrutor");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView instrutor() {
		List<Instrutor> instrutores = instrutorDAO.listar(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		ModelAndView modelAndView = new ModelAndView("instrutor/instrutores");
		modelAndView.addObject("instrutores", instrutores);
		return modelAndView;
	}
	
	@ExceptionHandler(Exception.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
}
