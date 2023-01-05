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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import spring.example.config.SecurityUser;
import spring.example.dao.AskcommDao;
import spring.example.domain.Ask;
import spring.example.domain.Askcomm;
import spring.example.domain.Ban;
import spring.example.domain.Post;
import spring.example.domain.Recipe;
import spring.example.domain.Style;
import spring.example.domain.User;
import spring.example.domain.Cate;
import spring.example.domain.Comment;
import spring.example.service.AskService;
import spring.example.service.BanService;
import spring.example.service.CommunityService;
import spring.example.service.PostService;
import spring.example.service.RecipeService;
import spring.example.service.StyleService;
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
	
	@Autowired
	StyleService service6;
	
	@Autowired
	BanService service7;
	
	
	@GetMapping("/")
	public String first() {
		return "/tae/login";
	}
	
	
	@GetMapping("/gg")
	public String gg() {
		return "tae/gg";
	}
	@GetMapping("/tae/login")
	public String login() {
		return "tae/login";
	}
	@GetMapping("chan/main")
	public String main(@AuthenticationPrincipal SecurityUser user,Model m) {
		List<Map<String,String>> recent=service.recentRcp();
		List<Map<String,Object>> bestChef= service.bestChef();
		List<Map<String,Object>> bestView=service.bestView();
		
		m.addAttribute("userid",user.getUser().getUserid());
		m.addAttribute("profile",user.getUser().getProfile());
		m.addAttribute("recent",recent);
		m.addAttribute("bestChef",bestChef);
		m.addAttribute("bestView",bestView);
		m.addAttribute("cntUser",service.cntUser());
		m.addAttribute("cntRecipe",service.cntRecipe());
		
		 String all=service6.all();
		 m.addAttribute("all",all);
		 
		return "chan/main";
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
		return "redirect:/tae/login";
	}
	
	@GetMapping("tae/find")
	public String find() {
		return "tae/find";
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
		 String all=service6.all();
		 m.addAttribute("all",all);
		return "tae/searchpage";
	}
	
	@PostMapping("tae/asklist")
	public String asksome(Ask ask) {
		service4.asksome(ask);
		return "redirect:/chan/main";

	}
	@GetMapping("chan/bestRcp")
	public String bestRcp(@RequestParam(name="p",defaultValue="1")int page,Model m) {
		
	      int cnt = service2.bestcnt();
	      if(cnt > 0) {
	         
	         int perPage = 12; 
	         int startRow = (page - 1) * perPage; 
	         List<Map<String,Object>> best=service2.bestRcp(startRow);
		m.addAttribute("best",best);
		int pageNum = 5;
        int totalPages = cnt / perPage + (cnt % perPage > 0 ? 1 : 0); 
        
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
		List<Map<String,Object>> cateName=service2.cateName();
		List<String> rcpLevel=service2.rcpLevel();
		List<Map<String,Object>> rcpTime=service2.rcpTime();
		 String all=service6.all();
		 m.addAttribute("all",all);
		m.addAttribute("cnt",cnt);
		m.addAttribute("cateName",cateName);
		m.addAttribute("rcpLevel",rcpLevel);
		m.addAttribute("rcpTime",rcpTime);
		return "chan/bestRcp";
	}
	@GetMapping("chan/myRcp")
	public String myRcp(@RequestParam(name="p",defaultValue="1")int page,Model m) {
	      int cnt = service2.mycnt();
	      if(cnt > 0) {
	         
	         int perPage = 12; 
	         int startRow = (page - 1) * perPage; 
		List<Map<String,Object>> my=service2.myRcp(startRow);
		m.addAttribute("best",my);
		int pageNum = 5;
        int totalPages = cnt / perPage + (cnt % perPage > 0 ? 1 : 0); 
        
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
		List<Map<String,Object>> cateName=service2.cateName();
		List<String> rcpLevel=service2.rcpLevel();
		List<Map<String,Object>> rcpTime=service2.rcpTime();
		 String all=service6.all();
		 m.addAttribute("all",all);
		m.addAttribute("cnt",cnt);
		m.addAttribute("cateName",cateName);
		m.addAttribute("rcpLevel",rcpLevel);
		m.addAttribute("rcpTime",rcpTime);
		return "chan/myRcp";
	}
	@GetMapping("chan/bestRcpInfo/{rno}")
	public String bestRcpInfo(@PathVariable int rno, Model m){
		Recipe Recipeinfo = service2.Recipeinfo(rno);
		 String all=service6.all();
		 m.addAttribute("all",all);
		m.addAttribute("Recipeinfo",Recipeinfo);
		return "chan/bestRcpInfo";
	}

	@GetMapping("tae/userupdate")
	public String userinfo(@AuthenticationPrincipal SecurityUser users,Model m) {
		 String all=service6.all();
		 m.addAttribute("all",all);	
		m.addAttribute("nickname",users.getUser().getNickname());
		m.addAttribute("id", users.getUser().getUserid());
			return "tae/userupdate";

		
	}
	
	@PostMapping("tae/userupdate")
	public String userupdateForm(User user, MultipartFile profile_img,HttpServletRequest request, @AuthenticationPrincipal SecurityUser users) {
		String path = upload1(profile_img, request);
		user.setProfile(path);
		service.userupdate(user);
		
		users.setUser(service.findById(user.getUserid()));
		
		return "redirect:/chan/mypage";
		}
	@PostMapping("tae/delete")
	@ResponseBody
	public String delete(User user) {
		service.userdelete(user);
		return "tae/userupdate";
	}
	
	@GetMapping("/tae/Rcpinfowrite")
	public String Rcpinfowrite(Model m) {
		 String all=service6.all();
		 m.addAttribute("all",all);
		return "/tae/Rcpinfowrite";
	}

	@PostMapping("tae/Rcpinfowrite1")
	public String Rcpinfowrite(Recipe recipe, MultipartFile img,HttpServletRequest request,Model m) {
		
		String path = upload(img, request);
		
		recipe.setRthumimg(path);
		
		 String all=service6.all();
		 m.addAttribute("all",all);
		service2.Recipewrite(recipe);
		return "redirect:/chan/myRcp";
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
	private String upload1(MultipartFile profile_img ,HttpServletRequest request) {
		long currentTime = System.currentTimeMillis();
		Random r = new Random();
		int no = r.nextInt(50);//0~40개 랜덤 값 발생
		int index = profile_img.getOriginalFilename().indexOf(".");
		String ext = profile_img.getOriginalFilename().substring(index +1);//확장자
		
		
		String newName = currentTime+ "_"+no+"."+ext; //중복 되지 않는 새로운 이름
		  try {
		         String path = request.getServletContext().getRealPath("/profile");
		        File f = new File(path, newName);
		        profile_img.transferTo(f);
		      } catch (IllegalStateException | IOException e) {
		         e.printStackTrace();
		      }
		      return newName;
	}

	
	@GetMapping("admin/admain")
	public String admain(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		 int cntUser = service.cntUser();
	      if(cntUser > 0) {
	         
	         int perPage = 5; 
	         int startRow = (page - 1) * perPage; 
	         
	         List<Map<String,Object>> infotable = service.alluser(startRow);
	         m.addAttribute("infotable",infotable);

	         int pageNum = 5;
	         int totalPages = cntUser / perPage + (cntUser % perPage > 0 ? 1 : 0); 
	         
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
	      m.addAttribute("cntUser",cntUser);

		return "admin/admain";
	}
	
	@GetMapping("admin/adtotal")
	public String total(Model m) {
		List<Map<String,Object>> wordcloud=service2.wordcloud();
		int recent=service.cntRecipe();
		int bestChef= service.cntUser();
		int post = service3.cntpost();
		List<Recipe> likes = service2.rlikes();
		m.addAttribute("wordcloud",wordcloud);
		m.addAttribute("cntR",recent);
		m.addAttribute("cntU",bestChef);
		m.addAttribute("cntP",post);
		m.addAttribute("cntL",likes);
		return "admin/adtotal";
	}

	@GetMapping("chan/mypage")
	public String mypage(Model m,@AuthenticationPrincipal SecurityUser users){
		User user =users.getUser();
		m.addAttribute("id",user);
		return "chan/mypage";	
	}
	@GetMapping("admin/asklist")
	public String asklist(@RequestParam(name="p", defaultValue="1") int page,Model m) {
		  int cntAsk = service4.cntAsk();
	      if(cntAsk > 0) {
	         
	         int perPage = 5; 
	         int startRow = (page - 1) * perPage; 
		List<Map<String,Object>> ask=service4.asklist(startRow);         
		m.addAttribute("ask",ask);
		 int pageNum = 5;
         int totalPages = cntAsk / perPage + (cntAsk % perPage > 0 ? 1 : 0); 
         
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
        m.addAttribute("cntAsk",cntAsk);
		return "admin/asklist";
	}
	@GetMapping("admin/reportlist")
	public String reportlist(@RequestParam(name="p", defaultValue="1") int page,Model m) {
		 int cntBan = service7.cntBan();
	      if(cntBan > 0) {
	         
	         int perPage = 5; 
	         int startRow = (page - 1) * perPage; 
	         List<Map<String,Object>> report=service7.reportlist(startRow);
		m.addAttribute("report",report);
		 int pageNum = 5;
         int totalPages = cntBan / perPage + (cntBan % perPage > 0 ? 1 : 0); 
         
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
      m.addAttribute("cntBan", cntBan);
		return "admin/reportlist";
	}
	   @GetMapping("/admin/bpopup/{bno}")
	   public String reporttext(@PathVariable int bno, Model m) {
		  Ban reporttext=service7.reporttext(bno); 
		  m.addAttribute("reporttext",reporttext);
	      return "admin/bpopup";
	   }
	   @GetMapping("/admin/apopup/{ano}")
	   public String asktext(@PathVariable int ano, Model m,Askcomm acm, @AuthenticationPrincipal SecurityUser user) {
		   List<Askcomm> info = service4.info(ano);
		  Ask asktext=service4.asktext(ano); 
		  m.addAttribute("asktext",asktext);
		  m.addAttribute("info",info);
		  m.addAttribute("id",user.getUser().getUserid());
	      return "admin/apopup";
	   }
	   
	   @PostMapping("admin/apopup")
	   public String insertcomm(Askcomm acm) {
		   service4.insertacm(acm);
		   return "redirect:/admin/apopup/"+acm.getAno();
	   }
	   
	   @GetMapping("admin/apopup1/{ano}/{acno}")
	   public String deleteacm(@PathVariable int ano,@PathVariable int acno) {
		   service4.deleteacm(acno);
		   return "redirect:/admin/apopup/"+ano;
	   }
	   
	 @GetMapping("chan/myRcpinfo/{rno}")
	 public String myRcpinfo(@PathVariable int rno, Model m) {
		Recipe Recipeinfo = service2.Recipeinfo(rno);
		 String all=service6.all();
		 m.addAttribute("all",all);
		m.addAttribute("Recipeinfo",Recipeinfo);
		 return "chan/myRcpinfo";
	 }
	 @PostMapping("chan/myRcpinfo1")
	 @ResponseBody
	 public String myRcpinfo1(int rno,Model m) {
		 String all=service6.all();
		 m.addAttribute("all",all);	
		service2.rlikesup(rno);
		 return "chan/myRcpinfo";
	 }
	 
	 @GetMapping("/post/rpopup/{pno}")
	 public String rpopup(@PathVariable int pno,Model m, @AuthenticationPrincipal SecurityUser user) {
		 
		 //Map<String,Object> dto= service5.communityOne(pno);
		 
		 m.addAttribute("pno", pno);
		 m.addAttribute("userid", user.getUser().getUserid());
		 
		 return "/post/rpopup";
	 }
	 
	 @PostMapping("post/rpopup1")
	 public String insertban(Ban ban) {
		 service7.inseertban(ban);
		 return "/tae/popupclose";
	 }
	 
	 @PostMapping("tae/deletePost")
	 @ResponseBody
	 public String deletepost(int pno) {
		 service5.deletePost(pno);
		 return "redirect:admin/reportlist";
	 }
	 
	 @GetMapping("tae/myask1")
	 public String myask(String id,@RequestParam(name="p", defaultValue="1") int page, Model m) {
		 int cntmyAsk = service4.cntmyAsk(id);
	     if(cntmyAsk > 0) {
	         
	         int perPage = 5; 
	         int startRow = (page - 1) * perPage;
		 List<Map<String, Object>> ask = service4.myask(id,startRow);
		 if (ask.size() == 0) {
			 return "tae/nullmyask";
		 } 
		 m.addAttribute("ask",ask);
		 int pageNum = 5;
         int totalPages = cntmyAsk / perPage + (cntmyAsk % perPage > 0 ? 1 : 0); 
         
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
	     m.addAttribute("cntmyAsk",cntmyAsk);
		 return "tae/myask";
		 }
		 		 

	 @GetMapping("tae/recipeSearch")
	 public String resultsearch(Recipe recipe,Model m) {
		 	
         	int search1 = service2.recipeSearch1(recipe);	
	         List<Recipe> search = service2.recipeSearch(recipe);
			 m.addAttribute("search",search);
	        
			List<Map<String,Object>> cateName=service2.cateName();
			List<String> rcpLevel=service2.rcpLevel();
			List<Map<String,Object>> rcpTime=service2.rcpTime();
			 String all=service6.all();
			
			 m.addAttribute("all",all);
			m.addAttribute("cateName",cateName);
			m.addAttribute("rcpLevel",rcpLevel);
			m.addAttribute("rcpTime",rcpTime);
		  m.addAttribute("search1",search1);
		 return "tae/recipeSearch";
	 }
	 @GetMapping("chan/myrecipeSearch")
	 public String resultmysearch(Recipe recipe,Model m) {	
         	int search2 = service2.recipeSearch2(recipe);	
	         List<Recipe> mysearch = service2.myrecipeSearch(recipe);
			 m.addAttribute("mysearch",mysearch);
	        
			List<Map<String,Object>> cateName=service2.cateName();
			List<String> rcpLevel=service2.rcpLevel();
			List<Map<String,Object>> rcpTime=service2.rcpTime();
			 String all=service6.all();
			 m.addAttribute("all",all);
			m.addAttribute("cateName",cateName);
			m.addAttribute("rcpLevel",rcpLevel);
			m.addAttribute("rcpTime",rcpTime);
		  m.addAttribute("search2",search2);
		 return "chan/myrecipeSearch";
	 }
	 @GetMapping("/admin/adstyle")
	 public String adstyle() {
		 return"/admin/adstyle";
	 }
	 @PostMapping("/admin/adstyle")
	 public String updateStyle(String styleimg,Model m){
		 service6.updateStyle(styleimg);		
		 return "redirect:/chan/main";
	 }

}




