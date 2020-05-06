//
//  FaceIDAuthentication.swift
//  GreenHouse
//
//  Created by student on 5/6/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import Foundation
import LocalAuthentication
import UIKit

class FaceIDAuthentication:UIViewController  {
 var context = LAContext()

enum AuthenticationState {
    case loggedin, loggedout
}

var state = AuthenticationState.loggedout
    
   

func tapButton() {
   if !UIAccessibility.isReduceTransparencyEnabled {
       view.backgroundColor = .clear

       let blurEffect = UIBlurEffect(style: .dark)
       let blurEffectView = UIVisualEffectView(effect: blurEffect)
       //always fill the view
       blurEffectView.frame = self.view.bounds
       blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

       view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
   } else {
       view.backgroundColor = .black
   }
        if state == .loggedin {

            // Log out immediately.
            state = .loggedout

        } else {

            // Get a fresh context for each login. If you use the same context on multiple attempts
            //  (by commenting out the next line), then a previously successful authentication
            //  causes the next policy evaluation to succeed without testing biometry again.
            //  That's usually not what you want.
            context = LAContext()
  var error: NSError?
            context.localizedCancelTitle = "Enter Username/Password"
            
           
            // First check if we have the needed hardware support.
          
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

                let reason = "Log in to your account"
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                    if (error != nil) {

                         print(error?.localizedDescription ?? "Failed to authenticate")
                        }

                    }
                }
            else {
                print(error?.localizedDescription ?? "Can't evaluate policy")
            }
            
}
  }

}
