package ptithcm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/user/")
public class UserManager {
	
	@RequestMapping("index")
	public String index() {
		
		return "admin/user";
	}
		
	
}
