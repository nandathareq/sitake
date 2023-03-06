package com.sitake.authenticator.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sitake.authenticator.model.entity.User;
import com.sitake.authenticator.model.registerDto.RegisterRequest;
import com.sitake.authenticator.model.registerDto.RegisterResponse;
import com.sitake.authenticator.repository.UserRepository;

@Service
public class RegisterService {

    @Autowired
    UserRepository userRepository;

    public RegisterResponse registerUser(RegisterRequest registerRequest) {
        // cek nik sudah terdaftar

        User user = User.builder().nama(registerRequest.getNama()).nik(registerRequest.getNik())
        .password(registerRequest.getPassword()).build();

        userRepository.save(user);

        Optional<User> check = userRepository.findById(user.getId());

        return RegisterResponse.builder().message(check.get().getNama()).build();
    }
}
