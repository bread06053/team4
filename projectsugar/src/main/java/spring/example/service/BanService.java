package spring.example.service;

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
	
	public List<Map<String,Object>> reportlist(){
		return dao.reportlist();
	}
	public Ban reporttext(int bno) {
			return dao.reporttext( bno);
	}
	public int inseertban(Ban ban) {
		return dao.insertban(ban);
	}
}
