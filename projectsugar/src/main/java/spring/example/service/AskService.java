package spring.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.AskDao;
import spring.example.dao.AskcommDao;
import spring.example.dao.UserDao;
import spring.example.domain.Ask;
import spring.example.domain.Askcomm;
import spring.example.domain.Ban;

@Service
public class AskService {

	@Autowired
	UserDao dao;
	
	@Autowired
	AskDao dao2;
	
	@Autowired
	AskcommDao dao3;
	
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
	public int cntmyAsk(String id) {
		return dao2.cntmyAsk(id);
	}
	public List<Map<String, Object>> myask(String id,int start) {
		Map<String, Object> m = new HashMap<String, Object>();
	    m.put("start", start);
	    m.put("cntAsk", 5);
	    m.put("userid", id);
		return dao2.myask(m);
	}
	
	public int insertacm(Askcomm acm) {
		return dao3.insertacm(acm);
	}
	
	public List<Askcomm> info(int ano){
		return dao3.infoacm(ano);
	}
	
	public int deleteacm(int acno) {
		return dao3.deleteacm(acno);
	}
}
