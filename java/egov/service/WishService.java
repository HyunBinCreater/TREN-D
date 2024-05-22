package egov.service;

import java.util.List;

public interface WishService {

	List<?> wishBrandList(WishVO vo) throws Exception;

	List<?> wishList(WishListVO vo) throws Exception;
	
	int wishBrandDelete(WishVO vo) throws Exception;

	int wishListDelete(WishListVO vo) throws Exception;

	

	


}
