package spring.example.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.example.config.SecurityUser;
import spring.example.dao.PostDao;
import spring.example.domain.Post;

@Controller
@Log4j2
@RequestMapping("/post")
@RequiredArgsConstructor
public class PostController {
    private final PostDao postDao;

    @GetMapping("/write")
    public String getWritePage() {
        return "ju/write";
    }

    @PostMapping("/upload")
    public String insert(@AuthenticationPrincipal SecurityUser currentUser, Post post) {
        post.setUserid(currentUser.getUsername());
        postDao.insertPost(post);

        log.info("Successfully Uploaded");
        // View Page 제작할 때까지 임시적으로 메인 페이지로 이동 시킬 것임.
        return "redirect:/chan/main";
    }
}
