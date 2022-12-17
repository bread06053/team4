package spring.example.dao;

import java.util.List;
import java.util.Map;

import spring.example.domain.AdBoard;

public interface AdBoardDao {
    List<AdBoard> selectAll() throws Exception;
	AdBoard select(Integer bno);
	int delete(Integer bno);
	int insert(AdBoard adBoard);
    List<AdBoard> selectPage(Map map) throws Exception;
	int count();

}
