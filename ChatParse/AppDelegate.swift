//
//  AppDelegate.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Enable storing and querying data from Local Datastore.
    // Remove this line if you don't want to use Local Datastore features or want to use cachePolicy.
    // Parse.enableLocalDatastore()

    Parse.setApplicationId("ILm5x6lQVNsiTWCBrOSaTQqSGOi8sZtb65P66n7o", clientKey: "6kQ1iniZpfexfhTn771Xi3eh9UTrmGxSoKyUEsYu")

    // PFUser.enableAutomaticUser()

    let defaultACL = PFACL();

    // If you would like all objects to be private by default, remove this line.
    defaultACL.publicReadAccess = true

    PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser:true)

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    if PFUser.currentUser() != nil {
        // Go to the logged in screen
        print("Current user: \(PFUser.currentUser()!)")
        let vc = storyboard.instantiateViewControllerWithIdentifier("rootNavigationController")
        window?.rootViewController = vc
    }

    return true
  }
}