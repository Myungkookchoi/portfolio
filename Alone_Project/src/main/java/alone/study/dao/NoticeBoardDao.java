package alone.study.dao;

import java.util.List;

import alone.study.dto.NoticeBoardDto;
import alone.study.vo.PageMaker;

public interface NoticeBoardDao {
	public void write(NoticeBoardDto dto) throws Exception;

	public NoticeBoardDto read(int bno) throws Exception;

	public void update(NoticeBoardDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<NoticeBoardDto> listSearch(PageMaker pm) throws Exception;

	public int listSearchCount(PageMaker pm) throws Exception;
}
