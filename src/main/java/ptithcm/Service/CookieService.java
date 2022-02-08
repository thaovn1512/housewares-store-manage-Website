package ptithcm.Service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class CookieService {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	
	public Cookie create(String name, String value, int days) {
		String encodeValue =Base64.getEncoder().encodeToString(value.getBytes());//Mã hóa giá trị cookie
		Cookie cookie=new Cookie(name, encodeValue);
		cookie.setMaxAge(days*24*60*60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
		
	}
	
public Cookie read(String name) {
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie:cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					String decodeValue=new String(Base64.getDecoder().decode(cookie.getValue()));//Giải mã cookie trước khi đưa lên client
					cookie.setValue(decodeValue);
					return cookie;
				}
			}
		}
		return null;
	}

public void delete(String name) {
	this.create(name, "", 0);
	
}
}
