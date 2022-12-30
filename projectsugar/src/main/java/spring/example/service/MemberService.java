package spring.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;
import spring.example.vo.*;
import spring.example.dao.*;
import spring.example.domain.User;

@Service
public class MemberService{
    @Autowired
    private MemberMapper mapper;
    @Autowired
    private PasswordEncoder encoder;

    /* 카카오 로그인 */

    public void kakaoJoin(User user) {
        mapper.kakaoInsert(user);
        String userid = user.getUserid();
      
       // mapper.authorize(memberVO);
    }


    public MemberVO kakaoLogin(String snsId) {
       
        return mapper.kakaoSelect(snsId);
    }


    public String findAuthBy(String userid) {
    
        return mapper.findAuthBy(userid);
    }


    public String findUserIdBy2(String snsId) {
  
        return mapper.findUserIdBy2(snsId);
    }


    public MemberVO findByUserId(String userid) {
        // TODO Auto-generated method stub
        return mapper.read(userid);
    }
}