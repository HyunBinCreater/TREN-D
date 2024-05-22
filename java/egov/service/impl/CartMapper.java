package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.CartItemVO;
import egov.service.CartVO;

@Mapper("cartMapper")
public interface CartMapper {

	List<?> cartSelectList(CartVO vo);

	int cartInsert(CartItemVO vo);
	
	int cartItemAmountUpdate(CartVO vo);

	int cartAmountUpdate(CartVO vo);

	int cartItemDelete(CartVO vo);


}
