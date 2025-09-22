package com.projetJee.emanaura.controller;

import com.projetJee.emanaura.model.Comment;
import com.projetJee.emanaura.model.Product;
import com.projetJee.emanaura.model.UserDtls;
import com.projetJee.emanaura.service.CommentService;
import com.projetJee.emanaura.service.ProductService;
import com.projetJee.emanaura.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @PostMapping("/user/addComment")
    public String addComment(@RequestParam("productId") Integer productId,
                             @RequestParam("content") String content,
                             Principal principal,
                             HttpSession session) {

        try {
            // Vérifier si l'utilisateur est connecté
            if (principal == null) {
                session.setAttribute("errorMsg", "Veuillez vous connecter pour ajouter un commentaire");
                return "redirect:/product/" + productId;
            }

            // Récupérer l'utilisateur et le produit
            String email = principal.getName();
            UserDtls user = userService.getUserByEmail(email);
            Product product = productService.getProductById(productId);

            // Créer et sauvegarder le commentaire
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setProduct(product);
            comment.setUser(user);

            commentService.saveComment(comment);
            session.setAttribute("succMsg", "Commentaire ajouté avec succès");

        } catch (Exception e) {
            session.setAttribute("errorMsg", "Erreur lors de l'ajout du commentaire");
        }

        return "redirect:/product/" + productId;
    }

    @PostMapping("/user/updateComment")
    public String updateComment(@RequestParam("commentId") Integer commentId,
                                @RequestParam("productId") Integer productId,
                                @RequestParam("content") String content,
                                Principal principal,
                                HttpSession session) {

        try {
            // Vérifier si l'utilisateur est connecté
            if (principal == null) {
                session.setAttribute("errorMsg", "Veuillez vous connecter pour modifier un commentaire");
                return "redirect:/product/" + productId;
            }

            // Récupérer l'utilisateur
            String email = principal.getName();
            UserDtls user = userService.getUserByEmail(email);

            // Vérifier si l'utilisateur est le propriétaire du commentaire
            if (!commentService.isCommentOwner(commentId, user.getId())) {
                session.setAttribute("errorMsg", "Vous n'êtes pas autorisé à modifier ce commentaire");
                return "redirect:/product/" + productId;
            }

            // Récupérer et mettre à jour le commentaire
            Comment comment = commentService.getCommentById(commentId);
            comment.setContent(content);

            commentService.updateComment(comment);
            session.setAttribute("succMsg", "Commentaire modifié avec succès");

        } catch (Exception e) {
            session.setAttribute("errorMsg", "Erreur lors de la modification du commentaire");
        }

        return "redirect:/product/" + productId;
    }

    @GetMapping("/user/deleteComment/{commentId}/{productId}")
    public String deleteComment(@PathVariable("commentId") Integer commentId,
                                @PathVariable("productId") Integer productId,
                                Principal principal,
                                HttpSession session) {

        try {
            // Vérifier si l'utilisateur est connecté
            if (principal == null) {
                session.setAttribute("errorMsg", "Veuillez vous connecter pour supprimer un commentaire");
                return "redirect:/product/" + productId;
            }

            // Récupérer l'utilisateur
            String email = principal.getName();
            UserDtls user = userService.getUserByEmail(email);

            // Vérifier si l'utilisateur est le propriétaire du commentaire ou un admin
            if (!commentService.isCommentOwner(commentId, user.getId()) && !"ROLE_ADMIN".equals(user.getRole())) {
                session.setAttribute("errorMsg", "Vous n'êtes pas autorisé à supprimer ce commentaire");
                return "redirect:/product/" + productId;
            }

            // Supprimer le commentaire
            boolean deleted = commentService.deleteComment(commentId);

            if (deleted) {
                session.setAttribute("succMsg", "Commentaire supprimé avec succès");
            } else {
                session.setAttribute("errorMsg", "Erreur lors de la suppression du commentaire");
            }

        } catch (Exception e) {
            session.setAttribute("errorMsg", "Erreur lors de la suppression du commentaire");
        }

        return "redirect:/product/" + productId;
    }

    @GetMapping("/admin/deleteComment/{commentId}/{productId}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String adminDeleteComment(@PathVariable("commentId") Integer commentId,
                                     @PathVariable("productId") Integer productId,
                                     HttpSession session) {

        try {
            // Supprimer le commentaire
            boolean deleted = commentService.deleteComment(commentId);

            if (deleted) {
                session.setAttribute("succMsg", "Commentaire supprimé avec succès");
            } else {
                session.setAttribute("errorMsg", "Erreur lors de la suppression du commentaire");
            }

        } catch (Exception e) {
            session.setAttribute("errorMsg", "Erreur lors de la suppression du commentaire");
        }

        return "redirect:/product/" + productId;
    }
}