package com.new1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.new1.model.Admin;
import com.new1.repository.AdminRepository;
@Service
public class AdminService {
  @Autowired
  private AdminRepository adminRepo;
  public Admin login(String username,String password) {
	  Admin admin=adminRepo.findByUsername(username);
	  if(admin !=null &&admin.getPassword().equals(password)) {
		  return admin;
	  }
	  return null;
  }
	
}
