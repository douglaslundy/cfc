package org.autoescola.sae.controller;

import java.util.List;

import javax.validation.Valid;

import org.autoescola.sae.daos.AlunoDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.infra.FileSaver;
import org.autoescola.sae.models.Aluno;
import org.autoescola.sae.validation.AlunoValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/alunos")
public class AlunosController {
	
	@Autowired
	private AlunoDAO alunoDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new AlunoValidation());
	};
	
	@RequestMapping("/form")
	public ModelAndView form(Aluno aluno) {
		return new ModelAndView("alunos/form");
	}
	
	@RequestMapping(method=RequestMethod.POST, name="gravar_aluno")
	public ModelAndView grava(MultipartFile foto, @Valid Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes) {

		if(result.hasErrors()) {
			return form(aluno);
		}		
		
		//String path = fileSaver.write("fotosfolder", foto);
		String path = fileSaver.write("resources/imagens", foto);
		aluno.setFotoPath(path);
		
		aluno.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		
		alunoDAO.gravar(aluno);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Aluno Cadastrado com Sucesso!</div>");
		return new ModelAndView("redirect:alunos");
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView alunos() {
		List<Aluno> alunos = alunoDAO.listar(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		ModelAndView modelAndView = new ModelAndView("alunos/alunos");
		modelAndView.addObject("alunos", alunos);
		return modelAndView;
	}
	
	@RequestMapping("/{id}")
	public Aluno detalheJSON(@PathVariable("id") Integer id){
	    return alunoDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}
	
	@ExceptionHandler(Exception.class)
	public String trataDetalheNaoEcontrado(){
	    return "error";
	}
	
}
