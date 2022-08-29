package alone.study.mk;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import alone.study.service.NoticeBoardService;
import alone.study.vo.PageMaker;

@RestController
@RequestMapping("/Notice/")
public class SearchNoticeBoard {

	@Autowired
	NoticeBoardService bs;

	@RequestMapping(value = "/NoticeBoard/{searchType}/{keyword}", method = RequestMethod.GET)
	public void noticeBoard(@PathVariable("searchType") String searchType, @PathVariable("keyword") String keyword,
			Principal principal, Model model, PageMaker pm) throws Exception {
		pm.setKeyword(keyword);
		pm.setSearchType(searchType);
		model.addAttribute("userId", principal.getName());
		model.addAttribute("list", bs.listSearchCriteria(pm));
	}
}