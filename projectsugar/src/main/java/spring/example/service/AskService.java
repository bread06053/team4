package spring.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.AskDao;
import spring.example.dao.UserDao;
import spring.example.domain.Ask;
import spring.example.domain.Ban;

@Service
public class AskService {

	@Autowired
	UserDao dao;
	
	@Autowired
	AskDao dao2;
	
	public int asksome(Ask ask) {
		return dao.asksome(ask);
	}
	public List<Map<String,Object>> asklist(){
		return dao2.asklist();
	}
	public Ask asktext(int ano) {
		return dao2.asktext( ano);	
	}
	public List<Ask> myask(String id) {
		return dao2.myask(id);
	}
}
