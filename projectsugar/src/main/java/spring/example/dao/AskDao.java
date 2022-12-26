package spring.example.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface AskDao {
	
	@Select
	("select * from ask")
	List<Map<String,Object>> asklist();

}
