package spring.example.service;

import java.util.HashMap;
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
	public List<Map<String,Object>> asklist(int start){
		Map<String, Object> m = new HashMap<String, Object>();
	      m.put("start", start);
	      m.put("cntAsk", 5);
		return dao2.asklist(m);
	}
	public Ask asktext(int ano) {
		return dao2.asktext( ano);
}
	
	public int cntAsk() {
		return dao2.cntAsk();
	}
	
	public List<Ask> myask(String id) {
		return dao2.myask(id);
	}
}
