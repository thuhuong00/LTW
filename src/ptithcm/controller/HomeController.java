package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Seed;

@Controller
@Transactional
public class HomeController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("/home")
	public String home() {
		return "home/index";
	}
	@RequestMapping("/manage")
	public String manage() {
		return "admin/home";
	}
	@RequestMapping("/index")
	public String index(ModelMap model) {
		List<Seed> list1 = getSeed();
		model.addAttribute("Seed", list1);
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/cart")
	public String cart() {
		return "cart/cart";
	}
	@RequestMapping("/cart/checkout")
	public String checkOut() {

		return "cart/checkout";
	}
	@RequestMapping("/CT_seeds")
	public String ct_seeds() {
		return "seeds/CT_Seeds";
	}
	public List<Seed> getSeed() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}
}
