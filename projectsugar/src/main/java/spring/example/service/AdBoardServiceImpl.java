package spring.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.AdBoardDao;
import spring.example.domain.AdBoard;

@Service
public class AdBoardServiceImpl implements AdBoardService {
	@Autowired
    AdBoardDao adBoardDao;
	
	@Override
	public int getCount() throws Exception {
		return adBoardDao.count();
	}

	@Override
	public int remove(Integer bno) throws Exception {
		return adBoardDao.delete(bno);
	}

	@Override
	public int write(AdBoard adBoard) throws Exception {
		return adBoardDao.insert(adBoard);
	}

	@Override
	public List<AdBoard> getList() throws Exception {
		// TODO Auto-generated method stub
		return adBoardDao.selectAll();
	}

	@Override
	public AdBoard read(Integer bno) throws Exception {
		return adBoardDao.select(bno);
	}

	@Override
	public List<AdBoard> selectPage(Map map) throws Exception {
        return adBoardDao.selectPage(map);
	}

	@Override
	public int modify(AdBoard boardDto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
