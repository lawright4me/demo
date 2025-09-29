package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Value("${client}")
    private String client;

    public String sayHello(){
        return "Hello!: " + client;
    }
}