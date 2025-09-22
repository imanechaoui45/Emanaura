package com.projetJee.emanaura.service.impl;

import com.projetJee.emanaura.model.Cart;
import com.projetJee.emanaura.model.Product;
import com.projetJee.emanaura.model.UserDtls;
import com.projetJee.emanaura.repository.CartRepository;
import com.projetJee.emanaura.repository.ProductRepository;
import com.projetJee.emanaura.repository.UserRepository;
import com.projetJee.emanaura.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Cart saveCart(Integer productId, Integer userId) {

		UserDtls userDtls = userRepository.findById(userId).get();
		Product product = productRepository.findById(productId).get();

		Cart cartStatus = cartRepository.findByProductIdAndUserId(productId, userId);

		// Utilise un prix de repli si getDiscountPrice() est null
		Double price = (product.getDiscountPrice() != null) ? product.getDiscountPrice() : product.getPrice();

		Cart cart;

		if (ObjectUtils.isEmpty(cartStatus)) {
			cart = new Cart();
			cart.setProduct(product);
			cart.setUser(userDtls);
			cart.setQuantity(1);
			cart.setTotalPrice(1 * price);
		} else {
			cart = cartStatus;
			cart.setQuantity(cart.getQuantity() + 1);
			cart.setTotalPrice(cart.getQuantity() * price);
		}

		return cartRepository.save(cart);
	}

	@Override
	public List<Cart> getCartsByUser(Integer userId) {
		List<Cart> carts = cartRepository.findByUserId(userId);

		Double totalOrderPrice = 0.0;
		List<Cart> updateCarts = new ArrayList<>();

		for (Cart c : carts) {
			// Utilise discountPrice s’il existe, sinon price
			Double discount = (c.getProduct().getDiscountPrice() != null)
					? c.getProduct().getDiscountPrice()
					: c.getProduct().getPrice();

			Double totalPrice = discount * c.getQuantity();

			c.setTotalPrice(totalPrice);
			totalOrderPrice += totalPrice;
			c.setTotalOrderPrice(totalOrderPrice);

			updateCarts.add(c);
		}

		return updateCarts;
	}


	@Override
	public Integer getCountCart(Integer userId) {
		Integer countByUserId = cartRepository.countByUserId(userId);
		return countByUserId;
	}

	@Override
	public void updateQuantity(String sy, Integer cid) {

		Cart cart = cartRepository.findById(cid).get();
		int updateQuantity;

		if (sy.equalsIgnoreCase("de")) {
			updateQuantity = cart.getQuantity() - 1;

			if (updateQuantity <= 0) {
				cartRepository.delete(cart);
			} else {
				cart.setQuantity(updateQuantity);
				cartRepository.save(cart);
			}

		} else {
			updateQuantity = cart.getQuantity() + 1;
			cart.setQuantity(updateQuantity);
			cartRepository.save(cart);
		}

	}

}
