package com.new1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.new1.model.MenuItem;
@Repository
public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
	
	List<MenuItem> findByNameContainingIgnoreCase(String name);
}
