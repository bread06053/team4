package spring.example.controller;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.example.config.SecurityUser;
import spring.example.domain.Comment;
//import spring.example.domain.CommentDto;
import spring.example.domain.Post;
import spring.example.service.CommentService;
//import spring.example.service.CommentService;
import spring.example.service.CommunityService;
import spring.example.service.StyleService;

@Controller
public class CommunityController {
   
   @Autowired
   CommunityService service;
   
   @Autowired
   CommentService service2;
   
   @Autowired
   StyleService service3;
   
//   @Autowired
 //  CommentService c_service;
   
   @GetMapping("/post/postwrite")
   public String wirteForm(@AuthenticationPrincipal SecurityUser user, Model m) {
		 String all=service3.all();
		 m.addAttribute("all",all);
	   m.addAttribute("id",user.getUser().getUserid());
      return "post/postwrite";
   }
   
   @PostMapping("/post/postwrite")
   public String community_write(Post post,Model m) {
		 String all=service3.all();
		 m.addAttribute("all",all);
      service.insert(post);
      return "redirect:postlist";
   }
   
   @GetMapping("/post/postview/{pno}")
   public String content(@PathVariable int pno, Model m, @AuthenticationPrincipal SecurityUser user,Comment comm) {
	   Map<String,Object> dto= service.communityOne(pno);
	   List<Map<String,Object>> info = service2.infocomm(pno);
	   int i=service.commentCnt(pno);
		 String all=service3.all();
		 m.addAttribute("all",all);
	   m.addAttribute("info",info);
	   m.addAttribute("profile", user.getUser().getProfile());
	   m.addAttribute("id",user.getUser().getUserid());
	   m.addAttribute("dto", dto);
	   m.addAttribute("i",i);
   //   List<CommentDto> commentList = c_service.selectComment(comm_no);
    //  m.addAttribute("commentList", commentList);
      return "post/postview";
   }
   @PostMapping("post/postview")
   public String insertcomm(Comment comm,Model m) {
	   service2.insertcomm(comm);
		 String all=service3.all();
		 m.addAttribute("all",all);
	   return "redirect:/post/postview/"+comm.getPno();
   }
   @GetMapping("post/postview1/{cno}/{pno}")
   public String deletecomm(@PathVariable int cno,@PathVariable int pno,Model m) {
	   service2.deletecomm(cno);
		 String all=service3.all();
		 m.addAttribute("all",all);
	   return "redirect:/post/postview/"+pno;
   }
   
   @GetMapping("/post/postupdate/{pno}")
   public String community_update(@PathVariable int pno, Model m) {
	  Map<String,Object> dto = service.communityOne(pno);
		 String all=service3.all();
		 m.addAttribute("all",all);
      m.addAttribute("dto", dto);
      return "post/postupdate";
   }
   
   @PostMapping("/post/postupdate")
   public String update(Post post,Model m) {
		 String all=service3.all();
		 m.addAttribute("all",all);
      service.updatePost(post);
      return "redirect:postlist";
   }
   
   @DeleteMapping("/post/delete")
   @ResponseBody
   public String delete(int pno) {
      int i = service.deletePost(pno);
      return ""+i;
   }
   
   @GetMapping("/post/postlist")
   public String community_list(String sort, @RequestParam(name="p", defaultValue="1") int page, Model m) {   
      
      
	   
      int count = service.count();
      if(count > 0) {
         
         int perPage = 20; 
         int startRow = (page - 1) * perPage; 
         
         List<Post> communityList = service.communityList(sort, startRow);
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
		 String all=service3.all();
		 m.addAttribute("all",all);
      m.addAttribute("sort", sort);
      m.addAttribute("count", count);
      return "post/postlist";
   }
   
   @GetMapping("/post/postsearch")
   public String search(String sort, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
      int count = service.countSearch(search);
      if(count > 0) {
      
      int perPage = 20; 
      int startRow = (page - 1) * perPage;
      int endRow = page * perPage;
      
      List<Post> communityList = service.communityListSearch(sort, search, startRow);
      m.addAttribute("cList", communityList);
      

      int pageNum = 5;
      int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
      
      int begin = (page - 1) / pageNum * pageNum + 1;
      int end = begin + pageNum - 1;
      if(end > totalPages) {
         end = totalPages;
      }
       m.addAttribute("begin", begin);
       m.addAttribute("pageNum", pageNum);
       m.addAttribute("totalPages", totalPages);
       m.addAttribute("end", end);
      }
		 String all=service3.all();
		 m.addAttribute("all",all);
      m.addAttribute("count", count);
      m.addAttribute("sort", sort);
      m.addAttribute("search", search);
      
      return "post/postsearch";
   }
   
   
}
