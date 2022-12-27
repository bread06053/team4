package spring.example.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Ask;


@Mapper
public interface AskDao {
	
	@Select
	("select * from ask")
	List<Map<String,Object>> asklist();

	@Select
	("select * from ask where ask.ano=#{ask.ano}")
	Ask asktext(int ano);
	
	
	@Select
	("select * from ask where userid = #{userid}")
	List<Ask> myask(String id);
}
