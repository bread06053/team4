package spring.example.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import spring.example.domain.CommentDto;
import spring.example.domain.Post;
//import spring.example.service.CommentService;
import spring.example.service.CommunityService;

@Controller
public class CommunityController {
   
   @Autowired
   CommunityService service;
   
   @Autowired
 //  CommentService c_service;
   
   @GetMapping("/community/community_write")
   public String wirteForm() {
      return "community/community_write";
   }
   
   @PostMapping("/community/community_write")
   public String community_write(Post post) {
      service.insert(post);
      
      return "redirect:community_list";
   }
   
   @GetMapping("/community/community_view/{pno}")
   public String content(@PathVariable int pno, Model m) {
	   Post post = service.communityOne(pno);
      m.addAttribute("dto", post);
   //   List<CommentDto> commentList = c_service.selectComment(comm_no);
    //  m.addAttribute("commentList", commentList);
      return "community/community_view";
   }
   
   @GetMapping("/community/community_update/{pno}")
   public String community_update(@PathVariable int pno, Model m) {
      Post post = service.communityOne(pno);
      m.addAttribute("dto", post);
      return "community/community_update";
   }
   
   @PutMapping("/community/community_update")
   public String update(Post post) {
      service.updatePost(post);
      return "redirect:community_list";
   }
   
   @DeleteMapping("/community/delete")
   @ResponseBody
   public String delete(int pno) {
      int i = service.deletePost(pno);
      return ""+i;
   }
   
   @GetMapping("/community/community_list")
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
      
      m.addAttribute("sort", sort);
      m.addAttribute("count", count);
      return "community/community_list";
   }
   
   @GetMapping("/community/community_search")
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
      m.addAttribute("count", count);
      m.addAttribute("sort", sort);
      m.addAttribute("search", search);
      
      return "community/community_search";
   }
   
}
