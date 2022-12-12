package spring.example.config;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;





public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;

	private spring.example.domain.User user;
	
	public SecurityUser(spring.example.domain.User user) {
		super(user.getUserid(), "{noop}"+user.getPasswd(),
				AuthorityUtils.createAuthorityList(user.getRole().toString()));
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public spring.example.domain.User getUsers() {
		return user;
	}
	
	
}
