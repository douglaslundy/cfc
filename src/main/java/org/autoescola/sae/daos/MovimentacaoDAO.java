package org.autoescola.sae.daos;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.autoescola.sae.models.Empresa;
import org.autoescola.sae.models.Movimentacao;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MovimentacaoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Movimentacao movimentacao) {
		manager.persist(movimentacao);
	}
	
	public List<Movimentacao> listar(Empresa empresa) {		
		return manager.createQuery("select m from Movimentacao m where m.empresa = :empresa", Movimentacao.class).setParameter("empresa", empresa).getResultList();
	}

	public Movimentacao find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(m) from Movimentacao m where m.id = :id and m.empresa = :empresa", Movimentacao.class).setParameter("id", id).getSingleResult();
	}
	
	public BigDecimal pegaTotal(Calendar dataInicio, Calendar dataFim, Empresa empresa) {		
		TypedQuery<BigDecimal> query = manager.createQuery("select sum(m.valor) from Movimentacao m where m.empresa = :empresa and m.data BETWEEN :inicial and :final", BigDecimal.class).setParameter("inicial", dataInicio, TemporalType.DATE).setParameter("final", dataFim).setParameter("empresa", empresa);
	    return query.getSingleResult();
	}

	public List<Movimentacao> listarPorDatas(Calendar dataInicio, Calendar dataFim, Empresa empresa) {
		return manager.createQuery("select m from Movimentacao  m where m.empresa = :empresa and m.data BETWEEN :inicial and :final", Movimentacao.class).setParameter("inicial", dataInicio, TemporalType.DATE).setParameter("final", dataFim).setParameter("empresa", empresa).getResultList();
	}
}
