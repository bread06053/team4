package spring.example.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.User;






@Mapper
public interface UserDao {
	
@Select
("select * from user where userid = #{userid}")
User findById(String id);

@Insert("insert into user(userid,name,nickname,email,passwd,address,role) values(#{userid}, #{name},#{nickname},#{email},#{passwd},#{address} ,'ROLE_MEMBER' ) ")
int insertUser(User user);

@Select
("select userid from user where userid =#{userid}")
String idCheck(String id);

@Select
("select passwd from user where name = #{name} and userid = #{userid} and email = #{email}")
String findpw(User user);

@Select
("select userid from user where email = #{email}")
String findid(String email);

@Select
("select profile from user where userid=#{userid} and passwd=#{passwd}")
String getProfile(User user);
}

