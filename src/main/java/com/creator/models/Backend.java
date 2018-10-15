package com.creator.models;

public class Backend {
    private String featureCategory = null;
    private Boolean isDb = false;
    private Boolean isApi = false;
    private Boolean isMS = false;
    private Boolean isFE1 = false;
    private Boolean isFE2 = false;

    public String getFeatureCategory() {
        return featureCategory;
    }

    public void setFeatureCategory(String featureCategory) {
        this.featureCategory = featureCategory;
    }

    public Boolean getDb() {
        return isDb;
    }

    public void setDb(Boolean db) {
        isDb = db;
    }

    public Boolean getApi() {
        return isApi;
    }

    public void setApi(Boolean api) {
        isApi = api;
    }

    public Boolean getMS() {
        return isMS;
    }

    public void setMS(Boolean MS) {
        isMS = MS;
    }

    public Boolean getFE1() {
        return isFE1;
    }

    public void setFE1(Boolean FE1) {
        isFE1 = FE1;
    }

    public Boolean getFE2() {
        return isFE2;
    }

    public void setFE2(Boolean FE2) {
        isFE2 = FE2;
    }
}
