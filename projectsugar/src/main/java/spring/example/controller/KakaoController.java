package spring.example.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import spring.example.domain.*;
import spring.example.service.*;

@Controller
@AllArgsConstructor
public class KakaoController {
    private KakaoService kakaoService;
    private MemberService memberService;
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserService service;
    

    @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session, User user) throws IOException {
        System.out.println("code:: " + code);

        // 접속토큰 get
        String kakaoToken = kakaoService.getReturnAccessToken(code);
        //System.out.println("kakaoToken"+kakaoToken);
        // 접속자 정보 get
        Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
        System.out.println(result);
        String snsId = (String) result.get("id");
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String userpw = snsId;
      
        // 분기
        // 일치하는 snsId 없을 시 회원가입
        if (memberService.kakaoLogin(email) == null) {
          
            user.setUserid(email);
            user.setPasswd(userpw);
            user.setName(userName);
            user.setEmail(email);
            user.setRole(Role.ROLE_MEMBER);
            
            
            memberService.kakaoJoin(user);
        }



        /* 로그아웃 처리 시, 사용할 토큰 값 */
        //session.setAttribute("kakaoToken", kakaoToken);

        Authentication kakaoUsernamePassword = new UsernamePasswordAuthenticationToken(email, userpw);
        Authentication authentication = authenticationManager.authenticate(kakaoUsernamePassword);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        
       
        return "redirect:/chan/main";

    }

}
