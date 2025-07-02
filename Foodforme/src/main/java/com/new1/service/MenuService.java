package com.new1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.new1.model.MenuItem;
import com.new1.repository.MenuItemRepository;

@Service
public class MenuService {
    @Autowired
    private MenuItemRepository menuRepo;

    public List<MenuItem> getAllItems() {
        return menuRepo.findAll();
    }

    public void addItem(MenuItem item) {
        menuRepo.save(item);
    }

    public void updateItem(MenuItem item) {
        menuRepo.save(item);
    }

    public MenuItem getItemById(Long id) {
        return menuRepo.findById(id).orElse(null);
    }
    
    public void deleteItemById(Long id) {
        if (menuRepo.existsById(id)) {
            menuRepo.deleteById(id);
        }
    }
    
    
    public List<MenuItem> searchMenuItemsByName(String name) {
       
        return  menuRepo.findByNameContainingIgnoreCase(name);
    }

}

