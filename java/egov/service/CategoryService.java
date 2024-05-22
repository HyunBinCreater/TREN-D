package egov.service;

import java.util.List;

public interface CategoryService {

	int CategoryInsert(CategoryVO vo) throws Exception;

	List<?> CategoryList1(CategoryVO vo) throws Exception;
	List<?> CategoryList2(CategoryVO vo) throws Exception;
	List<?> CategoryList3(CategoryVO vo) throws Exception;

	
	

}
