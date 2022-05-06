package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Mailer;
import ptithcm.entity.Seed;
import ptithcm.entity.User;

@Controller
@Transactional
public class LoginController {
	User user = new User();

	@Autowired
	SessionFactory factory;

	@RequestMapping("login")
	public String login() {
		return "cus/login";
	}
	
//	@RequestMapping("logout")
//	public String logout(HttpSession ss) {
//		User us = new User();
//		ss.setAttribute("dn", us.getIdUser());
//		return "cus/home";
//	}

	@RequestMapping("register")
	public String dki(ModelMap model) {
		model.addAttribute("user", new User());
		return "cus/register";
	}

	public int checkUser(String username, String password) {
		int flag = 0;
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		for (User u : list) {
			if ((u.getUsername().equals(username)) && (u.getPassword().equals(password))) {
				if (u.getAdmin() == true)
					flag = 1;
				else
					flag = 2;
				break;
			}
		}
		return flag;
	}
	
	public List<Seed> getSeed() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession httpSession, ModelMap model) {
		User us = new User();
		httpSession.setAttribute("dn", us.getIdUser());
		httpSession.setAttribute("myLogin", null);
		httpSession.setAttribute("myOrder", null);
		List<Seed> list1 = getSeed();
		model.addAttribute("Seed", list1);
		return "home/index";
		/*return "redirect:home.htm";*/
	}

	@Autowired
	Mailer mailer;

	@RequestMapping("logininfo")
	public String login(HttpServletRequest rq, ModelMap model, HttpSession ss) {
		String username = rq.getParameter("username");
		String password = rq.getParameter("password");
		Session session = factory.getCurrentSession();
		String hql = "FROM User WHERE username = :username AND password = :password";
		/*
		 * = '" + username + "' AND password = '" + password + "'";
		 */ 
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<User> list = query.list();
		if ((list.size() == 0)&&(!username.isEmpty())&&(!password.isEmpty())) {/* query.list().isEmpty() */
			model.addAttribute("message0", "Incorrect username or password");
			return "cus/login";
		}
		else if((list.size() == 0)&&(username.isEmpty()||password.isEmpty())){
			model.addAttribute("message0", "Please enter your username & password");
			return "cus/login";
		}
		else {
			user = list.get(0);
			ss.setAttribute("myLogin", user);
			ss.setAttribute("dn", user.getAdmin());
			if (user.getAdmin() == false){
				List<Seed> list1 = getSeed();
				model.addAttribute("Seed", list1);
				return "home/index";
			}
			else
				return "admin/home";
		}
	}

	@RequestMapping(value = "registerinfor")
	public String register(ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Please correct your misinformation below");
			return "cus/register";
		}
		boolean check1 = false;
		if (!user.getPhone().matches("[0-9]{10}")) {
			errors.rejectValue("phone", "user", "Invalid format: 10 numbers include 0 - 9");
			check1 = true;
		}
		if (!user.getEmail().matches("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")) {
			errors.rejectValue("email", "user", "Invalid format: The email address format is local-part@domain");
			check1 = true;
		}
		if (check1 == true) {
			return "cus/register";
		}
		user.setAdmin(false);
		boolean check = false;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(user);
			t.commit();
			model.addAttribute("message0", "Create account success");
			model.addAttribute(new User());
			check = true;
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message0", "Create account fail");
		} finally {
			session.close();
			if (check == true) {
				mailer.send("tathuongthuong2516@gmail.com", user.getEmail(), "Successful account registration",
						"\nThank you for subscribing to our website. \nThe login information is as follows:"
								+ "\nUsername: " + user.getUsername() + "\n Password: " + user.getPassword());
			}
		}
		return "cus/register";
	}
}
