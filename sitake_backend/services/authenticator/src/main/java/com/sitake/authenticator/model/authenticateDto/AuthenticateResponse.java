package com.sitake.authenticator.model.authenticateDto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AuthenticateResponse {
    private boolean isTokenValid;
    private String jwtToken;
}
