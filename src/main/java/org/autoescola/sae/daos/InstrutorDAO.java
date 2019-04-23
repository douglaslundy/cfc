package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Instrutor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class InstrutorDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Instrutor instrutor) {
		manager.persist(instrutor);
	}

	public List<Instrutor> listar() {		
		return manager.createQuery("select a from Instrutor a", Instrutor.class).getResultList();
	}

	public Instrutor find(Integer id) {
        return manager.createQuery("select distinct(p) from Instrutor p where p.id = :id", Instrutor.class).setParameter("id", id).getSingleResult();
	}
}
