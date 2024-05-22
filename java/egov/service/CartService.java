package egov.service;

import java.util.List;

public interface CartService {
	
	int cartInsert(CartItemVO vo) throws Exception;
	
	List<?> cartSelectList(CartVO vo) throws Exception;

	int cartItemAmountUpdate(CartVO vo) throws Exception;

	int cartAmountUpdate(CartVO vo) throws Exception;

	int cartItemDelete(CartVO vo) throws Exception;

	
}
