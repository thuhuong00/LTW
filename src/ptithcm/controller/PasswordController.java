package ptithcm.controller;

import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import ptithcm.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Mailer;

@Transactional
@Controller
public class PasswordController {
	@Autowired
	SessionFactory factory;

	public String taoMatKhau() {
		Random generator = new Random();
		int value = generator.nextInt((999999 - 100000) + 1) + 100000;
		return value + "";
	}

	@RequestMapping("forgot")
	public String matKhau() {
		return "cus/forgot-password";
	}

	@Autowired
	Mailer mailer;

	@RequestMapping("reset")
	public String datLaiMK(HttpServletRequest rq, ModelMap model) {
		String email = rq.getParameter("email");
		Session session = factory.getCurrentSession();
		String hql = "FROM User WHERE email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<User> list = query.list();
		// session.close();

		if (list.size() == 0) {
			model.addAttribute("message", "Email does not exist, please check again!");
		} else {
			String mk = taoMatKhau();
			// Cập nhật mật khẩu
			Session session2 = factory.openSession();
			Transaction t = session2.beginTransaction();
			try {
				User us = new User(list.get(0).getIdUser(), list.get(0).getUsername(), mk, list.get(0).getFirstName(),
						list.get(0).getLastName(), list.get(0).getAddress(), list.get(0).getPhone(),
						list.get(0).getEmail(), list.get(0).getAdmin());
				session2.update(us);
				t.commit();

			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", e);
			} finally {
				session2.close();
			}
			try {
				mailer.send("tathuongthuong2516@gmail.com.com", email, "Reset your password",
						"Your new password is: " + mk);
				model.addAttribute("message1", "New password has been sent to your email!");
			} catch (Exception e) {
				model.addAttribute("message", "Email sending failed!");
			}
		}
		return "cus/forgot-password";
	}
}
