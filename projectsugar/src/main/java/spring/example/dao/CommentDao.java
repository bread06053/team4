package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Comment;

@Mapper
public interface CommentDao {

	@Insert
	("insert into comment( pno, userid , ctext, ctime) values(#{pno},#{userid},#{ctext}, now())")
	int insertcomm(Comment comm);
	
	
	@Delete
	("Delete from comment where cno = #{cno}")
	int deletecomm(int cno);
	
	@Select
	("Select * from comment where pno = #{pno}")
	List<Comment> infocomm(int pno);
}
