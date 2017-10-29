package com.creator.services;

import com.creator.models.Database;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class DatabaseService {
    private Database database;

    public DatabaseService() {
        this.database = new Database();
    }

    public Database processDatabaseDetails(int numOfDbs, ArrayList<String> dbNames, ArrayList<String> dbTypes) {

       database.setNumOfDBs(numOfDbs);
        for (int i=0; i< numOfDbs; i++) {
             database.setNameOfDB(dbNames.get(i));
             database.setTypeOfDB(dbTypes.get(i));
        }

       return  database;
    }

}
