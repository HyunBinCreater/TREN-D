package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.CategoryVO;

@Mapper("categoryMapper")
public interface CategoryMapper {

	int CategoryInsert(CategoryVO vo);

	List<?> CategoryList1(CategoryVO vo);

	List<?> CategoryList2(CategoryVO vo);

	List<?> CategoryList3(CategoryVO vo);
	
	
	

}
