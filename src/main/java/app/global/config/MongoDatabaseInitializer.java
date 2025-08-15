package app.global.config;

import org.bson.Document;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.index.CompoundIndexDefinition;
import org.springframework.data.mongodb.core.index.IndexOperations;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class MongoDatabaseInitializer {

    private final MongoTemplate mongoTemplate;

    public MongoDatabaseInitializer(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    @PostConstruct
    public void init() {
        String collectionName = "stores";

        if (!mongoTemplate.collectionExists(collectionName)) {
            mongoTemplate.createCollection(collectionName);
            System.out.println("MongoDB collection '" + collectionName + "' created.");
        }

        IndexOperations indexOps = mongoTemplate.indexOps(collectionName);
        Document indexKeys = new Document();
        indexKeys.put("categoryKeys", 1);
        indexKeys.put("regionName", 1);
        indexKeys.put("isActive", 1);

        CompoundIndexDefinition indexDefinition = new CompoundIndexDefinition(indexKeys);
        indexDefinition.named("store_search_index");

        indexOps.createIndex(indexDefinition);

        System.out.println("MongoDB index 'store_search_index' on collection '" + collectionName + "' ensured.");
    }
}
