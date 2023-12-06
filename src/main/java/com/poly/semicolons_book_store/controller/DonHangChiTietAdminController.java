package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.DonHangChiTietDAO;
import com.poly.semicolons_book_store.entity.DonHang;
import com.poly.semicolons_book_store.entity.DonHangChiTiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/donhangchitiet")
public class DonHangChiTietAdminController {
	
	@Autowired 
	DonHangChiTietDAO chiTietDAO;
	
	@RequestMapping("")
	public String formdonhang(Model model, @RequestParam("p") Optional<Integer> p) {
		DonHang item = new DonHang();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 3);
		Page<DonHangChiTiet> page = chiTietDAO.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formdonhangchitiet";
	}

}
