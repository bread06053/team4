package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.example.domain.Style;

@Mapper
public interface StyleDao {
	
	@Select
	("select styleimg from style")
	String all();
	
	@Update
	("update style set styleimg=#{styleimg}")
	int updateStyle(String styleimg);
	
}
