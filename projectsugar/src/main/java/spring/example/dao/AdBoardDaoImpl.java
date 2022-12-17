package spring.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.example.domain.AdBoard;

@Repository
public class AdBoardDaoImpl implements AdBoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "spring.example.dao.AdBoardMapper.";

	@Override
	public List<AdBoard> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
	}

	@Override
	public AdBoard select(Integer bno) {
        return session.selectOne(namespace + "select", bno);
	}

	@Override
	public int delete(Integer bno) {
		return session.delete(namespace + "delete", bno);
	}

	@Override
	public int insert(AdBoard adBoard) {
		return session.insert(namespace+"insert", adBoard);
	}
	
    @Override
    public List<AdBoard> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    } // List<E> selectList(String statement, Object parameter)

	@Override
	public int count() {
        return session.selectOne(namespace+"count");
	}
}
