package com.poly.semicolons_book_store.dao;

import org.springframework.data.jpa.repository.JpaRepository;


import com.poly.semicolons_book_store.entity.DonHangChiTiet;

public interface DonHangChiTietDAO extends JpaRepository<DonHangChiTiet, Long> {

}
