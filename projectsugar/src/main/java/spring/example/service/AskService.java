package spring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.UserDao;
import spring.example.domain.Ask;


@Service
public class AskService {

	@Autowired
	UserDao dao;
	
	public int asksome(Ask ask) {
		return dao.asksome(ask);
	}
}
