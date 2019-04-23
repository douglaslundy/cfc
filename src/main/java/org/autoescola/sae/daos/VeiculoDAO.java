package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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

	public List<Veiculo> listar() {		
		return manager.createQuery("select v from Veiculo v", Veiculo.class).getResultList();
	}

	public Veiculo find(Integer id) {
        return manager.createQuery("select distinct(v) from Veiculo v where v.id = :id", Veiculo.class).setParameter("id", id).getSingleResult();
	}
}
