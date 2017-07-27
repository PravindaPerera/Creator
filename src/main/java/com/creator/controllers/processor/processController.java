package com.creator.controllers.processor;

import com.creator.models.Database;
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
        Database dbDetails = new Database();
        int numOfDBs = Integer.parseInt(params.get("numOfDBs"));
        dbDetails.setNumOfDBs(numOfDBs);

        while (numOfDBs > 0) {
            dbDetails.setNameOfDB(params.get("nameOfDB".concat(String.valueOf(numOfDBs))));
            dbDetails.setTypeOfDB(params.get("typeOfDB".concat(String.valueOf(numOfDBs))));
            numOfDBs --;
        }

        return "result";
    }
}
