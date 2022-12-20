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
import spring.example.domain.Ask;
import spring.example.domain.Post;
import spring.example.domain.Recipe;
import spring.example.domain.User;
import spring.example.service.AskService;
import spring.example.service.PostService;
import spring.example.service.RecipeService;
import spring.example.service.UserService;

@Controller
public class Mycontroller {

	@Autowired
	UserService service;
	
	@Autowired
	RecipeService service2;
	
	@Autowired
	PostService service3;
	
	@Autowired
	AskService service4;
	
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
		return "redirect:/chan/main";
	
	}
	
	@PostMapping("/tae/join")
	public String insert(User user) {
		service.insertuser(user);
		return "redirect:/chan/main";
	}
	
	@GetMapping("tae/find")
	public String find() {
		return "tae/find";
	}
	
	@GetMapping("chan/main")
	public String main(@AuthenticationPrincipal SecurityUser user,Model m) {
		List<Map<String,String>> recent=service.recentRcp();
		List<Map<String,Object>> bestChef= service.bestChef();
		List<String> bestView=service.bestView();

		m.addAttribute("recent",recent);
		m.addAttribute("bestChef",bestChef);
		m.addAttribute("bestView",bestView);
		m.addAttribute("cntUser",service.cntUser());
		m.addAttribute("cntRecipe",service.cntRecipe());
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
		String pw = service.findpw(user);
		if(pw != null) {
			pw = pw.substring(0, 2)+ "**";
		}
		m.addAttribute("pw",  pw);
		return "/tae/popup2";
	}
	
	@PostMapping("tae/searchpage")
	public String searchpage(String q, Model m) {
		List<Recipe> recipe = service2.searchti1(q);
		List<Post> post = service3.searchti2(q);
		m.addAttribute("recipe",recipe);
		m.addAttribute("post",post);
		m.addAttribute("q", q);
		return "tae/searchpage";
	}
	
	@PostMapping("tae/asklist")
	public String asksome(Ask ask) {
		service4.asksome(ask);
		return "redirect:/chan/main";
	}
	@GetMapping("chan/bestRcp")
	public String bestRcp(Model m) {
		List<Map<String,String>> best=service2.bestRcp();
		List<Map<String,Object>> cateName=service2.cateName();
		List<String> rcpLevel=service2.rcpLevel();
		List<Map<String,Object>> rcpTime=service2.rcpTime();
		int cnt=service2.bestcnt();
		m.addAttribute("best",best);
		m.addAttribute("cnt",cnt);
		m.addAttribute("cateName",cateName);
		m.addAttribute("rcpLevel",rcpLevel);
		m.addAttribute("rcpTime",rcpTime);
		return "chan/bestRcp";
	}
	@GetMapping("chan/bestRcpInfo")
	public String bestRcpInfo(Model m){
		List<Map<String,Object>> bestRcpInfo=service2.bestRcpInfo();
		m.addAttribute("bestRcpInfo",bestRcpInfo);
		return "chan/bestRcpInfo";
	}
}


