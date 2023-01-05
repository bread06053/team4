package spring.example.controller;


import spring.example.config.SecurityUser;
import spring.example.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
 
import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class KakaoPayController {
	@Autowired
	UserService service;
    
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("tae/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("tae/kakaoPay")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("tae/kakaoPayCancel")
    public void kakaoPayCancel() {
    	
    }
    
    @GetMapping("tae/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, @AuthenticationPrincipal SecurityUser user) {
    	service.updatekakao(user.getUser().getUserid());
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
    
}
