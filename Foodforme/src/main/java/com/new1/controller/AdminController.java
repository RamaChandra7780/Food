package com.new1.controller;

import com.new1.model.MenuItem;
import com.new1.model.Review;
import com.new1.repository.MenuItemRepository;
import com.new1.repository.ReviewRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
// Removed imports related to file handling
// import org.springframework.web.multipart.MultipartFile;
// import org.springframework.util.ResourceUtils;
// import java.io.IOException;
// import java.nio.file.Files;
// import java.nio.file.Path;
// import java.nio.file.Paths;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final MenuItemRepository menuItemRepository;
	private final ReviewRepository reviewRepository;

	// Removed UPLOADED_FOLDER and getUploadDirectory() method entirely
	// private static final String UPLOADED_FOLDER = getUploadDirectory();
	// private static String getUploadDirectory() {
	// 	try {
	// 		Path uploadPath = Paths.get(ResourceUtils.getFile("classpath:static").getAbsolutePath(), "uploaded-images");
	// 		if (!Files.exists(uploadPath)) {
	// 			Files.createDirectories(uploadPath);
	// 		}
	// 		return uploadPath.toString();
	// 	} catch (IOException e) {
	// 		System.err.println("Error determining upload directory: " + e.getMessage());
	// 		return "uploaded-images/";
	// 	}
	// }

	@Autowired
	public AdminController(MenuItemRepository menuItemRepository, ReviewRepository reviewRepository) {
		this.menuItemRepository = menuItemRepository;
		this.reviewRepository = reviewRepository;
	}

	private String checkLogin(HttpSession session) {
		if (session.getAttribute("loggedInAdmin") == null) {
			return "redirect:/adminlogin";
		}
		return null;
	}

	@GetMapping
	public String adminPanel(@RequestParam(defaultValue = "0") int menuPage,
			@RequestParam(defaultValue = "10") int menuSize, @RequestParam(defaultValue = "0") int reviewPage,
			@RequestParam(defaultValue = "10") int reviewSize, Model model, HttpSession session) {
		String redirect = checkLogin(session);
		if (redirect != null) {
			return redirect;
		}
		model.addAttribute("item", new MenuItem());

		Pageable menuPageable = PageRequest.of(menuPage, menuSize);
		Page<MenuItem> menuItemPage = menuItemRepository.findAll(menuPageable);
		model.addAttribute("items", menuItemPage.getContent());
		model.addAttribute("menuCurrentPage", menuPage);
		model.addAttribute("menuTotalPages", menuItemPage.getTotalPages());
		model.addAttribute("menuHasNext", menuItemPage.hasNext());
		model.addAttribute("menuHasPrevious", menuItemPage.hasPrevious());

		Pageable reviewPageable = PageRequest.of(reviewPage, reviewSize);
		Page<Review> reviewPageResult = reviewRepository.findAll(reviewPageable);
		model.addAttribute("reviews", reviewPageResult.getContent());
		model.addAttribute("reviewCurrentPage", reviewPage);
		model.addAttribute("reviewTotalPages", reviewPageResult.getTotalPages());
		model.addAttribute("reviewHasNext", reviewPageResult.hasNext());
		model.addAttribute("reviewHasPrevious", reviewPageResult.hasPrevious());

		return "admin";
	}

	@GetMapping("/edit/{id}")
	public String editItem(@PathVariable Long id, @RequestParam(defaultValue = "0") int menuPage,
			@RequestParam(defaultValue = "10") int menuSize, @RequestParam(defaultValue = "0") int reviewPage,
			@RequestParam(defaultValue = "10") int reviewSize, Model model, HttpSession session) {

		String redirect = checkLogin(session);
		if (redirect != null) {
			return redirect;
		}

		Optional<MenuItem> item = menuItemRepository.findById(id);
		item.ifPresent(menuItem -> model.addAttribute("item", menuItem));

		Pageable menuPageable = PageRequest.of(menuPage, menuSize);
		Page<MenuItem> menuItemPage = menuItemRepository.findAll(menuPageable);
		model.addAttribute("items", menuItemPage.getContent());
		model.addAttribute("menuCurrentPage", menuPage);
		model.addAttribute("menuTotalPages", menuItemPage.getTotalPages());
		model.addAttribute("menuHasNext", menuItemPage.hasNext());
		model.addAttribute("menuHasPrevious", menuItemPage.hasPrevious());

		Pageable reviewPageable = PageRequest.of(reviewPage, reviewSize);
		Page<Review> reviewPageResult = reviewRepository.findAll(reviewPageable);
		model.addAttribute("reviews", reviewPageResult.getContent());
		model.addAttribute("reviewCurrentPage", reviewPage);
		model.addAttribute("reviewTotalPages", reviewPageResult.getTotalPages());
		model.addAttribute("reviewHasNext", reviewPageResult.hasNext());
		model.addAttribute("reviewHasPrevious", reviewPageResult.hasPrevious());

		return "admin";
	}

	@PostMapping("/add")
	public String addItem(@ModelAttribute MenuItem item,
			// Changed from MultipartFile to String for imageUrl
			@RequestParam("imageUrl") String imageUrl, // Name should match JSP input
			HttpSession session) {

		String redirect = checkLogin(session);
		if (redirect != null) {
			return redirect;
		}

		// Set the imageUrl directly from the request parameter
		item.setImageUrl(imageUrl);
		menuItemRepository.save(item);
		return "redirect:/admin";
	}

	@PostMapping("/update")
	public String updateItem(@ModelAttribute MenuItem item,
			// Changed from MultipartFile to String for imageUrl
			@RequestParam("imageUrl") String imageUrl, // Name should match JSP input
			HttpSession session) {

		String redirect = checkLogin(session);
		if (redirect != null) {
			return redirect;
		}

		if (item.getId() != null) {
			Optional<MenuItem> existingItemOptional = menuItemRepository.findById(item.getId());
			if (existingItemOptional.isPresent()) {
				MenuItem existingItem = existingItemOptional.get();
				// If a new imageUrl is provided (not null and not empty), use it
				if (imageUrl != null && !imageUrl.trim().isEmpty()) {
					item.setImageUrl(imageUrl);
				} else {
					// Otherwise, retain the old imageUrl from the existing item
					item.setImageUrl(existingItem.getImageUrl());
				}
				menuItemRepository.save(item);
			}
		}
		return "redirect:/admin";
	}

	@GetMapping("/delete/{id}")
	public String deleteItem(@PathVariable Long id, HttpSession session) {

		String redirect = checkLogin(session);
		if (redirect != null) {
			return redirect;
		}

		menuItemRepository.deleteById(id);
		return "redirect:/admin";
	}
}