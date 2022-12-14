package spring.example.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig{

	@Autowired
	private SugarUserDetailsService UserDetailsService;
		


	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity security) throws Exception {
	
		
		
		security.authorizeRequests().antMatchers("/tae/login","/tae/join","/tae/find").permitAll();
		security.authorizeRequests().antMatchers("/member/**").authenticated();
		security.authorizeRequests().antMatchers("/admin/**").hasAnyRole("ADMIN");

		security.csrf().disable();
		security.formLogin().loginPage("/tae/login").defaultSuccessUrl("/chan/main", true);
		security.exceptionHandling().accessDeniedPage("/accessDenied"); //403 오류 처리
		security.logout().invalidateHttpSession(true).logoutSuccessUrl("/tae/login"); //로그아웃 성공 시 로그인 페이지로 이동
		security.userDetailsService(UserDetailsService);
		return security.build();

		
	
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
//	
//	@Autowired
//	public void authenticate(AuthenticationManagerBuilder auth) throws Exception{
//		auth.inMemoryAuthentication()
//		.withUser("manager")
//		.password("{noop}manager123")
//		.roles("MANAGER");
//		
//		auth.inMemoryAuthentication()
//		.withUser("admin")
//		.password("{noop}admin123")
//		.roles("ADMIN","MANAGER");
//		
//	}
}