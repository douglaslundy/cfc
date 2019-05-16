package org.autoescola.sae.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.autoescola.sae.models.Usuario;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO implements UserDetailsService {

    @PersistenceContext
    private EntityManager manager;
    
    public void gravar(Usuario usuario) {
		manager.merge(usuario);
	}

    public UserDetails loadUserByUsername(String email) {
        List<Usuario> usuarios = manager.createQuery("select u from Usuario u where u.email = :email", Usuario.class)
                .setParameter("email", email).getResultList();

        if (usuarios.isEmpty()) {
            throw new UsernameNotFoundException("O usuário " + email + " não foi encontrado");
        }

        return (UserDetails) usuarios.get(0);
    }

	public Usuario pegaUsuarioLogado() {		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return manager.createQuery("select distinct(u) from Usuario u where u.email = :id", Usuario.class).setParameter("id", authentication.getName()).getSingleResult();
	}
}
