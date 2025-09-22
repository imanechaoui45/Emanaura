package com.projetJee.emanaura.repository;

import com.projetJee.emanaura.model.Comment;
import com.projetJee.emanaura.model.Product;
import com.projetJee.emanaura.model.UserDtls;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

    List<Comment> findByProductOrderByCreatedAtDesc(Product product);

    List<Comment> findByUser(UserDtls user);

    List<Comment> findByProductAndUser(Product product, UserDtls user);
}