package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Aluno;
import org.autoescola.sae.models.Empresa;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AlunoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Aluno aluno) {
		manager.persist(aluno);
	}
	
	public void editar(Aluno aluno) {
		manager.merge(aluno);		
	}

	public List<Aluno> listar(Empresa empresa) {		
		return manager.createQuery("select a from Aluno a where a.empresa = :empresa", Aluno.class).setParameter("empresa", empresa).getResultList();
	}

	public Aluno find(Integer id, Empresa empresa) {
        return manager.createQuery("select distinct(a) from Aluno a where a.id = :id and a.empresa = :empresa", Aluno.class).setParameter("id", id).setParameter("empresa", empresa).getSingleResult();
	}	

}
