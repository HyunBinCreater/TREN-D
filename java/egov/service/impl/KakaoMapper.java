package egov.service.impl;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("kakaoMapper")
public interface KakaoMapper {

	String getReturnAccessToken(String code);

	Map<String, Object> getUserInfo(String kakaoToken);

}
