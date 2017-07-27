package com.creator.models;

import java.util.ArrayList;

/**
 * Created by pravindap on 7/27/17.
 */
public class Database {
    private int numOfDBs;
    private ArrayList<String> nameOfDB = new ArrayList<>();
    private ArrayList<String> typeOfDB = new ArrayList<>();

    public int getNumOfDBs() {
        return numOfDBs;
    }

    public void setNumOfDBs(int numOfDBs) {
        this.numOfDBs = numOfDBs;
    }

    public ArrayList<String> getNameOfDB() {
        return nameOfDB;
    }

    public void setNameOfDB(String nameOfDB) {
        this.nameOfDB.add(nameOfDB);
    }

    public ArrayList<String> getTypeOfDB() {
        return typeOfDB;
    }

    public void setTypeOfDB(String typeOfDB) {
        this.typeOfDB.add(typeOfDB);
    }
}
