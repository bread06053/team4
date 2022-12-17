package spring.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.Post;

@Mapper
public interface PostDao {


	@Select
	("select pno, ptitle from post where ptitle like concat('%',#{search},'%')")
	List<Post> searchti2(String search);
}
