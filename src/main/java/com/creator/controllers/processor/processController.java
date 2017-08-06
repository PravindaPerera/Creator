package com.creator.controllers.processor;

import com.creator.models.Database;
import com.creator.models.Frontend;
import com.creator.services.FrontendService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private FrontendService frontendService;

    private Frontend frontend;

    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public String showHomePage(@RequestParam Map<String, String> params) {
        int numOfDBs;
        Database dbDetails = new Database();

        //process Db info
        numOfDBs = Integer.parseInt(params.get("numOfDBs"));
        dbDetails.setNumOfDBs(numOfDBs);

        while (numOfDBs > 0) {
            dbDetails.setNameOfDB(params.get("nameOfDB".concat(String.valueOf(numOfDBs))));
            dbDetails.setTypeOfDB(params.get("typeOfDB".concat(String.valueOf(numOfDBs))));
            numOfDBs --;
        }

        //process Frontend info
        frontend = frontendService.processFrontendDetails(params.get("desktop"),
                params.get("mobile"), params.get("login"));

        System.out.println(frontend.isDesktopWebApp());
        System.out.println(frontend.isDesktopStandaloneApp());
        System.out.println(frontend.isMobileWebApp());
        System.out.println(frontend.isMobileNativeApp());
        System.out.println(frontend.isPrivateLogin());
        System.out.println(frontend.isSocialMediaAppLogin());

        return "result";
    }
}
