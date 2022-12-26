package spring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.PostDao;
import spring.example.domain.Post;

@Service
public class PostService {
	
	@Autowired
	PostDao dao;
	
	public List<Post> searchti2(String search){
		return dao.searchti2(search);
	}
	
	public int cntpost() {
		return dao.cntpost();
	}

}
