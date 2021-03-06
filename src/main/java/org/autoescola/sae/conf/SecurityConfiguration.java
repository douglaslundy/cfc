package org.autoescola.sae.conf;

import org.autoescola.sae.daos.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity 
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	 @Autowired
	 private UsuarioDAO usuarioDao;
	 
	 /**
	 	@Override
	protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    .antMatchers("/alunos/form").hasRole("ADMIN")
	    .antMatchers(HttpMethod.POST, "/alunos").hasRole("ADMIN")
	    .antMatchers(HttpMethod.GET, "/alunos").hasRole("ADMIN")
	    .antMatchers("/alunos/**").permitAll()
	    .antMatchers("/resources/**").permitAll()
	    .antMatchers("/").permitAll()
	    .anyRequest().authenticated()
	    .and().formLogin().loginPage("/login").permitAll()
	    .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}
	 
	 **/
	 
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    .antMatchers("/alunos/form").hasRole("ADMIN")
	    .antMatchers(HttpMethod.POST, "/alunos").hasRole("ADMIN")
	    .antMatchers(HttpMethod.GET, "/alunos").hasRole("ADMIN")
	    .antMatchers("/resources/**").permitAll()
	    .anyRequest().authenticated()
	    .and().formLogin().loginPage("/login").permitAll()
	    .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	    .permitAll()
	    .logoutSuccessUrl("/login");
	}
	

	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(usuarioDao)
        .passwordEncoder(new BCryptPasswordEncoder());
    }

}
