package com.creator.controllers.processor;

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
        int numOfDBs = Integer.parseInt(params.get("numOfDBs"));
        return "result";
    }
}
