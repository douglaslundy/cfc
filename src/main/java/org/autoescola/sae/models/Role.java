package org.autoescola.sae.models;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

@Entity
public class Role implements GrantedAuthority{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    private String nome;

    // getters and setters

    @Override
    public String getAuthority() {
        return this.nome;
    }

}