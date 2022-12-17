package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Recipe;

@Mapper
public interface RecipeDao {

	
@Select
("select rtitle,rno from recipe where rtitle like concat('%',#{search},'%')")
List<Recipe> searchti1(String search);

}
