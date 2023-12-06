package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.LoaiSachDAO;
import com.poly.semicolons_book_store.dao.SachDAO;
import com.poly.semicolons_book_store.entity.LoaiSach;
import com.poly.semicolons_book_store.entity.Sach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Controller
@RequestMapping("/sachForm")
public class SachAdminController {
	@Autowired
	SachDAO daoS;
	
	@Autowired
	LoaiSachDAO loaisachdao;

	@RequestMapping("")
	public String formsach(Model model, @RequestParam("p") Optional<Integer> p) {
		Sach item = new Sach();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Sach> page = daoS.findAll(pageable);
		
		model.addAttribute("page", page);
		
		// loai
		List<LoaiSach> danhSachLoaiSach = loaisachdao.findAll();
		List<String> tenLoaiList = new ArrayList<>();

		danhSachLoaiSach.forEach(loaiSach -> {
		    tenLoaiList.add(loaiSach.getTenLoai());
		});
		model.addAttribute("danhSachLoaiSach", tenLoaiList);
		return "admin/formsach";
	}

	@RequestMapping("/createSach")
	public String createSach(@ModelAttribute("item")Sach item ,@RequestParam("file") MultipartFile file) {
	
		// hinh không thể đặt vào form:input path="hinh" nên chuyển sang input thông thường
				 // - > @RequestParam("file") MultipartFile file để lấy ảnh về
				  if (!file.isEmpty()) {
				        String fileName = file.getOriginalFilename();
				        // getOriginalFilename để lấy tên ảnh ra gắn vào String hinh 
				        // Lưu tên file vào đối tượng Sach
				        item.setHinh(fileName);
				   }
				        // tạo đối tượng loại sách 
				        // lấy thông tin tên loại sách đã thay đổi trên form 
				        LoaiSach loaiSach = loaisachdao.findByTenLoai(item.getLoaiSach().getTenLoai());
				      
				        if (loaiSach == null) {
				        	
				        	// nếu k tồn tại - > tạo mới
							LoaiSach newLoaiSach  = new  LoaiSach();
							 newLoaiSach.setTenLoai(item.getLoaiSach().getTenLoai());
							 // lưu loai sách vao sql
						    	loaisachdao.save(newLoaiSach);
							 System.out.println(newLoaiSach);
							
							item.setLoaiSach(newLoaiSach);
						}else {
							// nếu đã tồn tại - > setloaisach -> lưu vào sql
							item.setLoaiSach(loaiSach);
					   	    System.out.println(item.toString());
							daoS.save(item);
						}
				    
		return "redirect:/sachForm";
	}

	@GetMapping("/editSach/{maSach}")
	public String editSach(Model model, @PathVariable("maSach")Long maSach,@RequestParam("p") Optional<Integer> p) {
		
		// lấy danh sách của các loại sách ra -> để lấy tên loại
		List<LoaiSach> danhSachLoaiSach = loaisachdao.findAll();
		List<String> tenLoaiList = new ArrayList<>();

		danhSachLoaiSach.forEach(loaiSach -> {
		    tenLoaiList.add(loaiSach.getTenLoai());
		});
//		System.out.println(tenLoaiList);
		
		// thêm zo select loại sach
		model.addAttribute("danhSachLoaiSach", tenLoaiList);
		Sach item = daoS.findById(maSach).get();

		String hinh = item.getHinh();
		model.addAttribute("hinh", hinh);
		model.addAttribute("item", item);
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Sach> page = daoS.findAll(pageable);
		
		model.addAttribute("page", page);

		return "admin/formsach";
	}

	@PostMapping("/updateSach")
	public String updateSach(@ModelAttribute("item")Sach item ,@RequestParam("file") MultipartFile file){
	   
		// hinh không thể đặt vào form:input path="hinh" nên chuyển sang input thông thường
		 // - > @RequestParam("file") MultipartFile file để lấy ảnh về
		  if (!file.isEmpty()) {
		        String fileName = file.getOriginalFilename();
		        // getOriginalFilename để lấy tên ảnh ra gắn vào String hinh 
		        // Lưu tên file vào đối tượng Sach
		        item.setHinh(fileName);
		   }
		        // tạo đối tượng loại sách 
		        // lấy thông tin tên loại sách đã thay đổi trên form 
		        LoaiSach loaiSach = loaisachdao.findByTenLoai(item.getLoaiSach().getTenLoai());
		        
		        
		        if (loaiSach == null) {
		        	
		        	// nếu k tồn tại - > tạo mới
					LoaiSach newLoaiSach  = new  LoaiSach();
					 newLoaiSach.setTenLoai(item.getLoaiSach().getTenLoai());
					 // lưu loai sách vao sql
					loaisachdao.save(newLoaiSach);
					
					item.setLoaiSach(newLoaiSach);
				}else {
					// nếu đã tồn tại - > setloaisach -> lưu vào sql
					item.setLoaiSach(loaiSach);
					
					daoS.save(item);
				}
		        
		 
		      
	    return "redirect:/sachForm/editSach/" + item.getMaSach();
	}


	@RequestMapping("/deleteSach/{masach}")
	public String deleteSach(@PathVariable("masach") Long masach) {
		daoS.deleteById(masach);
		return "redirect:/sachForm";
	}
}
