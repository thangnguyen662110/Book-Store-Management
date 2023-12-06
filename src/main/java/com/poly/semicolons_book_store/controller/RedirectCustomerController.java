package com.poly.semicolons_book_store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.semicolons_book_store.dao.NguoiDungDAO;
import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.entity.NguoiDung;
import com.poly.semicolons_book_store.service.CartCookieService;
import com.poly.semicolons_book_store.service.SessionService;

import javax.servlet.http.HttpSession;

@Controller
public class RedirectCustomerController {
	@Autowired
	private CartCookieService cartCookieService;

	@Autowired
	SessionService session;

	@Autowired
	NguoiDungDAO nDao;

	@RequestMapping("/loginForm")
	public String loadFormLogin(@ModelAttribute("acc") NguoiDung nguoiDung) {
		return "login";
	}

	@RequestMapping("/signupForm")
	public String loadFormSignup(@ModelAttribute("acc") NguoiDung nguoiDung) {
		return "signup";
	}

	@RequestMapping("/indexCustomer")
	public String loadFormIndex(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		return "customer/index";
	}


	@PostMapping("/editProfile")
	public String editProfile(Model model, @ModelAttribute("nguoiDung") NguoiDung nguoiDung) {
		NguoiDung currentNguoiDung = (NguoiDung) session.get("nguoiDung");

		if (currentNguoiDung != null) {
			currentNguoiDung.setTenDangNhap(nguoiDung.getTenDangNhap());
			currentNguoiDung.setMatKhau(nguoiDung.getMatKhau());
			currentNguoiDung.setDiaChi(nguoiDung.getDiaChi());
			currentNguoiDung.setSoDienThoai(nguoiDung.getSoDienThoai());
			currentNguoiDung.setEmail(nguoiDung.getEmail());

			NguoiDung updatedNguoiDung = nDao.save(currentNguoiDung);
			session.set("nguoiDung", updatedNguoiDung);
			System.out.println("Đã cập nhật thông tin người dùng");
		} else {
			System.out.println("Không tìm thấy người dùng trong session");
		}

		return "redirect:/myprofileCustomer";
	}

	@RequestMapping("/myprofileCustomer")
	public String loadFormMyProfile(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
		NguoiDung nguoiDung = session.get("nguoiDung");
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		return "customer/myprofile";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.remove("nguoiDung");
		return "redirect:/loginForm";
	}

	@RequestMapping("/aboutCustomer")
	public String loadFormAbout(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		return "customer/about";
	}

	@RequestMapping("/contactCustomer")
	public String loadFormContact(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		return "customer/contact";
	}
}
