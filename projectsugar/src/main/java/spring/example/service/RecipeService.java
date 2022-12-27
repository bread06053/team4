package spring.example.service;

import java.util.List;
import java.util.Map;

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
	public List<Map<String,String>> bestRcp(){
		return dao.bestRcp();
	}
	public List<Map<String,String>> myRcp(){
		return dao.myRcp();
	}
	public int bestcnt() {
		return dao.bestcnt();
	}
	public int mycnt() {
		return dao.mycnt();
	}
	public List<Map<String,Object>> cateName(){
		return dao.cateName();
	}
	public List<String> rcpLevel(){
		return dao.rcpLevel();
	}
	public List<Map<String,Object>>rcpTime(){
		return dao.rcpTime();
	}
	public List<Map<String,Object>> bestRcpInfo(){
		return dao.bestRcpInfo();
	}
	public Recipe Recipeinfo(int rno){
		return dao.recipeinfo(rno);
	}
	
	public int Recipewrite(Recipe recipe) {
		return dao.recipewrite(recipe);
	}
	public List<Recipe> rlikes() {
		return dao.rlikes();
	}
	
	public int rlikesup(int rno) {
		return dao.rlikesup(rno);
	}

}
