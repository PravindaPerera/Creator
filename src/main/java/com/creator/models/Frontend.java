package com.creator.models;

import java.util.ArrayList;

/**
 * Created by pravindap on 8/6/17.
 */
public class Frontend {
    private boolean desktopWebApp;
    private boolean desktopStandaloneApp;
    private boolean mobileWebApp;
    private boolean mobileNativeApp;

    public Frontend () {
        this.desktopWebApp = false;
        this.desktopStandaloneApp = false;
        this.mobileWebApp = false;
        this.mobileNativeApp = false;
    }

    public boolean isDesktopWebApp() {
        return desktopWebApp;
    }

    public void setDesktopWebApp(boolean desktopWebApp) {
        this.desktopWebApp = desktopWebApp;
    }

    public boolean isDesktopStandaloneApp() {
        return desktopStandaloneApp;
    }

    public void setDesktopStandaloneApp(boolean desktopStandaloneApp) {
        this.desktopStandaloneApp = desktopStandaloneApp;
    }

    public boolean isMobileWebApp() {
        return mobileWebApp;
    }

    public void setMobileWebApp(boolean mobileWebApp) {
        this.mobileWebApp = mobileWebApp;
    }

    public boolean isMobileNativeApp() {
        return mobileNativeApp;
    }

    public void setMobileNativeApp(boolean mobileNativeApp) {
        this.mobileNativeApp = mobileNativeApp;
    }
}
