package com.sitake.authenticator.repository;

import org.springframework.data.repository.CrudRepository;

import com.sitake.authenticator.models.entity.User;

public interface UserRepository extends CrudRepository<User, Long> {

}
