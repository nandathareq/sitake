package com.sitake.authenticator.repository;

import org.socialsignin.spring.data.dynamodb.repository.EnableScan;
import org.springframework.data.repository.CrudRepository;

import com.sitake.authenticator.model.entity.User;

@EnableScan
public interface UserRepository extends CrudRepository<User, Long> {

}
