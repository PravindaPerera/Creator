package com.creator.controllers.processor;

import com.creator.models.Database;
import com.creator.models.Frontend;
import com.creator.services.FrontendService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Created by pravindap on 7/27/17.
 */
@Controller
public class processController {
    @Autowired
    private FrontendService frontendService;

    private Frontend frontend;

    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public String process(ModelMap model, @RequestParam Map<String, String> params) {
        int numOfDBs;
        Database database = new Database();

        //process Db info
        numOfDBs = Integer.parseInt(params.get("numOfDBs"));
        database.setNumOfDBs(numOfDBs);

        for (int i=1; i<= numOfDBs; i++) {
            database.setNameOfDB(params.get("nameOfDB".concat(String.valueOf(i))));
            database.setTypeOfDB(params.get("typeOfDB".concat(String.valueOf(i))));
        }

        //process Frontend info
        frontend = frontendService.processFrontendDetails(params.get("desktop"),
                params.get("mobile"), params.get("login"));

        model.addAttribute("frontend", frontend);
        model.addAttribute("database", database);

        return "result";
    }
}
