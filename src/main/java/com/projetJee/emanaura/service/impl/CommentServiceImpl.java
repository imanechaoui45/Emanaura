package com.projetJee.emanaura.service.impl;

import com.projetJee.emanaura.model.Comment;
import com.projetJee.emanaura.model.Product;
import com.projetJee.emanaura.model.UserDtls;
import com.projetJee.emanaura.repository.CommentRepository;
import com.projetJee.emanaura.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public Comment saveComment(Comment comment) {
        comment.setCreatedAt(LocalDateTime.now());
        comment.setUpdatedAt(LocalDateTime.now());
        return commentRepository.save(comment);
    }

    @Override
    public Comment updateComment(Comment comment) {
        Comment existingComment = getCommentById(comment.getId());

        if (existingComment != null) {
            existingComment.setContent(comment.getContent());
            existingComment.setUpdatedAt(LocalDateTime.now());
            return commentRepository.save(existingComment);
        }

        return null;
    }

    @Override
    public boolean deleteComment(Integer commentId) {
        try {
            commentRepository.deleteById(commentId);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Comment getCommentById(Integer commentId) {
        Optional<Comment> comment = commentRepository.findById(commentId);
        return comment.orElse(null);
    }

    @Override
    public List<Comment> getCommentsByProduct(Product product) {
        return commentRepository.findByProductOrderByCreatedAtDesc(product);
    }

    @Override
    public List<Comment> getCommentsByUser(UserDtls user) {
        return commentRepository.findByUser(user);
    }

    @Override
    public boolean isCommentOwner(Integer commentId, Integer userId) {
        Comment comment = getCommentById(commentId);

        if (comment != null && comment.getUser() != null) {
            return comment.getUser().getId().equals(userId);
        }

        return false;
    }
}