package org.autoescola.sae.daos;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;

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
		return manager.createQuery("select m from Agenda m where m.empresa = :empresa", Agenda.class).setParameter("empresa", empresa).getResultList();
	}

	public Agenda find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(m) from Agenda m where m.id = :id and m.empresa = :empresa", Agenda.class).setParameter("empresa", empresa).setParameter("id", id).getSingleResult();
	}

	public List<Agenda> listarPorInstrutor(Empresa empresa, Instrutor instrutor) {
		return manager.createQuery("select m from Agenda m where m.empresa = :empresa and m.instrutor = :instrutor ", Agenda.class).setParameter("empresa", empresa).setParameter("instrutor", instrutor).getResultList();
	}

	
	public List<Agenda> verificaSeAgendaEstaLivre(Calendar data, Empresa empresa, Instrutor instrutor) {
		return manager.createQuery("select m from Agenda  m where m.empresa = :empresa and m.instrutor = :instrutor and :data between m.start and m.end", Agenda.class).setParameter("data", data, TemporalType.TIMESTAMP).setParameter("empresa", empresa).setParameter("instrutor", instrutor).getResultList();
	}
	
}