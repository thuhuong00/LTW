package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.User;

@Controller
@Transactional
@RequestMapping("manageuser")
public class ManageUserController {
	private int maxinfo = 5;
	private int ma;
	@Autowired
	SessionFactory factory;

	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM User"; /* as us order by us.idUser desc */
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}

	@RequestMapping("/edit")
	public String edit(ModelMap model, @ModelAttribute("user") User user) {
		List<User> DSuser = this.getUsers();
		model.addAttribute("btnStatus", "btnAdd");
		model.addAttribute("users", DSuser);
		return "admin/muser";
	}

	public int insertUser(User us) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(us);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "edit", params = "btnAdd")
	public String addUser(ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult errors) {
		
		if (errors.hasErrors()) {
			List<User> DSuser = this.getUsers();
			model.addAttribute("users", DSuser);
			model.addAttribute("btnStatus", "btnAdd");
			return "admin/muser";
		}
		else{
			int check = this.insertUser(user);
			System.out.println(user.getUsername());
			if (check != 0) {
				model.addAttribute("message1", "Add success!");
				model.addAttribute(new User());
			} else {
				model.addAttribute("message0", "Add fail!");
			}
			List<User> DSuser = this.getUsers();
			model.addAttribute("users", DSuser);
		}
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/muser";
	}

	public int updateUser(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "edit", params = "btnEdit")
	public String edit_User(ModelMap model, @ModelAttribute("user") User user) {
		user.setIdUser(ma);
		int check = this.updateUser(user);
		if (check != 0) {
			model.addAttribute("message1", "Edit success!");
			model.addAttribute("btnStatus", "btnAdd");
			model.addAttribute("user", new User());
		} else {
			model.addAttribute("message0", "Edit fail!");
			model.addAttribute("btnStatus", "btnEdit");
		}
		List<User> DSuser = this.getUsers();
		model.addAttribute("users", DSuser);

		return "admin/muser";
	}

	public User get1User(int ma) {
		Session session = factory.getCurrentSession();
		String hql = "FROM User where idUser = :ma";
		Query query = session.createQuery(hql);
		query.setParameter("ma", ma);
		User list = (User) query.list().get(0);

		return list;
	}

	@RequestMapping(value = "edit/{idUser}.htm", params = "linkEdit")
	public String editUser(ModelMap model, @ModelAttribute("user") User user,
			@PathVariable("idUser") String idUser) {
		
		List<User> DSuser = this.getUsers();
		model.addAttribute("users", DSuser);
		ma = Integer.parseInt(idUser);
		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("user", this.get1User(ma));
		/*model.addAttribute("pagedListHolder", pagedListHolder);*/

		return "admin/muser";
	}

	public int deleteUser(User us) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(us);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "/edit/{idUser}.htm", params = "linkDelete")
	public String delete(ModelMap model, @ModelAttribute("user") User user,
			@PathVariable("idUser") String idUser) {

		int check = this.deleteUser(user);
		if (check != 0/* && user.getAdmin()==false*/) {
			model.addAttribute("message1", "Delete user success");
		} /*else if(check != 0 && user.getAdmin()==true){
			model.addAttribute("message0", "Can not delete an admin");
		}*/
		else {
			model.addAttribute("message0", "Delete user fail");
		}
		List<User> DSuser = this.getUsers();
		model.addAttribute("users", DSuser);

		return "admin/muser";
	}

}
