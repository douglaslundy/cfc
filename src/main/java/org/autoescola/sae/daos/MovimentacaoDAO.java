package org.autoescola.sae.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

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
	
	public List<Movimentacao> listar() {		
		return manager.createQuery("select m from Movimentacao m", Movimentacao.class).getResultList();
	}

	public Movimentacao find(Integer id) {
        return manager.createQuery("select distinct(m) from Movimentacao m where p.id = :id", Movimentacao.class).setParameter("id", id).getSingleResult();
	}
	
	public BigDecimal pegaTotal() {		
		TypedQuery<BigDecimal> query = manager.createQuery("select sum(m.valor) from Movimentacao m", BigDecimal.class);
	    return query.getSingleResult();
	}
}
