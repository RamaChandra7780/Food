package com.new1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.new1.model.CustomerOrder;
import com.new1.repository.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepo;

    public CustomerOrder saveOrder(CustomerOrder order) {
        return orderRepo.save(order);
    }
    
    
    public List<CustomerOrder> getAllOrders() {
        return orderRepo.findAll();
    }
 

}
