package org.autoescola.sae.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Empresa;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class EmpresaDAO {
	
	@PersistenceContext
	private EntityManager manager;

	public void gravar(Empresa empresa) {
		manager.merge(empresa);
	}
	
	public Empresa find(Integer usuario) {
        return manager.createQuery("select e from Empresa e where e.id = :usuario", Empresa.class).setParameter("usuario", usuario).getSingleResult();
	}
}
