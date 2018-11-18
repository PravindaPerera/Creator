package com.creator.controllers.processor;

import com.creator.models.Backend;
import com.creator.models.Database;
import com.creator.models.Frontend;
import com.creator.models.UseCase;
import com.creator.services.BackendService;
import com.creator.services.DatabaseService;
import com.creator.services.FrontendService;
import com.creator.services.UseCaseService;

import com.mongodb.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

/**
 * Created by pravindap on 7/27/17.
 */
@Controller
public class processController {
    @Autowired
    private FrontendService frontendService;
    @Autowired
    private DatabaseService databaseService;
    @Autowired
    private UseCaseService useCaseService;
    @Autowired
    private BackendService backendService;

    private Frontend frontend;
    private Database database;
    private ArrayList<Backend> backendComponents = new ArrayList<Backend>();
    private ArrayList<String> featureCategories = new ArrayList<>();
    private ArrayList<UseCase> useCases = new ArrayList<UseCase>();

    final String DATABASE_NAME = "Test111";
    final String DOCUMENT_NAME = "cRecords";

    @RequestMapping(value = "/process/featureCategories", method = RequestMethod.POST)
    public String processFeatureCategories(ModelMap model, @RequestParam Map<String, String> params) {


        for (int i=1; i<params.size(); i++) {
            featureCategories.add(params.get("featureCategory"+i+""));
        }
        model.addAttribute("featureCategories", featureCategories);

        return "page2";
    }

    @RequestMapping(value = "/process/useCases", method = RequestMethod.POST)
    public String processFrontend(ModelMap model, @RequestParam Map<String, String> params) {

        ArrayList<String> names = new ArrayList<String>();
        ArrayList<String> featureCategories = new ArrayList<String>();
        ArrayList<Boolean> dbs = new ArrayList<Boolean>();
        ArrayList<Boolean> apis = new ArrayList<Boolean>();
        ArrayList<Boolean> fe1 = new ArrayList<Boolean>();
        ArrayList<Boolean> fe2 = new ArrayList<Boolean>();

        int index = 1;

        while (params.get("useCaseName".concat(String.valueOf(index))) != null) {
            names.add(params.get("useCaseName".concat(String.valueOf(index))));
            featureCategories.add(params.get("featureCategory".concat(String.valueOf(index))));
            dbs.add(params.get("useCaseDB".concat(String.valueOf(index))) != null);
            apis.add(params.get("useCaseAPIs".concat(String.valueOf(index))) != null);
            fe1.add(params.get("feDesktop".concat(String.valueOf(index))) != null);
            fe2.add(params.get("feMobile".concat(String.valueOf(index))) != null);
            index += 1;
        }

        useCases = useCaseService.processUseCases(names, featureCategories, dbs, apis, fe1, fe2);
        frontend = this.getFrontendInformation(params);

        backendComponents = backendService.processBackendComponents(useCases);

        // call the KB and retrieve domain specific data set
        // If no domain specific data set then - system generated paths will not be modified
        // If KB contains a rule set modify the system generated paths against the KB rules
        // @TODO how to take the weights from the architect?
        // Calculate the metric based average score
        // and return

        model.addAttribute("frontend", frontend);
        model.addAttribute("backendComponents", backendComponents);
        model.addAttribute("numOfFeatureCategories", backendComponents.size());

//        for (int i=0; i< backendComponents.size(); i++) {
//            System.out.println("FC...... " + backendComponents.get(i).getFeatureCategory());
//            System.out.println("FE1...... " + backendComponents.get(i).getFE1());
//            System.out.println("FE2..... " + backendComponents.get(i).getFE2());
//            System.out.println("MS...... " + backendComponents.get(i).getMS());
//        }

        return "result";
    }

    @RequestMapping(value = "/process/architecture", method = RequestMethod.POST)
    public String process(ModelMap model, @RequestParam Map<String, String> params) {

        database = this.getDatabaseInformation(params);
        frontend = this.getFrontendInformation(params);


        model.addAttribute("frontend", frontend);
        model.addAttribute("database", database);

        return "result";
    }

    @RequestMapping(value = "/process/services", method = RequestMethod.POST)
    public String processServices(ModelMap model, @RequestParam Map<String, String> params) {

        frontend = this.getFrontendInformation(params);


        model.addAttribute("frontend", frontend);

        return "home";
    }

    // get database information from the request params
    private Database getDatabaseInformation(@RequestParam Map<String, String> params) {
        int numOfDBs;
        ArrayList<String> databaseNames = new ArrayList<String>();
        ArrayList<String> databseTypes = new ArrayList<String>();

        //process Db info
        numOfDBs = Integer.parseInt(params.get("numOfDBs"));

        for (int i=1; i<= numOfDBs; i++) {
            databaseNames.add(params.get("nameOfDB".concat(String.valueOf(i))));
            databseTypes.add(params.get("typeOfDB".concat(String.valueOf(i))));
        }

        return databaseService.processDatabaseDetails(numOfDBs, databaseNames, databseTypes);
    }

    // get frontend information from the request params
    private Frontend getFrontendInformation(@RequestParam Map<String, String> params) {

        String desktopAppStatus = params.get("desktop");
        String mobileAppStatus = params.get("mobile");

        return frontendService.processFrontendDetails(desktopAppStatus, mobileAppStatus);

    }

    // Add a new controller method to handle architects changes
    // Within it do the required changes
    // Calculate the metric score with modifications
    // See whether it is better than the system generated
    // If so update the KB and return the result

//    // Save details to database
//    private void saveToDatabase() {
//
//        // String roomIdValue;
//        int numberOfAssets;
//        double gfaValue = 2.09;
//        ArrayList<String> assetNames = new ArrayList<>();
//        ArrayList<Double> assetValues = new ArrayList<>();
//
//        assetNames.add("asset 1");
//        assetNames.add("asset 2");
//
//        assetValues.add(2.39);
//        assetValues.add(4.39);
//
//        try {
//
//            // Connect to MongoDB
//            MongoClient mongo = new MongoClient("localhost", 27017);
//
//            // Get db
//            DB db = mongo.getDB(DATABASE_NAME);
//
//            // Get specified table from specified db
//            DBCollection table = db.getCollection(DOCUMENT_NAME);
//
//            // Insert db record
//            // create a document to store key and value
//            BasicDBObject document = new BasicDBObject();
//            document.put("_id", "Type");
//            document.put("roomId", "1111");
//            document.put("numberOfAssets", 2);
//            document.put("gfaValue", gfaValue);
//            document.put("assetNames", assetNames);
//            document.put("assetValues", assetValues);
//            document.put("createdDate", new Date());
//            table.insert(document);
//
//
//        } catch (UnknownHostException e) {
//            e.printStackTrace();
//        }
//
//    }

//    // get details from database
//    private void getFromDatabase() {
//        try {
//            // Connect to MongoDB
//            MongoClient mongo = new MongoClient("localhost", 27017);
//
//            // Get db
//            DB db = mongo.getDB(DATABASE_NAME);
//
//            // Get specified table from specified db
//            DBCollection table = db.getCollection(DOCUMENT_NAME);
//
//            // get room details from db
//            BasicDBObject searchQuery = new BasicDBObject();
//            searchQuery.put("_id", 20);
//
//            DBCursor cursor = table.find(searchQuery);
//
//            System.out.println("COUNT!!!!! " + cursor.count());
//
//            while (cursor.hasNext()) {
//                DBObject obj = cursor.next();
////                retreivedGFAValue = (Double) obj.get("gfaValue");
////                retreivedAssetNames = (ArrayList<Object>) obj.get("assetNames");
////                retreivedAssetValues = (ArrayList<Object>) obj.get("assetValues");
//            }
//
//        } catch (UnknownHostException e) {
//            e.printStackTrace();
//        }
//    }
}
