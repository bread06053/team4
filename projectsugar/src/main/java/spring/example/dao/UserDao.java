package spring.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import spring.example.domain.Ask;
import spring.example.domain.User;

@Mapper
public interface UserDao {
	
@Select
("select * from user where userid = #{userid}")
User findById(String id);

@Insert
("insert into user(userid,name,nickname,email,passwd,address,role) values(#{userid}, #{name},#{nickname},#{email},#{passwd},#{address} ,'ROLE_MEMBER' ) ")
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


@Select
("select REPLACE(REPLACE(rthumimg,'[',''),']','')as rthumimg,rtitle from recipe ORDER BY rno DESC limit 4")
List<Map<String,String>> recentRcp();


@Select
("select rank() over(order by a.likes desc) as ranking,nickname,profile from (select sum(rlikes) as likes,userid from recipe group by userid)a inner join user on a.userid=user.userid limit 3")
List<Map<String,Object>> bestChef();

@Select
("select REPLACE(REPLACE(rthumimg,'[',''),']','')as rthumimg from recipe ORDER BY rlikes desc limit 3")
List<String> bestView();

@Select
("select count(userid) from user")
int cntUser();

@Select
("select count(rno) from recipe")
int cntRecipe();

@Insert
("insert into ask(atitle,userid,atext) values(#{atitle},#{userid},#{atext})")
int asksome(Ask ask);


@Select
("select * from user where userid = #{userid} and passwd = #{passwd}")
User Userinfo(User user);

@Update
("update user set nickname = #{nickname}, email = #{email} ,passwd = #{passwd}, address = #{passwd}, name = #{name}, pr = #{pr} where userid = #{userid}")
int UserUpdate(User user);

@Delete
("delete from user where userid = #{userid} and passwd = #{passwd}")
int UserDelete(User user);

@Select("select userid,name,nickname, address,level ,pr from user")
List<User> memsInfo();


@Select
("select * from user")
List<User> alluser();

}

