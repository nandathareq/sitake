package com.sitake.authenticator;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.autoconfigure.SpringBootApplication;


import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeDefinition;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.KeySchemaElement;
import com.amazonaws.services.dynamodbv2.model.KeyType;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;

@SpringBootApplication
public class AuthenticatorApplication {

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
		AmazonDynamoDBClient client = new AmazonDynamoDBClient();
		client.setEndpoint("http://localhost:8000");

		List<AttributeDefinition> attributeDefinitions = new ArrayList<AttributeDefinition>();
		attributeDefinitions.add(new AttributeDefinition()
				.withAttributeName("Id").withAttributeType("N"));

		attributeDefinitions.add(new AttributeDefinition()
				.withAttributeName("Nik").withAttributeType("S"));

		List<KeySchemaElement> keySchema = new ArrayList<KeySchemaElement>();
		keySchema.add(new KeySchemaElement().withAttributeName("Id")
				.withKeyType(KeyType.HASH));
		keySchema.add(new KeySchemaElement().withAttributeName("Nik")
				.withKeyType(KeyType.RANGE));

		CreateTableRequest request = new CreateTableRequest()
				.withTableName("User")
				.withKeySchema(keySchema)
				.withAttributeDefinitions(attributeDefinitions)
				.withProvisionedThroughput(new ProvisionedThroughput()
						.withReadCapacityUnits(10L)
						.withWriteCapacityUnits(10L));

		client.createTable(request);

	}

}
