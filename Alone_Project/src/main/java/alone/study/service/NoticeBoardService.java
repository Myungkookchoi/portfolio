package alone.study.service;

import java.util.List;

import alone.study.dto.NoticeBoardDto;
import alone.study.vo.PageMaker;

public interface NoticeBoardService {
	public void write(NoticeBoardDto dto) throws Exception;

	public NoticeBoardDto read(int bno) throws Exception;

	public void update(NoticeBoardDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<NoticeBoardDto> listSearchCriteria(PageMaker pm) throws Exception;

	public int listSearchCount(PageMaker pm) throws Exception;
}
