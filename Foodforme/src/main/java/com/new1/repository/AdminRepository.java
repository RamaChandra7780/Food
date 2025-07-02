package com.new1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.new1.model.Admin;

public interface AdminRepository extends JpaRepository<Admin,Long>{
  Admin findByUsername(String username);
}
