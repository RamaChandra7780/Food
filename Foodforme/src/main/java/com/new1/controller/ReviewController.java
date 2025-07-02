package com.new1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.new1.model.Review;
import com.new1.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/delivery-feedback")
    public String showDeliveryFeedback(@RequestParam("orderId") int orderId,
                                       HttpSession session,
                                       Model model) {
        String username = (String) session.getAttribute("username");
        model.addAttribute("orderId", orderId);
        model.addAttribute("username", username);
        return "review"; 
    }

    @PostMapping("/submitReview")
    public String submitReview(@ModelAttribute Review review) {
        reviewService.saveReview(review);
        return "thank-you"; 
    }

    
}
