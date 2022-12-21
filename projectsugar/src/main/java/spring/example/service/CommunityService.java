package spring.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.example.dao.PostDao;
import spring.example.domain.Post;

@Service
public class CommunityService {

   @Autowired
   PostDao dao;
   
   public int insert (Post post) {
      return dao.insert(post);
   }
   
   public int count() {
      return dao.count();
   }
   
   public Post communityOne(int pno) {
      dao.addReadcount(pno);
      return dao.communityOne(pno);
   }
   
   
   public int updatePost(Post post) {
      return dao.updatePost(post);
   }
   
   public int deletePost(int pno) {
      return dao.deletePost(pno);
   }
   
   public Post viewPost(int pno) {
      return dao.viewPost(pno);
   }
   
   public List<Post> communityList(String sort, int start){
      
      Map<String, Object> m = new HashMap<String, Object>();
      m.put("sort", sort);//
      m.put("start", start);
      m.put("count", 20);
      return dao.communityList(m);
   }
   
   public List<Post> communityListSearch(String sort, String search, int start){
      Map<String,Object> m = new HashMap<String, Object>();
      m.put("sort", sort);
      m.put("search", search);
      m.put("start", start);
      m.put("count", 20);
      return dao.communityListSearch(m);
   }
   
   public int countSearch(String search) {
      Map<String,Object> m = new HashMap<String, Object>();
      m.put("search", search);
      return dao.countSearch(m);
   }
   


}