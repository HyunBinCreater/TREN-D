package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.WishListVO;
import egov.service.WishService;
import egov.service.WishVO;

// Controller와의 연결을 담당하는 어노테이션 설정
@Service("wishService")
public class WishServiceImpl implements WishService {

	@Resource(name="wishMapper")
	WishMapper wishMapper;

	@Override
	public List<?> wishBrandList(WishVO vo) throws Exception {
		return wishMapper.wishBrandList(vo);
	}
	
	@Override
	public List<?> wishList(WishListVO vo) throws Exception {
		return wishMapper.wishList(vo);
	}

	@Override
	public int wishBrandDelete(WishVO vo) throws Exception {
		return wishMapper.wishBrandDelete(vo);
	}

	@Override
	public int wishListDelete(WishListVO vo) throws Exception {
		return wishMapper.wishListDelete(vo);
	}




	

	
	
	
}
