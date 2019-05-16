package org.autoescola.sae.daos;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Agenda;
import org.autoescola.sae.models.Empresa;
import org.autoescola.sae.models.Instrutor;
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

	public List<Agenda> listar(Empresa empresa) {		
		return manager.createQuery("select i from Agenda i where i.empresa = :empresa", Agenda.class).setParameter("empresa", empresa).getResultList();
	}

	public Agenda find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(i) from Agenda i where i.id = :id and i.empresa = :empresa", Agenda.class).setParameter("empresa", empresa).setParameter("id", id).getSingleResult();
	}

	public List<Agenda> listarPorInstrutor(Empresa empresa, Instrutor instrutor) {
		return manager.createQuery("select i from Agenda i where i.empresa = :empresa and i.instrutor = :instrutor ", Agenda.class).setParameter("empresa", empresa).setParameter("instrutor", instrutor).getResultList();
	}
}