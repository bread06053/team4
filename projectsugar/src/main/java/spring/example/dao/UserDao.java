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

@Insert("insert into user values(#{userid}, #{name},#{nickname},#{email},#{password},#{address} , #{role} ,'T') ")
int insertUser(User user);

@Select
("select userid from user where userid =#{userid}")
String idCheck(String id);

@Select
("select profile from user where userid=#{userid} and passwd=#{passwd}")
String getProfile(User user);
}
