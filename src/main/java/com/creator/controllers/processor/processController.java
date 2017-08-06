package com.creator.controllers.processor;

import com.creator.models.Database;
import com.creator.models.Frontend;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Created by pravindap on 7/27/17.
 */
@Controller
public class processController {
    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public String showHomePage(@RequestParam Map<String, String> params) {
        int numOfDBs;
        Database dbDetails = new Database();
        Frontend frontend = new Frontend();

        //process Db info
        numOfDBs = Integer.parseInt(params.get("numOfDBs"));
        dbDetails.setNumOfDBs(numOfDBs);

        while (numOfDBs > 0) {
            dbDetails.setNameOfDB(params.get("nameOfDB".concat(String.valueOf(numOfDBs))));
            dbDetails.setTypeOfDB(params.get("typeOfDB".concat(String.valueOf(numOfDBs))));
            numOfDBs --;
        }

        //process Frontend info
        switch (params.get("desktop")) {
            case "Web Application":
                frontend.setDesktopWebApp(true);
                break;
            case "Standalone Application":
                frontend.setDesktopStandaloneApp(true);
        }

        switch (params.get("mobile")) {
            case "Web Application":
                frontend.setMobileWebApp(true);
                break;
            case "Native Mobile Application":
                frontend.setMobileNativeApp(true);
        }

        return "result";
    }
}
