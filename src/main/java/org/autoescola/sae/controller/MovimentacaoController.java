package org.autoescola.sae.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.autoescola.sae.daos.MovimentacaoDAO;
import org.autoescola.sae.daos.UsuarioDAO;
import org.autoescola.sae.models.Movimentacao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView grava(Movimentacao movimentacao, BindingResult result, RedirectAttributes redirectAttributes, @RequestParam String valor) {
		movimentacao.setData(new GregorianCalendar());
		
		BigDecimal  novoValor = new BigDecimal(valor.trim().replace(",", "").replace(".", ""));
		movimentacao.setValor(novoValor.divide(new BigDecimal(100)));
		
		
		movimentacao.setValor(movimentacao.getTipo().equals(new String("saida")) ? 
				movimentacao.getValor().multiply(new BigDecimal(-1)) : movimentacao.getValor());
		
		movimentacao.setEmpresa(usuarioDAO.pegaUsuarioLogado().getEmpresa());
		movimentacaoDAO.gravar(movimentacao);
		redirectAttributes.addFlashAttribute("mensagem", "<div class='alert alert-success' role='alert'>Movimentação registrada Sucesso!</div>");
		return new ModelAndView("redirect:movimentacao");
	}
	
		
	@RequestMapping("/movimentacao")
	public ModelAndView movimentacao(String dataInicial, String dataFinal) {
		String[] dataAtual = extraiData(pegaDataAtualFormatada());
		if(dataInicial == "")
			dataInicial = "01/"+dataAtual[1]+ "/" + dataAtual[2];
		if(dataFinal == "")	
		dataFinal = pegaDataAtualFormatada();
		
		
		List<Movimentacao> movimentacao = movimentacaoDAO.listarPorDatas(criaCalendar(dataInicial), criaCalendar(dataFinal), usuarioDAO.pegaUsuarioLogado().getEmpresa());
		BigDecimal total = movimentacaoDAO.pegaTotal(criaCalendar(dataInicial), criaCalendar(dataFinal), usuarioDAO.pegaUsuarioLogado().getEmpresa());
		ModelAndView modelAndView = new ModelAndView("movimentacao/movimentacao");
		modelAndView.addObject("movimentacao", movimentacao);
		modelAndView.addObject("total", total);
		modelAndView.addObject("dataInicial", dataInicial.trim().replace(",", ""));
		modelAndView.addObject("dataFinal", dataFinal.trim().replace(",", ""));
		return modelAndView;
	}
	
	
	public  String pegaDataAtualFormatada() {
		
		Calendar data = Calendar.getInstance();		
		Long dataHoraAtual = data.getTimeInMillis();
		DateFormat df = DateFormat.getDateInstance();		
		String horaFormatada = df.format(dataHoraAtual);	
		return horaFormatada;
		
	}
	
	
	
	public Calendar criaCalendar(String str) {
		Calendar data = Calendar.getInstance();
		data.set(Calendar.DAY_OF_MONTH, Integer.parseInt(extraiData(str)[0]));
		data.set(Calendar.MONTH, (Integer.parseInt(extraiData(str)[1]) - 1));
		data.set(Calendar.YEAR, Integer.parseInt(extraiData(str)[2]));
		return data;
	}
	
	
	public String[] extraiData(String str) {
		str = str.trim().replace(",", "");
		String[] array = str.split("/");
		return array;
	}
	
	
	@RequestMapping("/{id}")
	public Movimentacao detalheJSON(@PathVariable("id") Integer id){
	    return movimentacaoDAO.find(id, usuarioDAO.pegaUsuarioLogado().getEmpresa());
	}
	
	
}
