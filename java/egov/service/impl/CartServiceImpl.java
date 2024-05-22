package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.CartItemVO;
import egov.service.CartService;
import egov.service.CartVO;

// Controller와의 연결을 담당하는 어노테이션 설정
@Service("cartService")
public class CartServiceImpl implements CartService {

	@Resource(name="cartMapper")
	CartMapper cartMapper;
	
	@Override
	public int cartInsert(CartItemVO vo) throws Exception {
		return cartMapper.cartInsert(vo);
	}

	@Override
	public List<?> cartSelectList(CartVO vo) throws Exception {
		return cartMapper.cartSelectList(vo);
	}
	
	@Override
	public int cartItemAmountUpdate(CartVO vo) throws Exception {
		return cartMapper.cartItemAmountUpdate(vo);
	}

	@Override
	public int cartAmountUpdate(CartVO vo) throws Exception {
		return cartMapper.cartAmountUpdate(vo);
	}

	@Override
	public int cartItemDelete(CartVO vo) throws Exception {
		return cartMapper.cartItemDelete(vo);
	}

	
}
