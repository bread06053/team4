package spring.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.RecipeDao;
import spring.example.domain.Recipe;
import spring.example.domain.Cate;

@Service
public class RecipeService {

	@Autowired
	RecipeDao dao;
	
	public List<Recipe> searchti1(String search){
		return dao.searchti1(search);
	}
	public List<Map<String,Object>> bestRcp(int start){  
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
	    m.put("cnt", 12);
		return dao.bestRcp(m);
	}
	public List<Map<String,Object>> myRcp(int start){
		Map<String,Object>m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("cnt", 12);
		return dao.myRcp(m);
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

	public List<Recipe> recipeSearch(Recipe recipe){
		return dao.recipeSearch(recipe);
	}
	public List<Recipe> myrecipeSearch(Recipe recipe){
		return dao.myrecipeSearch(recipe);
	}
	public int recipeSearch1(Recipe recipe) {
		return dao.recipeSearch1(recipe);
	}
	public int recipeSearch2(Recipe recipe) {
		return dao.recipeSearch2(recipe);
	}
	public List<Map<String,Object>>wordcloud(){
		return dao.wordcloud();

	}

}
