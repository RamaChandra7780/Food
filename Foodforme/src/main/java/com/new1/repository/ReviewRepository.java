package com.new1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.new1.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
}
