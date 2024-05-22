package egov.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.UserVO;

@Mapper("userMapper")
public interface UserMapper {

	UserVO userSelectDetail(UserVO vo);
	
	UserVO userSelect2Detail(UserVO vo);

	int userUpdate(UserVO vo);

	int userSelectpassCnt(UserVO vo);

	int userSizeInsert(UserVO vo);
	
	int userSizeUpdate(UserVO vo);		

	int userPassModifySave(UserVO vo);

	int addInfoUpdate(UserVO vo);

}
