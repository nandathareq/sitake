package com.sitake.authenticator.models.loginDto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LoginResponse {
    private String jwtToken;
}
