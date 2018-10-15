package com.creator.controllers.processor;

import com.creator.models.Backend;
import com.creator.models.Database;
import com.creator.models.Frontend;
import com.creator.models.UseCase;
import com.creator.services.BackendService;
import com.creator.services.DatabaseService;
import com.creator.services.FrontendService;
import com.creator.services.UseCaseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
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
}
