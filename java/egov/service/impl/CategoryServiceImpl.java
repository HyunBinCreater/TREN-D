package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.CategoryService;
import egov.service.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	
	@Resource(name="categoryMapper")
	CategoryMapper categoryMapper;

	@Override
	public int CategoryInsert(CategoryVO vo) throws Exception {
		
		return categoryMapper.CategoryInsert(vo);
	}

	@Override
	public List<?> CategoryList1(CategoryVO vo) throws Exception {
		
		return categoryMapper.CategoryList1(vo);
	}

	@Override
	public List<?> CategoryList2(CategoryVO vo) throws Exception {
		
		return categoryMapper.CategoryList2(vo);
	}

	@Override
	public List<?> CategoryList3(CategoryVO vo) throws Exception {
		
		return categoryMapper.CategoryList3(vo);
	}
	

}
