package com.sitake.authenticator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sitake.authenticator.model.authenticateDto.AuthenticateRequest;
import com.sitake.authenticator.model.loginDto.LoginRequest;
import com.sitake.authenticator.model.registerDto.RegisterRequest;
import com.sitake.authenticator.service.AuthenticationService;
import com.sitake.authenticator.service.RegisterService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/v1/authenticator")
public class AuthenticatorController {

    @Autowired
    RegisterService registerService;

    @Autowired
    AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<Object> register(@Valid @RequestBody RegisterRequest registerRequest) {

        try {
            return new ResponseEntity<>(registerService.registerUser(registerRequest), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
        }

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
