package egov.service;

import java.util.List;

public interface ProductService {
	
	List<?> searchSelectList(searchVO svo) throws Exception;

	List<?> usedsearchSelectList(searchVO svo)throws Exception;

	int searchSelectTotal(ProductVO vo)throws Exception;

	int usedsearchSelectTotal(Used_productVO vo1)throws Exception;
	
	List<?> newproductUpList()throws Exception;

	//리뷰 수정 제품 정보 가져오기
	ProductVO productSelectLsit(String prounq)throws Exception;
	
	
}
