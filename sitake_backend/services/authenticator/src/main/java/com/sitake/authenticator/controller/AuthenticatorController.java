package com.sitake.authenticator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sitake.authenticator.models.authenticateDto.AuthenticateRequest;
import com.sitake.authenticator.models.loginDto.LoginRequest;
import com.sitake.authenticator.models.registerDto.RegisterRequest;
import com.sitake.authenticator.models.registerDto.RegisterResponse;
import com.sitake.authenticator.services.AuthenticationService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/v1/authenticator/")
public class AuthenticatorController {

    @Autowired
    AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<RegisterResponse> register(@Valid @RequestBody RegisterRequest registerRequest) {

        RegisterResponse registerResponse = RegisterResponse.builder().message("aksjdhgfkdjsf").build();

        return new ResponseEntity<>(registerResponse, HttpStatus.CREATED);
    }

    @PostMapping("/authenticate")
    public ResponseEntity<Object> authenticate(
            @Valid @RequestBody AuthenticateRequest authenticateRequest) {

        try {
            return new ResponseEntity<>(authenticationService.authenticateToken(authenticateRequest), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.UNAUTHORIZED);
        }
    }

    @PostMapping("/login")
    public ResponseEntity<Object> login(@Valid @RequestBody LoginRequest loginRequest) {
        try {
            return new ResponseEntity<>(authenticationService.authenticateUser(loginRequest), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.UNAUTHORIZED);
        }
    }
}
