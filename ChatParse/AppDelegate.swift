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
    Parse.setApplicationId("ILm5x6lQVNsiTWCBrOSaTQqSGOi8sZtb65P66n7o", clientKey: "6kQ1iniZpfexfhTn771Xi3eh9UTrmGxSoKyUEsYu")
    PFUser.enableAutomaticUser()

    let defaultACL = PFACL();

    // If you would like all objects to be private by default, remove this line.
    defaultACL.publicReadAccess = true

    PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser:true)

    return true
  }
}