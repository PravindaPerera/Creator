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
    public Frontend processFrontendDetails(String desktopApp, String mobileApp, String login) {
        switch (desktopApp) {
            case "Web Application":
                frontend.setDesktopWebApp(true);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            case "Standalone Application":
                frontend.setDesktopStandaloneApp(true);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            default:
                break;
        }

        switch (mobileApp) {
            case "Web Application":
                frontend.setMobileWebApp(true);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            case "Native Mobile Application":
                frontend.setMobileNativeApp(true);
                frontend.setNumOfApps(frontend.getNumOfApps() + 1);
                break;
            default:
                break;
        }

        switch (login) {
            case "Private Login Facility":
                frontend.setPrivateLogin(true);
                break;
            case "Social Media Application Login Facility":
                frontend.setSocialMediaAppLogin(true);
                break;
            default:
                break;
        }
        return frontend;
    }
}
