package ptithcm.controller;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.OrderDetail;
import ptithcm.entity.Seed;

import ptithcm.entity.TypeSeed;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/seed/")

public class SeedController {
	@Autowired
	SessionFactory factory;
	List<Seed> DSCart = new ArrayList<>();
	@RequestMapping("/cart/{idSeed}")
	public String themGioHang(ModelMap model, @ModelAttribute("idSeed") int idSeed){
		Session session = factory.getCurrentSession();
		Seed s = (Seed) session.get(Seed.class, idSeed);
		DSCart.add(s);
		model.addAttribute("Seed",s);
		return "seeds/CT_Seeds";
	}
	@RequestMapping("/cart")
	public String gioHang(ModelMap model) {
		model.addAttribute("DSCart",DSCart);
		
		return "cart/cart";
	}
	
	// lấy danh sách Seed
	public List<Seed> getSeed() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}

	// lấy ngẫu nhiên 4 seed từ bảng
	public List<Seed> get4Seed() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed ORDER BY NEWID()";
		Query query = session.createQuery(hql).setMaxResults(4);
		List<Seed> list = query.list();
		return list;
	}

	// lấy 1 list Seed
	@RequestMapping("index")
	public String ShowHatGiong(ModelMap model) {
		List<Seed> list = getSeed();
		for (Seed l : list) {
			System.out.print(l.getIdSeed());
		}
		model.addAttribute("Seed", list);
		return "index";
	}

	// lấy 1 Seed từ mã seed (idSeed)
	/*@RequestMapping(value = "{idSeed}", method = RequestMethod.GET)
	public String CT_hatGiong(ModelMap model, @ModelAttribute("idSeed") int idSeed) {
		Session session = factory.getCurrentSession();
		Seed seed = (Seed) session.get(Seed.class, idSeed);
		System.out.print(seed.getInformation());
		model.addAttribute("Seed", seed);
		List<Seed> list4Seed = get4Seed();
		model.addAttribute("ShowBonSeed", list4Seed);
		for (Seed l : list4Seed) {
			System.out.print("\n 4 SEED: ");
			System.out.print(l.getIdSeed());
		}
		return "seeds/CT_Seeds";
	}*/

	// lấy hạt giống hoa
	public List<Seed> getHoa() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed s WHERE s.typeSeed = 1";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}

	// lấy 1 list hoa Seed
	@RequestMapping("hoa")
	public String ShowHatGiongHoa(ModelMap model) {
		List<Seed> list = getHoa();
		for (Seed l : list) {
			System.out.print(l.getIdSeed());
		}
		model.addAttribute("Seed", list);
		return "TypeSeed/hatgionghoa";
	}

	// lấy hạt giống rau
	public List<Seed> getRau() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed s WHERE s.typeSeed = 2";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}

	// lấy 1 list rau Seed
	@RequestMapping("rau")
	public String ShowHatGiongRau(ModelMap model) {
		List<Seed> list = getRau();
		for (Seed l : list) {
			System.out.print(l.getIdSeed());
		}
		model.addAttribute("Seed", list);
		return "TypeSeed/hatgiongrau";
	}

	// lấy hạt giống rau mầm
	public List<Seed> getRauMam() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed s WHERE s.typeSeed = 3";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}

	// lấy 1 list rau mầm Seed
	@RequestMapping("raumam")
	public String ShowHatGiongRauMam(ModelMap model) {
		List<Seed> list = getRauMam();
		for (Seed l : list) {
			System.out.print(l.getIdSeed());
		}
		model.addAttribute("Seed", list);
		return "TypeSeed/hatgiongraumam";
	}

	// lấy hạt giống cây thuốc
	public List<Seed> getCauThuoc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Seed s WHERE s.typeSeed = 9";
		Query query = session.createQuery(hql);
		List<Seed> list = query.list();
		return list;
	}

	// lấy 1 list cây thuốc Seed
	@RequestMapping("caythuoc")
	public String ShowHatGiongCayThuoc(ModelMap model) {
		List<Seed> list = getCauThuoc();
		for (Seed l : list) {
			System.out.print(l.getIdSeed());
		}
		model.addAttribute("Seed", list);
		return "TypeSeed/hatgiongcaythuoc";
	}
	
	@RequestMapping(value = "{idSeed}", method = RequestMethod.GET)
	public String hat2(ModelMap model, @PathVariable("idSeed") String idSeed, HttpSession httpSession) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TypeSeed";
		Query query = session.createQuery(hql);
		List<TypeSeed> list = query.list();
		model.addAttribute("TypeSeeds", list);
		hql = "FROM Seed WHERE idSeed = '" + idSeed + "'";
		query = session.createQuery(hql);
		if(query.list().size()==0)
			return "404";
		Seed seed = (Seed) query.list().get(0);
		model.addAttribute("Seed", seed);
		List<Seed> list4Seed = get4Seed();
		model.addAttribute("ShowBonSeed", list4Seed);
		hql = "FROM TypeSeed WHERE idTypeSeed=" + seed.getTypeSeed().getIdTypeSeed();
		query = session.createQuery(hql);
		TypeSeed list2 = (TypeSeed) query.list().get(0);
		model.addAttribute("TypeSeedName", list2.getTypeSeedName());
		OrderDetail orderDetail = new OrderDetail();
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute(idSeed, idSeed);
		return "seeds/CT_Seeds";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "{idSeed}", method = RequestMethod.POST, params = "btnBuyNow")
	public String hat1(ModelMap model, @ModelAttribute("orderDetail") OrderDetail orderDetail,
			@PathVariable("idSeed") String idSeed, HttpSession httpSession, BindingResult errors) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TypeSeed";
		Query query = session.createQuery(hql);
		List<TypeSeed> list = query.list();
		model.addAttribute("TypeSeeds", list);

		hql = "FROM Seed WHERE idSeed = '" + idSeed + "'";
		query = session.createQuery(hql);
		Seed seed = (Seed) query.list().get(0);
		model.addAttribute("Seed", seed);

		hql = "FROM TypeSeed WHERE idTypeSeed=" + seed.getTypeSeed().getIdTypeSeed();                                                                                                                                                                                                 
		query = session.createQuery(hql);
		TypeSeed list2 = (TypeSeed) query.list().get(0);
		model.addAttribute("TypeSeedName", list2.getTypeSeedName());
		boolean checknumber = false;
		if (orderDetail.getNumber() == null) {
			errors.rejectValue("number", "orderDetail", "Vui lòng nhập số lượng");
			checknumber = true;
		} else {
			if (orderDetail.getNumber() < 1) {
				errors.rejectValue("number", "orderDetail", "Số lượng phải lớn hơn 0");
				checknumber = true;
			}
		}
		if (checknumber == true) {
			return "seeds/CT_Seeds";
		}
		User user = (User) httpSession.getAttribute("myLogin");
		if (user == null) {
			model.addAttribute("message", "loginFalse");
		} else {

			if (httpSession.getAttribute("myOrder") == null) {
				List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
				orderDetail.setSeed(seed);
				if (orderDetail.getNumber() > orderDetail.getSeed().getNumber()) {
					model.addAttribute("message", "max");
					return "seeds/CT_Seeds";
				}
				orderDetail.setPrice(seed.getPrice());

				orderDetails.add(orderDetail);
				httpSession.setAttribute("myOrder", orderDetails);
				model.addAttribute("message", true);
			} else {
				List<OrderDetail> orderDetails = (ArrayList<OrderDetail>) httpSession.getAttribute("myOrder");
				orderDetail.setSeed(seed);
				orderDetail.setPrice(seed.getPrice());
				boolean check = true;
				float tong = 0;
				for (int i = 0; i < orderDetails.size(); i++) {
					if (orderDetails.get(i).getSeed().getIdSeed().equals(orderDetail.getSeed().getIdSeed())) {
						OrderDetail orderDetailtemp = new OrderDetail();
						orderDetailtemp.setSeed(orderDetail.getSeed());
						orderDetailtemp.setPrice(orderDetail.getPrice());
						orderDetailtemp.setNumber(orderDetail.getNumber() + orderDetails.get(i).getNumber());
						if (orderDetailtemp.getNumber() > orderDetail.getSeed().getNumber()) {
							model.addAttribute("message", "max");
							return "seeds/CT_Seeds";
						}
						orderDetails.set(i, orderDetailtemp);
						check = false;
					}

				}
				if (check) {
					if (orderDetail.getNumber() > orderDetail.getSeed().getNumber()) {
						model.addAttribute("message", "max");
						return "seeds/CT_Seeds";
					}
					orderDetails.add(orderDetail);
				}

				httpSession.setAttribute("myOrder", orderDetails);
				model.addAttribute("message", true);
			}

		}

		return "redirect:http://localhost:8080/MyShop/cart/cart.htm";
	}

	@RequestMapping(value = "{idSeed}", method = RequestMethod.POST, params = "btnCart")
	public String hat(ModelMap model, @ModelAttribute("orderDetail") OrderDetail orderDetail,
			@PathVariable("idSeed") String idSeed, HttpSession httpSession, BindingResult errors) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TypeSeed";
		Query query = session.createQuery(hql);
		List<TypeSeed> list = query.list();
		model.addAttribute("TypeSeeds", list);

		hql = "FROM Seed WHERE idSeed = '" + idSeed + "'";
		query = session.createQuery(hql);
		Seed seed = (Seed) query.list().get(0);
		model.addAttribute("Seed", seed);

		hql = "FROM TypeSeed WHERE idTypeSeed=" + seed.getTypeSeed().getIdTypeSeed();
		query = session.createQuery(hql);
		TypeSeed list2 = (TypeSeed) query.list().get(0);
		model.addAttribute("TypeSeedName", list2.getTypeSeedName());
		boolean checknumber = false;
		if (orderDetail.getNumber() == null) {
			errors.rejectValue("number", "orderDetail", "Vui lòng nhập số lượng");
			checknumber = true;
		} else {
			if (orderDetail.getNumber() < 1) {
				errors.rejectValue("number", "orderDetail", "Số lượng phải lớn hơn 0");
				checknumber = true;
			}
		}
		if (checknumber == true) {
			return "seeds/CT_Seeds";
		}
		User user = (User) httpSession.getAttribute("myLogin");
		if (user == null) {
			model.addAttribute("message", "loginFalse");
		} else {

			if (httpSession.getAttribute("myOrder") == null) {
				List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
				orderDetail.setSeed(seed);
				if (orderDetail.getNumber() > orderDetail.getSeed().getNumber()) {
					model.addAttribute("message", "max");
					return "seeds/CT_Seeds";
				}
				orderDetail.setPrice(seed.getPrice());

				orderDetails.add(orderDetail);
				httpSession.setAttribute("myOrder", orderDetails);
				model.addAttribute("message", true);
			} else {
				List<OrderDetail> orderDetails = (ArrayList<OrderDetail>) httpSession.getAttribute("myOrder");
				orderDetail.setSeed(seed);
				orderDetail.setPrice(seed.getPrice());
				boolean check = true;
				float tong = 0;
				for (int i = 0; i < orderDetails.size(); i++) {
					if (orderDetails.get(i).getSeed().getIdSeed().equals(orderDetail.getSeed().getIdSeed())) {
						OrderDetail orderDetailtemp = new OrderDetail();
						orderDetailtemp.setSeed(orderDetail.getSeed());
						orderDetailtemp.setPrice(orderDetail.getPrice());
						orderDetailtemp.setNumber(orderDetail.getNumber() + orderDetails.get(i).getNumber());
						if (orderDetailtemp.getNumber() > orderDetail.getSeed().getNumber()) {
							model.addAttribute("message", "max");
							return "seeds/CT_Seeds";
						}
						orderDetails.set(i, orderDetailtemp);
						check = false;
					}

				}
				if (check) {
					if (orderDetail.getNumber() > orderDetail.getSeed().getNumber()) {
						model.addAttribute("message", "max");
						return "seeds/CT_Seeds";
					}
					orderDetails.add(orderDetail);
				}
				for(OrderDetail l: orderDetails){
					System.out.print(l.getSeed().getSeedName());
					System.out.print(l.getGiaVN());
				}

				httpSession.setAttribute("myOrder", orderDetails);
				model.addAttribute("message", true);
			}

		}

		return "seeds/CT_Seeds";
	}
}
