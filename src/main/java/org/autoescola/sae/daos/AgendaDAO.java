package org.autoescola.sae.daos;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Agenda;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AgendaDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Agenda agenda) {
		manager.persist(agenda);
	}

	public List<Agenda> listar() {		
		return manager.createQuery("select a from Agenda a", Agenda.class).getResultList();
	}

	public Agenda find(Integer id) {
        return manager.createQuery("select distinct(a) from Agenda a where a.id = :id", Agenda.class).setParameter("id", id).getSingleResult();
	}
}