package com.creator.controllers.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by pravindap on 7/23/17.
 */
@Controller
public class FrontendController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showFrontendPage() {
        return "page1";
    }
}
