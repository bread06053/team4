package spring.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.example.domain.Post;

@Mapper
public interface PostDao {


	@Select
	("select pno, ptitle from post where ptitle like concat('%',#{search},'%')")
	List<Post> searchti2(String search);
	@Insert
	("insert into post (ptitle,ptext,userid) values(#{ptitle},#{ptext},#{userid})")
	int insert(Post post);
	@Select
	("select count(*) from post")
   int count();
	@Select
	("select * from post where pno=#{pno}")
   Post communityOne(int pno);
	@Update
	("update post set ptitle=#{ptitle},ptext=#{ptext} where pno=#{pno}")
   int updatePost(Post post); 
	@Delete
	("delete from post where pno=#{pno}")
   int deletePost(int pno);
	

	List<Post> communityList(Map<String, Object> m);

   List<Post> communityListSearch(Map<String, Object> m);

   @Select
   ("select count(*) from post where ptitle like concat('%',#{search},'%'")
   int countSearch(Map<String, Object> m); 
   @Update
   ("update post set pview=pview+1 where pno=#{pno}")
   int addReadcount(int pno);

   List<Post> communitySort(Map<String, Object> m);

   @Select
   ("selete userid,ptitle,ptext,pdate,pview from post where pno=${pno}")
   Post viewPost(int pno);
   
}
