package alone.study.mk;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import alone.study.dto.NoticeBoardDto;
import alone.study.service.NoticeBoardService;
import alone.study.service.ReplyService;
import alone.study.vo.PageMaker;

@Controller
@RequestMapping("/Notice/**")
public class NoticeBoardController {

	@Autowired
	NoticeBoardService bs;

	@Autowired
	ReplyService rs;

	@RequestMapping(value = "/NoticeBoard", method = RequestMethod.GET)
	public void noticeBoard(Principal principal, Model model, PageMaker pm) throws Exception {
		if (principal != null) {
			model.addAttribute("userId", principal.getName());
		}
		model.addAttribute("list", bs.listSearchCriteria(pm));
		pm.setTotalCount(bs.listSearchCount(pm));
	}

	@RequestMapping(value = "/NoticeBoard/{bno}", method = RequestMethod.GET)
	public String noticeBoard(@PathVariable("bno") int bno, Model model) throws Exception {
		model.addAttribute("dto", bs.read(bno));
		model.addAttribute("reply", rs.read(bno));
		return "/Notice/BoardDetail";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void wirte() throws Exception {

	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wirtePOST(Principal principal, NoticeBoardDto dto) throws Exception {
		dto.setWriter(principal.getName());
		bs.write(dto);
		return "redirect:/Notice/NoticeBoard";
	}

}
