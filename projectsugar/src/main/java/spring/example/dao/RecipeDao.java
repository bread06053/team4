package spring.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.example.domain.Recipe;

@Mapper
public interface RecipeDao {

	
@Select
("select rtitle,rno from recipe where rtitle like concat('%',#{search},'%')")
List<Recipe> searchti1(String search);

@Select
("select REPLACE(REPLACE(rthumimg,'[',''),']','')as rthumimg,profile,nickname,rtitle,rno from recipe inner join user on recipe.userid=user.userid where rstate=0 limit #{start} , #{cnt}")
List<Map<String,Object>> bestRcp(Map<String,Object> m);

@Select
("select rthumimg,profile,nickname,rtitle,rno from recipe inner join user on recipe.userid=user.userid where rstate=1 limit #{start} , #{cnt}")
List<Map<String,Object>> myRcp(Map<String,Object> m);
@Select
("select count(rno) from recipe where rstate=0")
int bestcnt();
@Select
("select count(rno) from recipe where rstate=1")
int mycnt();
@Select
("select * from cate")
List<Map<String,Object>> cateName();
@Select
("Select rlevel from recipe where rlevel !='???' group by rlevel")
List<String> rcpLevel();
@Select
("select rtime,Rank() over (order by rtime)as num from recipe where rtime != '???'group by rtime")
List<Map<String,Object>> rcpTime();
@Select
("Select * from recipe")
List<Map<String,Object>> bestRcpInfo();

@Select
("select rno,rtitle,rinfo,nickname,profile,rtime,rlevel,rprep,rlogic,REPLACE(REPLACE(rthumimg,'[',''),']','')as rthumimg,rtip,rlikes from recipe inner join user on recipe.userid=user.userid where rno=#{rno}")
Recipe recipeinfo(int rno);


@Insert
("insert into recipe(userid,cateno,rtitle, rinfo, rtime, rprep, rlogic, rthumimg, rtip, rlikes, rstate ,rlevel) values(#{userid},#{cateno},#{rtitle}, #{rinfo}, #{rtime}, #{rprep}, #{rlogic}, #{rthumimg}, #{rtip}, 0, 1, #{rlevel})")
int recipewrite(Recipe recipe);

@Select
("select rank() over(order by rlikes desc),rno,rlikes,rtitle from recipe where rstate=1 limit 3")
List<Recipe> rlikes();

@Update
("update recipe set rlikes = rlikes +1 where rno = #{rno}")
int rlikesup(int rno);

}




