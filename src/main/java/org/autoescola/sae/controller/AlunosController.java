package org.autoescola.sae.controller;

import java.util.List;

import javax.validation.Valid;

import org.autoescola.sae.daos.AlunoDAO;
import org.autoescola.sae.daos.UsuarioDAO;
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
	
	//@Autowired
	//private FileSaver fileSaver;
	
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
	
	@RequestMapping("/edit/{id}")
	public ModelAndView editar(@PathVariable("id") Integer id){
	    ModelAndView modelAndView = new ModelAndView("alunos/form");
	    Aluno aluno = alunoDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());		
		modelAndView.addObject("aluno", aluno );
		return modelAndView;
	}
	
	@RequestMapping("/editDataList")
	public ModelAndView editDataList(String alunoDataList){
	    ModelAndView modelAndView = new ModelAndView("alunos/form");
	    Aluno aluno = alunoDAO.find(this.extraiId(alunoDataList), usuarioDAO.pegaUsuarioLogado().getEmpresa());
		modelAndView.addObject("aluno", aluno );
		return modelAndView;
	}
	
	public Integer extraiId(String str) {
		String[] array = str.split("-");
		return  Integer.parseInt(array[0].trim().replace(",", ""));
	}
	
	@RequestMapping(method=RequestMethod.POST, name="gravar_aluno")
	public ModelAndView grava(MultipartFile foto, @Valid Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes) {
		
		aluno.setCpf(aluno.getCpf().trim().replace(".", "").replace("-",""));
		aluno.setTelefone(aluno.getTelefone().trim().replace("(", "").replace(")","").replace("-", ""));
		
		if(result.hasErrors()) {
			return form(aluno);
		}		
		
		//String path = fileSaver.write("fotosfolder", foto);
		//String path = fileSaver.write("resources/imagens", foto);
		//aluno.setFotoPath(path);
		
		aluno.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		
		if(aluno.getId() > 0) {		
			alunoDAO.editar(aluno);		
			redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Informações do Aluno Atualizadas com Sucesso!</div>");
		} else {
			alunoDAO.gravar(aluno);		
			redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Aluno Cadastrado com Sucesso!</div>");
		}
		
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
