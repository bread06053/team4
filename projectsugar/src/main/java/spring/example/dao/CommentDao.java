package spring.example.dao;

import java.util.List;
import java.util.Map;

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
	("Select * from comment inner join user on comment.userid =user.userid inner join level on user.level=level.level where pno = #{pno}")
	List<Map<String,Object>> infocomm(int pno);
}
