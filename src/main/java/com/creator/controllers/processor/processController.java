package com.creator.controllers.processor;

import com.creator.models.Database;
import com.creator.models.Frontend;
import com.creator.services.DatabaseService;
import com.creator.services.FrontendService;

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

    private Frontend frontend;
    private Database database;

    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public String process(ModelMap model, @RequestParam Map<String, String> params) {

        database = this.getDatabaseInformation(params);

        //process Frontend info
        frontend = frontendService.processFrontendDetails(params.get("desktop"),
                params.get("mobile"), params.get("login"));

        model.addAttribute("frontend", frontend);
        model.addAttribute("database", database);

        return "result";
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
}
