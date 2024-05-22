package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.AdminProductService;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService{
	
	@Resource(name="adminProductMapper")
	AdminProductMapper adminProductMapper;

}
