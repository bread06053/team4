package spring.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Ban;

@Mapper
public interface BanDao {
	@Select
	("select * from ban limit #{start} , #{cntBan}")
	List<Map<String,Object>> reportlist(Map<String, Object> m);
	
	@Select
	("select * from ban inner join post on ban.pno=post.pno where ban.bno=#{ban.bno}")
	Ban reporttext(int bno);
	
	@Insert
	("insert into ban(btitle, btext, userid, pno, btime) values(#{btitle},#{btext},#{userid},#{pno}, now())")
	int insertban(Ban ban);
	
	@Select
	("select count(bno) from ban")
	int cntBan();
}
