package com.flashsmoke.kursova2.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Table(name = "orders")
@Entity
@Getter @Setter
public class Order {
    @Id
    private long id;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @Column
    private LocalDate orderDate;
    @Column
    private String status;
    @Column
    private String shippingAddress;
    @Column
    private String shippingCity;
    @Column
    private String shippingState;
    @Column
    private String shippingCountry;
    @Column
    private String shippingZipcode;

}
