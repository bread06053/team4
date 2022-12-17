package spring.example.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import spring.example.domain.Post;

@Mapper
public interface PostDao {
    @Insert("insert into post(ptitle,ptext,userid) values(#{ptitle},#{ptext},#{userid})")
    int insertPost(Post post);


}
