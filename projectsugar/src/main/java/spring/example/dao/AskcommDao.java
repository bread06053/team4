package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Askcomm;

@Mapper
public interface AskcommDao {

	@Insert
	("insert into askcomm( ano, userid , actext) values(#{ano},#{userid},#{actext})")
	int insertacm(Askcomm acm);
	
	
	@Delete
	("Delete from askcomm where acno = #{acno}")
	int deleteacm(int acno);
	
	@Select
	("Select * from askcomm where ano = #{ano}")
	List<Askcomm> infoacm(int ano);
}
