package com.projetJee.emanaura.service;

import com.projetJee.emanaura.model.OrderRequest;
import com.projetJee.emanaura.model.ProductOrder;
import org.springframework.data.domain.Page;

import java.util.List;

public interface OrderService {

	public void saveOrder(Integer userid, OrderRequest orderRequest) throws Exception;

	public List<ProductOrder> getOrdersByUser(Integer userId);

	public ProductOrder updateOrderStatus(Integer id, String status);

	public List<ProductOrder> getAllOrders();

	public ProductOrder getOrdersByOrderId(String orderId);
	
	public Page<ProductOrder> getAllOrdersPagination(Integer pageNo,Integer pageSize);
}
