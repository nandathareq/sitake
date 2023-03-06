package com.sitake.authenticator.model.loginDto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LoginResponse {
    private String jwtToken;
}
