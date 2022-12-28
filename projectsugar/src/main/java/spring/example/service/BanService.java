package spring.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.BanDao;
import spring.example.domain.Ban;

@Service
public class BanService {
	@Autowired
	BanDao dao;
	
	public List<Map<String,Object>> reportlist(int start){
		Map<String, Object> m = new HashMap<String, Object>();
	      m.put("start", start);
	      m.put("cntBan", 5);
		return dao.reportlist(m);
	}
	public Ban reporttext(int bno) {
			return dao.reporttext( bno);
	}
	public int inseertban(Ban ban) {
		return dao.insertban(ban);
	}
	public int cntBan() {
		return dao.cntBan();
	}
}
