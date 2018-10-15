package com.creator.services;

/**
 * Created by pravindap on 8/6/17.
 */

import com.creator.models.Frontend;
import org.springframework.stereotype.Service;

@Service
public class FrontendService {
    private Frontend frontend;

    public FrontendService() {
        this.frontend = new Frontend();
    }

    // processing the user specified type of applications frontend
    public Frontend processFrontendDetails(String desktopApp, String mobileApp) {
        frontend.setNumOfApps(0);
        switch (desktopApp) {
            case "Web Application":
                frontend.setDesktopWebApp(true);
                frontend.setDesktopStandaloneApp(false);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            case "Standalone Application":
                frontend.setDesktopStandaloneApp(true);
                frontend.setDesktopWebApp(false);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            default:
                frontend.setDesktopWebApp(false);
                frontend.setDesktopStandaloneApp(false);
                break;
        }

        switch (mobileApp) {
            case "Web Application":
                frontend.setMobileWebApp(true);
                frontend.setMobileNativeApp(false);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            case "Native Mobile Application":
                frontend.setMobileNativeApp(true);
                frontend.setMobileWebApp(false);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            default:
                frontend.setMobileWebApp(false);
                frontend.setMobileNativeApp(false);
                break;
        }

//        switch (login) {
//            case "Private Login Facility":
//                frontend.setPrivateLogin(true);
//                frontend.setSocialMediaAppLogin(false);
//                break;
//            case "Social Media Application Login Facility":
//                frontend.setSocialMediaAppLogin(true);
//                frontend.setPrivateLogin(false);
//                break;
//            default:
//                frontend.setPrivateLogin(false);
//                frontend.setSocialMediaAppLogin(false);
//                break;
//        }
        return frontend;
    }
}
