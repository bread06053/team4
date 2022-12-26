package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Style;

@Mapper
public interface StyleDao {
	
	@Select
	("select * from style")
	List<Style> all();

}
