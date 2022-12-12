package spring.example.domain;

import lombok.Data;

@Data
public class User { 
	
	private String userid;
	private String name;
	private String nickname;
	private String email;
	private String passwd;
	private String address;
	private String pr;
	private String profile;
	private int level;
	private int report;
	private Role role;
}

