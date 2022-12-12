package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.UserDao;
import spring.example.domain.User;

@Service
public class UserService {

	
	@Autowired
	UserDao dao;
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
	
	public String getProfile(User user) {
		return dao.getProfile(user);
	}
}
