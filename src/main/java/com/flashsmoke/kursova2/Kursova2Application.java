package com.flashsmoke.kursova2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.flashsmoke.kursova2.repository")
public class Kursova2Application {

    public static void main(String[] args) {
        SpringApplication.run(Kursova2Application.class, args);
    }

}
