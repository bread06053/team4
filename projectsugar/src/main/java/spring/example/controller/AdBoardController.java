package spring.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.example.domain.AdBoard;
import spring.example.service.AdBoardService;

@Controller
public class AdBoardController {
    @Autowired
    AdBoardService adBoardService;
	
	@GetMapping("/admin/list")
	public String list(Model m) throws Exception {
        try {
            List<AdBoard> list = adBoardService.getList();
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        return "jung/AdBoardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

	@GetMapping("/admin/read")
	public String read(Integer bno, Model m) throws Exception {
		try {
			AdBoard adBoard = adBoardService.read(bno);
	        m.addAttribute("adBoard", adBoard);
		} catch (Exception e) {
			e.printStackTrace();
            throw e;
		}

        return "jung/AdBoard";
    }
	
    @PostMapping("/admin/remove")
    public String remove(Integer bno, RedirectAttributes rattr) {
        String msg = "DEL_OK";

        try {
            if(adBoardService.remove(bno)!=1)
                throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addFlashAttribute("msg", msg);
        return "redirect:/admin/list";
    }
    
    @GetMapping("/member/ban")
    public String write(Integer pno, Model m) {
        m.addAttribute("mode", "new");
        m.addAttribute("pno", pno);
        return "jung/AdBoard";
    }

    @PostMapping("/member/ban")
    public String write(AdBoard adBoard, RedirectAttributes rattr, Model m) {
    	SecurityContext context = SecurityContextHolder.getContext();
    	Authentication authentication = context.getAuthentication();
    	String userid = authentication.getName();
        adBoard.setUserid(userid);

        try {
            if (adBoardService.write(adBoard) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(adBoard);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "jung/AdBoard";
        }
    }
}
