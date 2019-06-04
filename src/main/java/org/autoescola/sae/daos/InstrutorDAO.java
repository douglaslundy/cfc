package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Empresa;
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
	
	public void editar(Instrutor instrutor) {
		manager.merge(instrutor);		
	}

	public List<Instrutor> listar(Empresa empresa) {		
		return manager.createQuery("select i from Instrutor i where i.empresa = :empresa", Instrutor.class).setParameter("empresa", empresa).getResultList();
	}

	public Instrutor find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(i) from Instrutor i where i.id = :id and i.empresa = :empresa", Instrutor.class).setParameter("id", id).setParameter("empresa", empresa).getSingleResult();
	}

	public Instrutor findPorCpf(String cpf, Empresa empresa) {
		return manager.createQuery("select distinct(i) from Instrutor i where i.cpf = :cpf and i.empresa = :empresa", Instrutor.class).setParameter("cpf", cpf).setParameter("empresa", empresa).getSingleResult();
	}
}
