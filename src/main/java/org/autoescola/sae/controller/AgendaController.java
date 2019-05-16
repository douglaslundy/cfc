package org.autoescola.sae.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.autoescola.sae.daos.AgendaDAO;
import org.autoescola.sae.daos.AlunoDAO;
import org.autoescola.sae.daos.InstrutorDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Agenda;
import org.autoescola.sae.models.Aluno;
import org.autoescola.sae.models.Instrutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/agenda")
public class AgendaController {

	@Autowired
	private AgendaDAO agendaDAO;
	
	@Autowired
	private InstrutorDAO instrutorDAO;
	
	@Autowired
	private AlunoDAO alunoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping(value="/define_instrutor", name="define_instrutor", method=RequestMethod.GET)
	public ModelAndView define_instrutor() {
		ModelAndView modelAndView = new  ModelAndView("agenda/define_instrutor");
		List<Instrutor> instrutores = instrutorDAO.listar(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		modelAndView.addObject("instrutores", instrutores);
		return modelAndView;
	}	
	
	@RequestMapping(value="/agenda", name="agenda_form")
	public ModelAndView form(@RequestParam String instrutor) {
		Instrutor resultado = PegaInstrutor(extraiCpf(instrutor));
		List<Agenda> eventos = agendaDAO.listarPorInstrutor(usuarioDAO.pegaUsuarioLogado().getEmpresa(), resultado);
		List<Aluno> alunos = alunoDAO.listar(usuarioDAO.pegaUsuarioLogado().getEmpresa());	
		ModelAndView modelAndView = new  ModelAndView("agenda/form");
		modelAndView.addObject("eventos", eventos);
		modelAndView.addObject("alunos", alunos);
		modelAndView.addObject("instrutor", resultado);		
		return modelAndView;
	}
	
	
	@RequestMapping(method=RequestMethod.POST, name="gravar_aula")
	public ModelAndView grava(@RequestParam String color, String start, String aluno, String instrutorId, String horarioInicio, 
			RedirectAttributes redirectAttributes) throws ParseException{
		 
		Agenda evento = new Agenda();
		evento.setTitle(extraiNome(aluno));
		evento.setColor("#4169e1");
		evento.setStart(TrataDataParaCalendar(start, horarioInicio));
		evento.setEnd(RetornaHoraTerminoDaAula(TrataDataParaCalendar(start, horarioInicio)));
		Instrutor instrutor = find(Integer.parseInt(instrutorId.replace(",", "")));
		evento.setInstrutor(instrutor);
		evento.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		
		agendaDAO.gravar(evento);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Aula agendada com Sucesso!</div>");
		redirectAttributes.addAttribute("instrutor", instrutor.getNome() + '-'+ instrutor.getCpf());
		return new ModelAndView("redirect:agenda/agenda");
	}
	
	
	private Instrutor find(int id) {
		return instrutorDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}

	public String extraiCpf(String str) {
		String[] array = str.split("-");		
		return array[1].trim().replace(",", "");
	}
	
	public String extraiNome(String str) {
		String[] array = str.split("-");		
		return array[0].trim().replace(",", "");
	}
	
	public Instrutor PegaInstrutor(String cpf) {		
		return instrutorDAO.findPorCpf(cpf, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}
	
	
	public Calendar RetornaHoraTerminoDaAula(Calendar hora) {
		Calendar HoraFim = hora;
		HoraFim.add(Calendar.MINUTE, 50);
		return HoraFim;
	}
	
	
	public Calendar TrataDataParaCalendar(String start, String horarioInicio) throws ParseException {
		
		horarioInicio = horarioInicio.equals(",") ? horarioInicio="00:00" : horarioInicio;
		
		// por algum motivo o request recebido esta chegando com uma virgula antes
		horarioInicio = horarioInicio.replace(",","");
		String[] array = horarioInicio.split(":");		
		DateFormat formatter; 
		Date date;		
		formatter = new SimpleDateFormat("dd/MM/yyyy");		
		date = (Date)formatter.parse(start.replace(",",""));		
		Calendar cal = Calendar.getInstance();		
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(array[0]));
		cal.set(Calendar.MINUTE,  Integer.parseInt(array[1]));
		cal.set(Calendar.SECOND, 0);
		return cal;
	}
	
	
	@RequestMapping("/{id}")
	public Agenda detalheJSON(@PathVariable("id") Integer id){
	    return agendaDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}	
	
}
