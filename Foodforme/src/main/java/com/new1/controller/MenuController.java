package com.new1.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.new1.model.CartItem;
import com.new1.model.MenuItem;
import com.new1.service.MenuService;
import com.new1.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("cart")
public class MenuController {

	@ModelAttribute("cart")
	public List<CartItem> initCart() {
		return new ArrayList<>();
	}

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private MenuService menuService;

	@GetMapping({ "/", "/home" })
	public String viewHome(HttpSession session, Model model,
			@RequestParam(name = "search", required = false) String searchTerm) {
		String username = (String) session.getAttribute("username");

		if (username == null) {
			return "redirect:/login";
		}

		model.addAttribute("username", username);

		List<MenuItem> items;
		if (searchTerm != null && !searchTerm.trim().isEmpty()) {

			items = menuService.searchMenuItemsByName(searchTerm.trim());
		} else {

			items = menuService.getAllItems();
		}

		model.addAttribute("menuItems", items);
		return "home"; // Return to home.jsp
	}

	@GetMapping("/cart/add/{id}")
	public String addToCart(@PathVariable Long id, @RequestParam(defaultValue = "1") int qty,
			@ModelAttribute("cart") List<CartItem> cart) {
		MenuItem item = menuService.getItemById(id);

		if (item != null) {
			boolean found = false;
			for (CartItem cartItem : cart) {
				if (cartItem.getItem().getId().equals(id)) {
					cartItem.setQuantity(cartItem.getQuantity() + qty);
					found = true;
					break;
				}
			}
			if (!found) {
				CartItem newCartItem = new CartItem();
				newCartItem.setItem(item);
				newCartItem.setQuantity(qty);
				cart.add(newCartItem);
			}
		}

		return "redirect:/cart";
	}

	@GetMapping("/cart")
	public String viewCart(@ModelAttribute("cart") List<CartItem> cart, Model model) {
		model.addAttribute("cartItems", cart);
		return "cart";
	}

	@GetMapping("/cart/clear")
	public String clearCart(@ModelAttribute("cart") List<MenuItem> cart) {
		cart.clear();
		return "redirect:/cart";
	}

	@GetMapping("/help")
	public String viewHelp(HttpSession session, Model model) {

		String username = (String) session.getAttribute("username");
		if (username != null) {
			model.addAttribute("username", username);
		}
		return "help";
	}

}
