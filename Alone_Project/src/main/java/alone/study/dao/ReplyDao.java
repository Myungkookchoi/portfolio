package alone.study.dao;

import java.util.List;

import alone.study.dto.ReplyDto;

public interface ReplyDao {
	public List<ReplyDto> read(int bno) throws Exception;

	public void insert(ReplyDto dto) throws Exception;

	public void update(ReplyDto dto) throws Exception;

	public void delete(ReplyDto dto) throws Exception;
}
