package com.projetJee.emanaura.service;

import com.projetJee.emanaura.model.Comment;
import com.projetJee.emanaura.model.Product;
import com.projetJee.emanaura.model.UserDtls;

import java.util.List;

public interface CommentService {

    Comment saveComment(Comment comment);

    Comment updateComment(Comment comment);

    boolean deleteComment(Integer commentId);

    Comment getCommentById(Integer commentId);

    List<Comment> getCommentsByProduct(Product product);

    List<Comment> getCommentsByUser(UserDtls user);

    boolean isCommentOwner(Integer commentId, Integer userId);
}