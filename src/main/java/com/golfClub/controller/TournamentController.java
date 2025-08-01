package com.golfClub.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TournamentController {
    @GetMapping("/")
    public String hello() {
        return "API is running!";
    }
}
