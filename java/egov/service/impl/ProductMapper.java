package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.BoardVO;
import egov.service.ProductVO;
import egov.service.Used_productVO;
import egov.service.searchVO;

@Mapper("productMapper")
public interface ProductMapper {

	List<?> searchSelectList(searchVO svo);

	List<?> usedsearchSelectList(searchVO svo);

	int searchSelectTotal(ProductVO vo);

	int usedsearchSelectTotal(Used_productVO vo1);

	List<?> newproductUpList();

	ProductVO productSelectLsit(String prounq);

}
