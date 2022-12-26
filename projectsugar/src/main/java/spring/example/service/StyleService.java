package spring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.StyleDao;
import spring.example.domain.Style;

@Service
public class StyleService {

	@Autowired
	StyleDao dao;
	
	public List<Style> all(){
		return dao.all();
	}
}
