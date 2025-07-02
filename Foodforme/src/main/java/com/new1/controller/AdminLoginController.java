package com.new1.controller;

import com.new1.model.Admin;
import com.new1.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLoginController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/adminlogin")
    public String adminLoginForm(Model model) {
        return "adminlogin";
    }

    @PostMapping("/admin/login")
    public String doAdminLogin(@RequestParam("adminUsername") String username,
                               @RequestParam("adminPassword") String password,
                               HttpSession session,
                               Model model) {

        Admin admin = adminService.login(username, password);
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            return "redirect:/admin";
        } else {
            model.addAttribute("error", "Invalid admin credentials");
            return "adminlogin";
        }
    }

    @GetMapping("/adminlogout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("loggedInAdmin");
        session.invalidate();
        return "redirect:/adminlogin";
    }
}