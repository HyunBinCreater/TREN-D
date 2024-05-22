package egov.service;

public interface UserService {

	UserVO userSelectDetail(UserVO vo) throws Exception;
	
	UserVO userSelect2Detail(UserVO vo) throws Exception;

	int userUpdate(UserVO vo) throws Exception;

	int userSelectpassCnt(UserVO vo) throws Exception;
	
	int userSizeUpdate(UserVO vo) throws Exception;	

	int userSizeInsert(UserVO vo) throws Exception;

	int userPassModifySave(UserVO vo) throws Exception;

	int addInfoUpdate(UserVO vo) throws Exception;

	

}