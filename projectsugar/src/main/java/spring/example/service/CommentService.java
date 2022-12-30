package spring.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.CommentDao;
import spring.example.domain.Comment;

@Service
public class CommentService {

	@Autowired
	CommentDao dao;
	
	public int insertcomm(Comment comm) {
		return dao.insertcomm(comm);
	}
	
	public int deletecomm(int comm) {
		return dao.deletecomm(comm);
	}
	
	public List<Map<String,Object>> infocomm(int pno){
		return dao.infocomm(pno);
	}
}
