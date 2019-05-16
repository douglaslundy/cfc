package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Empresa;
import org.autoescola.sae.models.Veiculo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class VeiculoDAO {
	
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Veiculo veiculo) {
		manager.persist(veiculo);
	}

	public List<Veiculo> listar(Empresa empresa) {		
		return manager.createQuery("select v from Veiculo v where v.empresa = :empresa", Veiculo.class).setParameter("empresa", empresa).getResultList();
	}

	public Veiculo find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(v) from Veiculo v where v.id = :id and  v.empresa = :empresa", Veiculo.class).setParameter("empresa", empresa).setParameter("id", id).getSingleResult();
	}
}
