//
//  AppDelegate.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse

// If you want to use any of the UI components, uncomment this line
// import ParseUI

// If you want to use Crash Reporting - uncomment this line
// import ParseCrashReporting

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Enable storing and querying data from Local Datastore.
    // Remove this line if you don't want to use Local Datastore features or want to use cachePolicy.
    Parse.enableLocalDatastore()

    // ****************************************************************************
    // Uncomment this line if you want to enable Crash Reporting
    // ParseCrashReporting.enable()
    //
    // Uncomment and fill in with your Parse credentials:
    Parse.setApplicationId("ILm5x6lQVNsiTWCBrOSaTQqSGOi8sZtb65P66n7o", clientKey: "6kQ1iniZpfexfhTn771Xi3eh9UTrmGxSoKyUEsYu")
    //
    // If you are using Facebook, uncomment and add your FacebookAppID to your bundle's plist as
    // described here: https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/
    // Uncomment the line inside ParseStartProject-Bridging-Header and the following line here:
    // PFFacebookUtils.initializeFacebook()
    // ****************************************************************************

    PFUser.enableAutomaticUser()

    let defaultACL = PFACL();

    // If you would like all objects to be private by default, remove this line.
    defaultACL.publicReadAccess = true

    PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser:true)

    if application.applicationState != UIApplicationState.Background {
      // Track an app open here if we launch with a push, unless
      // "content_available" was used to trigger a background push (introduced in iOS 7).
      // In that case, we skip tracking here to avoid double counting the app-open.

      let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
      let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
      var noPushPayload = false;
      if let options = launchOptions {
        noPushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil;
      }
      if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
      }
    }

    return true
  }
}

