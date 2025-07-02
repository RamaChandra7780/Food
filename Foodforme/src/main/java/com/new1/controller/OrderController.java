package com.new1.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.new1.model.CartItem;
import com.new1.model.CustomerOrder;
import com.new1.model.MenuItem;
import com.new1.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("cart")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@GetMapping("/order")
	public String showOrderForm(Model model, HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/login";
		}
		model.addAttribute("order", new CustomerOrder());
		return "order";
	}

	@PostMapping("/order")
	public String submitOrder(@ModelAttribute CustomerOrder order, @SessionAttribute("cart") List<CartItem> cart,
			HttpSession session, Model model) {

		String username = (String) session.getAttribute("username");
		order.setUsername(username);

		StringBuilder summary = new StringBuilder();
		double total = 0;

		for (CartItem cartItem : cart) {
			MenuItem item = cartItem.getItem();
			int qty = cartItem.getQuantity();

			summary.append(item.getName()).append(" x ").append(qty).append(" = ₹").append(item.getPrice() * qty)
					.append("<br/>");

			total += item.getPrice() * qty;
		}

		order.setItemsSummary(summary.toString());
		CustomerOrder savedOrder = orderService.saveOrder(order);
		int orderId = savedOrder.getId();

		model.addAttribute("message", "Order placed successfully!");

		model.addAttribute("items", new ArrayList<>(cart));

		model.addAttribute("total", total);
		model.addAttribute("orderId", orderId);
		model.addAttribute("username", username);

		cart.clear();

		return "order-success";
	}

	@GetMapping("/orders")
	public String viewAllOrders(Model model) {
		List<CustomerOrder> allOrders = orderService.getAllOrders();
		model.addAttribute("orders", allOrders);
		return "orders";
	}
}
