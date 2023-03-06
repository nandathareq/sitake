package com.sitake.authenticator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;
import com.sitake.authenticator.model.entity.User;

@SpringBootApplication
public class AuthenticatorApplication {

	private static DynamoDBMapper dynamoDBMapper;

	@Autowired
    private static AmazonDynamoDB amazonDynamoDB;

	public static void main(String[] args) throws InterruptedException {

		SpringApplication.run(AuthenticatorApplication.class, args);
	}

	@Bean
	CommandLineRunner init() {
		return args -> {
			createDynamoDB();
		};
	}

	private static void createDynamoDB() throws InterruptedException {
		dynamoDBMapper = new DynamoDBMapper(amazonDynamoDB);
        
        CreateTableRequest tableRequest = dynamoDBMapper
          .generateCreateTableRequest(User.class);
        tableRequest.setProvisionedThroughput(
          new ProvisionedThroughput(1L, 1L));
        amazonDynamoDB.createTable(tableRequest);

	}

}
