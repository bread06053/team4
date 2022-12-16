package spring.example.service;

import java.util.List;
import java.util.Map;

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
	
	public int insertuser(User user) {
		return dao.insertUser(user);
	}
	public String findpw(User user) {
		return dao.findpw(user);
	}
	
	public String findid(String email) {
		return dao.findid(email);
	}
	public List<Map<String,String>> recentRcp(){
		return dao.recentRcp();
	}
	public List<Map<String,Object>> bestChef(){
		return dao.bestChef();
	}
	public List<String> bestView() {
		return dao.bestView();
	}
}
	