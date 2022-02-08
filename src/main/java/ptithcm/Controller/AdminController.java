package ptithcm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.DAO.ReportDAO;


@Controller
@RequestMapping("admin/")
public class AdminController {
	@Autowired
	ReportDAO dao;
	@RequestMapping("index")
	public String indexShow(ModelMap model) {
		model.addAttribute("data",dao.revenueByCategory());
		model.addAttribute("dataMonth",dao.revenueByMonth());
		return "admin/index";
	}
}
