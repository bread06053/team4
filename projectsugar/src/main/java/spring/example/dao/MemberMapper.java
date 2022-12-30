package spring.example.dao;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import spring.example.domain.*;
import spring.example.vo.MemberVO;
	
@Mapper
public interface MemberMapper {
	    MemberVO read(String userid);                     // 회원 정보 조회
	    void register(MemberVO vo);                     // 회원 가입
	    void authorize (MemberVO memberVO);             // 회원 권한
	    void modify(MemberVO vo);                     // 회원 정보 수정 
	    void remove(MemberVO vo);                         // 회원 탈퇴
	    int checkPw(String userid, String userpw);     // 수정 및 삭제를 위한 비밀번호 체크

	    /* 카카오 로그인 */

	    // 카카오 회원가입
	    void kakaoInsert(User user);

	    //snsId로 회원정보얻기
	    @Select("SELECT userid, name from user WHERE userid = #{snsId}")
	    MemberVO kakaoSelect(String snsId);

	    //snsId로 회원 아이디찾기
	    @Select("SELECT USERID FROM TBL_MEMBER WHERE SNSID = #{snsId}")
	    String findUserIdBy2(String snsId);

	    //회원아이디로 권한찾기
	    @Select("SELECT AUTH FROM TBL_MEMBER_AUTH WHERE USERID = #{userid}")
	    String findAuthBy(String userid);
	}
