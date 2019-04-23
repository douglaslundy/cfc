package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Aluno;
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

	public List<Aluno> listar() {		
		return manager.createQuery("select a from Aluno a", Aluno.class).getResultList();
	}

	public Aluno find(Integer id) {
        return manager.createQuery("select distinct(p) from Aluno p where p.id = :id", Aluno.class).setParameter("id", id).getSingleResult();
	}

}
