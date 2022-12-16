package spring.example.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.example.config.SecurityUser;
import spring.example.domain.User;
import spring.example.service.UserService;

@Controller
public class Mycontroller {

	@Autowired
	UserService service;
	
	@GetMapping("/tae/login")
	public String login() {
		return "tae/login";
	}
	
	@GetMapping("/tae/join")
	public String join() {
		return "tae/join";
	}
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;
	}
	
	@PostMapping("/login")
	public String Profile(@AuthenticationPrincipal SecurityUser user, Model m) {
		m.addAttribute("profile", user.getUser().getProfile());
		return "redirect:/main";
	}
	
	@PostMapping("/tae/join")
	public String insert(User user) {
		service.insertuser(user);
		return "redirect:/main";
	}
	
	@GetMapping("tae/find")
	public String find() {
		return "tae/find";
	}
	
	@GetMapping("chan/main")
	public String main(@AuthenticationPrincipal SecurityUser user,Model m) {
		List<Map<String,String>> recent=service.recentRcp();
		List<Map<String,Object>> bestChef=service.bestChef();
		m.addAttribute("recent",recent);
		m.addAttribute("bestChef",bestChef);
		return "chan/main";
	}

	@GetMapping("chan/subHeader")
	public String subHeader() {
		return "chan/subHeader";
	}
	@GetMapping("chan/mainHeader")
	public String mainHeader() {
		return "chan/mainHeader";
	}
	
	@GetMapping("/tae/popup")
	public String findid(String email, Model m) {
		m.addAttribute("id",  service.findid(email));
		return "/tae/popup";
	}
	@GetMapping("/tae/popup2")
	public String findpw(User user, Model m) {
		m.addAttribute("pw",  service.findpw(user));
		return "/tae/popup2";
	}
}
