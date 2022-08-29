package alone.study.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alone.study.dao.NoticeBoardDao;
import alone.study.dto.NoticeBoardDto;
import alone.study.vo.PageMaker;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private SqlSession sql;

	@Override
	public void write(NoticeBoardDto dto) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		dao.write(dto);
	}

	@Override
	public NoticeBoardDto read(int bno) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		NoticeBoardDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public void update(NoticeBoardDto dto) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		dao.update(dto);

	}

	@Override
	public void delete(int bno) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		dao.delete(bno);
	}

	@Override
	public List<NoticeBoardDto> listSearchCriteria(PageMaker pm) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		return dao.listSearch(pm);
	}

	@Override
	public int listSearchCount(PageMaker pm) throws Exception {
		NoticeBoardDao dao = sql.getMapper(NoticeBoardDao.class);
		return dao.listSearchCount(pm);
	}

}
