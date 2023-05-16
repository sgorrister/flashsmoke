package com.flashsmoke.kursova2.service;

import com.flashsmoke.kursova2.domain.OrderDetails;
import com.flashsmoke.kursova2.repository.OrderDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailsService {

    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    public List<OrderDetails> getAllOrderDetails() {
        return orderDetailsRepository.findAll();
    }

    public OrderDetails getOrderDetailsById(Long id) {
        return orderDetailsRepository.findById(id).orElse(null);
    }

    public OrderDetails createOrderDetails(OrderDetails orderDetails) {
        return orderDetailsRepository.save(orderDetails);
    }

    public OrderDetails updateOrderDetails(Long id, OrderDetails orderDetails) {
        OrderDetails existingOrderDetails = getOrderDetailsById(id);
        if (existingOrderDetails != null) {
            orderDetails.setId(existingOrderDetails.getId());
            return orderDetailsRepository.save(orderDetails);
        } else {
            return null;
        }
    }

    public boolean deleteOrderDetails(Long id) {
        if (orderDetailsRepository.existsById(id)) {
            orderDetailsRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
