package alone.study.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alone.study.dao.UserDao;
import alone.study.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void create(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.create(dto);
	}

	@Override
	public void update(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.update(dto);
	}

	@Override
	public void delete(String userId) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.delete(userId);
	}

	@Override
	public ArrayList<UserDto> userList() throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		return dao.userList();
	}

	@Override
	public UserDto userDetail(String userId) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		return dao.userDetail(userId);
	}

	@Override
	public void upgradeuser(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.upgradeuser(dto);
	}

	@Override
	public ArrayList<UserDto> noEnabledUserList() throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		return dao.noEnabledUserList();
	}

	@Override
	public int checkid(String userId) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		int result = dao.checkid(userId);
		return result;
	}

	@Override
	public String userName(String userId) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		String userName = dao.userName(userId);
		return userName;
	}

	@Override
	public String findId(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		String userId = dao.findId(dto);
		return userId;
	}

	@Override
	public int findPassword(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		int result = dao.findPassword(dto);
		return result;
	}

	@Override
	public void changePassword(UserDto dto) throws Exception {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.changePassword(dto);
	}

}
