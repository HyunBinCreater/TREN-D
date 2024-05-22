package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.UserService;
import egov.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userMapper")
	UserMapper userMapper;

	@Override
	public UserVO userSelectDetail(UserVO vo) throws Exception {		
		return userMapper.userSelectDetail(vo);
	}
	
	@Override
	public int userUpdate(UserVO vo) throws Exception {		
		return userMapper.userUpdate(vo);
	}

	@Override
	public int userSelectpassCnt(UserVO vo) throws Exception {
		return userMapper.userSelectpassCnt(vo);
	}

	@Override
	public int userPassModifySave(UserVO vo) throws Exception {
		return userMapper.userPassModifySave(vo);
	}
	
	@Override
	public int userSizeInsert(UserVO vo) throws Exception {
		return userMapper.userSizeInsert(vo);
	}
	
	@Override
	public int userSizeUpdate(UserVO vo) throws Exception {
		return userMapper.userSizeUpdate(vo);
	}

	@Override
	public UserVO userSelect2Detail(UserVO vo) throws Exception {
		return userMapper.userSelect2Detail(vo);
	}

	@Override
	public int addInfoUpdate(UserVO vo) throws Exception {
		return userMapper.addInfoUpdate(vo);
	}




	


}
