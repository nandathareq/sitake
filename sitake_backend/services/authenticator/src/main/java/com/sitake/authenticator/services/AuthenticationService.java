package com.sitake.authenticator.services;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Service;

import com.sitake.authenticator.models.authenticateDto.AuthenticateRequest;
import com.sitake.authenticator.models.authenticateDto.AuthenticateResponse;
import com.sitake.authenticator.models.loginDto.LoginRequest;
import com.sitake.authenticator.models.loginDto.LoginResponse;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class AuthenticationService {

    // ini nanti ditaro key vault
    String secretKey = "asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";

    public AuthenticateResponse authenticateToken(AuthenticateRequest authenticateRequest) {

        AuthenticateResponse authenticateResponse = AuthenticateResponse.builder().isTokenValid(false)
                .jwtToken("sdfgsderger").build();

        return authenticateResponse;
    }

    public LoginResponse authenticateUser(LoginRequest loginRequest) throws UnsupportedEncodingException {

        String jwtToken = jwtGenerator("nanda keren", secretKey);

        LoginResponse loginResponse = LoginResponse.builder().jwtToken(jwtToken).build();

        return loginResponse;
    }

    private String jwtGenerator(String name, String secret) throws UnsupportedEncodingException {

        Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secret), 
                            SignatureAlgorithm.HS256.getJcaName());

        Instant now = Instant.now();
        String jwtToken = Jwts.builder()
        .setIssuer("sitake")
        .claim("name", name)
        .setSubject(name)
        .setId(UUID.randomUUID().toString())
        .setIssuedAt(Date.from(now))
        .setExpiration(Date.from(now.plus(5l, ChronoUnit.MINUTES)))
        .signWith(hmacKey)
        .compact();
        return jwtToken;
    }

}
