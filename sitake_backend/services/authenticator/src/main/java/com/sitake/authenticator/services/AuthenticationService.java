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

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class AuthenticationService {

    // ini nanti ditaro key vault
    String secretKey = "asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";

    Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secretKey),
            SignatureAlgorithm.HS256.getJcaName());

    public AuthenticateResponse authenticateToken(AuthenticateRequest authenticateRequest)
            throws UnsupportedEncodingException {

        Jws<Claims> claims = validateJwt(authenticateRequest.getJwtToken(), hmacKey);

        String jwtToken = generateJwtToken(claims.getBody().getSubject(), hmacKey);

        AuthenticateResponse authenticateResponse = AuthenticateResponse.builder().isTokenValid(true)
                .jwtToken(jwtToken).build();

        return authenticateResponse;
    }

    public LoginResponse authenticateUser(LoginRequest loginRequest) throws UnsupportedEncodingException {

        String jwtToken = generateJwtToken("nanda", hmacKey);

        LoginResponse loginResponse = LoginResponse.builder().jwtToken(jwtToken).build();

        return loginResponse;
    }

    private Jws<Claims> validateJwt(String jwtToken, Key key) {

        Jws<Claims> jwt = Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(jwtToken);

        return jwt;
    }

    private String generateJwtToken(String name, Key key) throws UnsupportedEncodingException {

        Instant now = Instant.now();
        String jwtToken = Jwts.builder()
                .setIssuer("sitake")
                .claim("nama", name)
                .setSubject(name)
                .setId(UUID.randomUUID().toString())
                .setIssuedAt(Date.from(now))
                .setExpiration(Date.from(now.plus(5l, ChronoUnit.MINUTES)))
                .signWith(key)
                .compact();
        return jwtToken;
    }

}
