package spring.example.service;

import java.util.HashMap;
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
	public List<Map<String,Object>> bestView() {
		return dao.bestView();
	}
	public int cntUser() {
		return dao.cntUser();
	}
	public int cntRecipe() {
		return dao.cntRecipe();
	}
	public User Userinfo(User user) {
		return dao.Userinfo(user);
	}
	
	public int userupdate(User user) {
		return dao.UserUpdate(user);
	}
	public int userdelete(User user) {
		return dao.UserDelete(user);
	}
	public List<User> memsInfo(){
		return dao.memsInfo();
	}
	public List<Map<String,Object>>  alluser(int start) {
		Map<String,Object>m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("cntUser", 5);
		return dao.alluser(m);
	}
	
	public User findById(String id) {
		return dao.findById(id);
	}
	public int updatekakao(String userid) {
		return dao.updatekakao(userid);
	}
}
	