package spring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.RecipeDao;
import spring.example.domain.Recipe;

@Service
public class RecipeService {

	@Autowired
	RecipeDao dao;
	
	public List<Recipe> searchti1(String search){
		return dao.searchti1(search);
	}
}
