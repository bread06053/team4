package spring.example.dao;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
=======
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

>>>>>>> master
import spring.example.domain.Post;

@Mapper
public interface PostDao {
<<<<<<< HEAD
    @Insert("insert into post(ptitle,ptext,userid) values(#{ptitle},#{ptext},#{userid})")
    int insertPost(Post post);


=======


	@Select
	("select pno, ptitle from post where ptitle like concat('%',#{search},'%')")
	List<Post> searchti2(String search);
>>>>>>> master
}
