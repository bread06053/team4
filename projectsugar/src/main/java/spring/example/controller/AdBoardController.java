package spring.example.controller;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.example.domain.AdBoard;
import spring.example.domain.AdPageHandler;
import spring.example.service.AdBoardService;

@Controller
public class AdBoardController {
	@Autowired
	AdBoardService adBoardService;

	@GetMapping("/admin/list")
	public String list(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer pageSize, Model m) throws Exception {
		try {
			int totalCnt = adBoardService.getCount();
			m.addAttribute("totalCnt", totalCnt);

			AdPageHandler pageHandler = new AdPageHandler(totalCnt, page, pageSize);

			if (page < 0 || page > pageHandler.getTotalPage())
				page = 1;
			if (pageSize < 0 || pageSize > 50)
				pageSize = 10;

			Map<String, Integer> map = new HashMap<>();
			List<AdBoard> list;

			map.put("offset", (page - 1) * pageSize);
			map.put("pageSize", pageSize);
			list = adBoardService.selectPage(map);

			m.addAttribute("list", list);
			m.addAttribute("ph", pageHandler);

			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", startOfToday.toEpochMilli());
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}

		return "jung/AdBoardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
	}

	@GetMapping("/admin/read")
	public String read(Integer bno, Integer page, Integer pageSize, RedirectAttributes rattr, Model m) throws Exception {
		try {
			AdBoard adBoard = adBoardService.read(bno);
			m.addAttribute("adBoard", adBoard);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "READ_ERR");
			return "redirect:/admin/list";
		}

		return "jung/AdBoard";
	}

	@PostMapping("/admin/remove")
	public String remove(Integer bno, RedirectAttributes rattr) {
		String msg = "DEL_OK";

		try {
			if (adBoardService.remove(bno) != 1)
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
