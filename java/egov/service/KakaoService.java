package egov.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface KakaoService {

	public String getToken(String code) throws Exception;

	public ArrayList<Object> getUserInfo(String access_token) throws Exception;


}
