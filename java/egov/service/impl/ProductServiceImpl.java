package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.BoardVO;
import egov.service.ProductService;
import egov.service.ProductVO;
import egov.service.Used_productVO;
import egov.service.searchVO;
import egov.service.impl.ProductMapper;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Resource(name="productMapper")
	ProductMapper productMapper;

	@Override
	public List<?> searchSelectList(searchVO svo) throws Exception {
		return productMapper.searchSelectList(svo);
	}

	@Override
	public List<?> usedsearchSelectList(searchVO svo) throws Exception {
		return productMapper.usedsearchSelectList(svo);
	}

	@Override
	public int searchSelectTotal(ProductVO vo) throws Exception {
		return productMapper.searchSelectTotal(vo);
	}

	@Override
	public int usedsearchSelectTotal(Used_productVO vo1) throws Exception {
		return productMapper.usedsearchSelectTotal(vo1);		
	}

	@Override
	public List<?> newproductUpList() throws Exception {
		return productMapper.newproductUpList();
	}

	@Override
	public ProductVO productSelectLsit(String prounq) throws Exception {
		return productMapper.productSelectLsit(prounq);
	}

	
	
	
}
