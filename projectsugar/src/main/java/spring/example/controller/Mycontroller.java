
package spring.example.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import spring.example.config.SecurityUser;
import spring.example.domain.Ask;
import spring.example.domain.Post;
import spring.example.domain.Recipe;
import spring.example.domain.User;
import spring.example.service.AskService;
import spring.example.service.CommunityService;
import spring.example.service.PostService;
import spring.example.service.RecipeService;
import spring.example.service.UserService;

@Controller
@SessionAttributes("user")
public class Mycontroller {

	@Autowired
	UserService service;
	
	@Autowired
	RecipeService service2;
	
	@Autowired
	PostService service3;
	
	@Autowired
	AskService service4;
	
	@Autowired
	CommunityService service5;
	
	
	@GetMapping("/")
	public String first() {
		return "/tae/login";
	}
	@GetMapping("/logout")
	public String autologout(SessionStatus status) {
		status.setComplete();
		return "tae/login";
	}
	@GetMapping("/gg")
	public String gg() {
		return "tae/gg";
	}
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
		System.out.println(best.get(0));
		return "chan/bestRcp";
	}
	@GetMapping("chan/bestRcpInfo/{rno}")
	public String bestRcpInfo(@PathVariable int rno, Model m){
		Recipe Recipeinfo = service2.Recipeinfo(rno);
		m.addAttribute("Recipeinfo",Recipeinfo);
		return "chan/bestRcpInfo";
	}

	@GetMapping("tae/userinfo")
	public String userinfo(User user, Model m) {
		User info = service.Userinfo(user);
		
		if(info == null) {
			return "tae/userinfo";
		}else{
			m.addAttribute("info",info);
			return "tae/userupdate";

		}
	}
	
	@PostMapping("tae/userupdate")
	public String userupdateForm(User user) {
		service.userupdate(user);
		return "redirect:/chan/main";
		}
	@PostMapping("tae/delete")
	@ResponseBody
	public String delete(User user) {
		System.out.println(user);
		service.userdelete(user);
		return "tae/userupdate";
	}
	
	@GetMapping("/tae/Rcpinfowrite")
	public String Rcpinfowrite() {
		return "/tae/Rcpinfowrite";
	}

	@PostMapping("tae/Rcpinfowrite1")
	public String Rcpinfowrite(Recipe recipe, MultipartFile img,HttpServletRequest request) {
		
		String path = upload(img, request);
		recipe.setRthumimg(path);
		
		service2.Recipewrite(recipe);
		return "tae/Rcpinfowrite";
	}
	private String upload(MultipartFile rthumimg ,HttpServletRequest request) {
		long currentTime = System.currentTimeMillis();
		Random r = new Random();
		int no = r.nextInt(50);//0~40개 랜덤 값 발생
		int index = rthumimg.getOriginalFilename().indexOf(".");
		String ext = rthumimg.getOriginalFilename().substring(index +1);//확장자
		
		
		String newName = currentTime+ "_"+no+"."+ext; //중복 되지 않는 새로운 이름
		  try {
		         String path = request.getServletContext().getRealPath("/rthumimg");
		        File f = new File(path, newName);
		         rthumimg.transferTo(f);
		      } catch (IllegalStateException | IOException e) {
		         e.printStackTrace();
		      }
		      return newName;
	}
	
	@GetMapping("chan/userhome")
	public String adminbt() {
		return "chan/userhome";
	}
	
	@GetMapping("admin/admain")
	public String admain(User user, @RequestParam(name="p", defaultValue="1")int page,String sort, Model m) {
		 int count = service5.count();
	      if(count > 0) {
	         
	         int perPage = 10; 
	         int startRow = (page - 1) * perPage; 
	         
	         List<Post> communityList = service5.communityList(sort, startRow);
	         m.addAttribute("cList", communityList);

	         int pageNum = 5;
	         int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); 
	         
	         int begin = (page - 1) / pageNum * pageNum + 1;
	         int end = begin + pageNum -1;
	         if(end > totalPages) {
	            end = totalPages;
	         }
	          m.addAttribute("begin", begin);
	          m.addAttribute("end", end);
	          m.addAttribute("pageNum", pageNum);
	          m.addAttribute("totalPages", totalPages);
	         }
	      
	      m.addAttribute("sort", sort);
	      m.addAttribute("count", count);
		List<User> infotable = service.alluser();
		m.addAttribute("infotable",infotable);

		return "admin/admain";
	}
	
	@GetMapping("admin/adstyle")
	public String style() {
		return "admin/adstyle";
	}

	@GetMapping("chan/getOut")
	public String getOut(Model m) {
		return "chan/getOut";
	}
	

}


