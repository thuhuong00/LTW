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

import ptithcm.entity.Seed;
import ptithcm.entity.TypeSeed;

@Controller
@Transactional
@RequestMapping("quanlyhatgiong")
public class QuanLyHatGiongHuong {
	private int maxinfo = 5;
	private int ma;
	@Autowired
	SessionFactory factory;

	// lấy danh sách Seed
	public List<Seed> getSeed() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}
	@RequestMapping("/edit")
	public String edit(ModelMap model, @ModelAttribute("Seed") Seed seed) {
		List<Seed> list = this.getSeed();
		model.addAttribute("btnStatus", "btnAdd");
		model.addAttribute("Seed", new Seed() );
		model.addAttribute("list", list);
		return "admin/mseed";
	}

	public int insertSeed(Seed s) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(s);
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
	public String addSeed(ModelMap model, @Validated @ModelAttribute("Seed") Seed seed, BindingResult errors) {
		
		if (errors.hasErrors()) {
			List<Seed> list = this.getSeed();
			model.addAttribute("list", list);
			model.addAttribute("btnStatus", "btnAdd");
			return "admin/mseed";
		}
		else{
			int check = this.insertSeed(seed);
			System.out.println(seed.getIdSeed());
			if (check != 0) {
				model.addAttribute("message1", "Add success!");
				model.addAttribute(new Seed());
			} else {
				model.addAttribute("message0", "Add fail!");
			}
			List<Seed> list = this.getSeed();
			model.addAttribute("list", list);
		}
		model.addAttribute("btnStatus", "btnAdd");
		return "admin/mseed";
	}

	public int updateSeed(Seed seed) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(seed);
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
	public String edit_Seed(ModelMap model, @ModelAttribute("Seed") Seed seed) {
		seed.setIdSeed(ma);
		int check = this.updateSeed(seed);
		if (check != 0) {
			model.addAttribute("message1", "Edit success!");
			model.addAttribute("btnStatus", "btnAdd");
			model.addAttribute("user", new Seed());
		} else {
			model.addAttribute("message0", "Edit fail!");
			model.addAttribute("btnStatus", "btnEdit");
		}
		List<Seed> list = this.getSeed();
		model.addAttribute("list", list);

		return "admin/mseed";
	}

	public Seed get1Seed(int ma) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed where idSeed = :ma";
		Query query = session.createQuery(hql);
		query.setParameter("ma", ma);
		Seed list = (Seed) query.list().get(0);

		return list;
	}

	@RequestMapping(value = "edit/{idSeed}.htm", params = "linkEdit")
	public String editSeed(ModelMap model, @ModelAttribute("Seed") Seed seed,
			@PathVariable("idSeed") String idSeed) {
		
		List<Seed> list = this.getSeed();
		model.addAttribute("list", list);
		ma = Integer.parseInt(idSeed);
		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("Seed", this.get1Seed(ma));

		return "admin/mseed";
	}

	public int deleteSeed(Seed s) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(s);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "/edit/{idSeed}.htm", params = "linkDelete")
	public String delete(ModelMap model, @ModelAttribute("Seed") Seed seed,
			@PathVariable("idSeed") String idSeed) {

		int check = this.deleteSeed(seed);
		if (check != 0/* && user.getAdmin()==false*/) {
			model.addAttribute("message1", "Delete seed success");
		} /*else if(check != 0 && user.getAdmin()==true){
			model.addAttribute("message0", "Can not delete an admin");
		}*/
		else {
			model.addAttribute("message0", "Delete seed fail");
		}
		List<Seed> list = this.getSeed();
		model.addAttribute("list", list);

		return "admin/mseed";
	}
}
