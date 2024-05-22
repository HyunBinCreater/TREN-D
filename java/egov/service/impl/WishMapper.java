package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.WishListVO;
import egov.service.WishVO;

@Mapper("wishMapper")
public interface WishMapper {

	List<?> wishBrandList(WishVO vo);

	List<?> wishList(WishListVO vo);

	int wishBrandDelete(WishVO vo);

	int wishListDelete(WishListVO vo);

	
	
}
