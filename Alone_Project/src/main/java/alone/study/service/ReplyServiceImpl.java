package alone.study.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alone.study.dao.ReplyDao;
import alone.study.dto.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	SqlSession sql;

	@Override
	public List<ReplyDto> read(int bno) throws Exception {
		ReplyDao dao = sql.getMapper(ReplyDao.class);
		return dao.read(bno);
	}

	@Override
	public void insert(ReplyDto dto) throws Exception {
		ReplyDao dao = sql.getMapper(ReplyDao.class);
		dao.insert(dto);
	}

	@Override
	public void update(ReplyDto dto) throws Exception {
		ReplyDao dao = sql.getMapper(ReplyDao.class);
		dao.update(dto);
	}

	@Override
	public void delete(ReplyDto dto) throws Exception {
		ReplyDao dao = sql.getMapper(ReplyDao.class);
		dao.delete(dto);
	}

}
