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
// To enhance the security levels, we have included authentication for this application.
//This class main purpose is to authenticate the user's biometric or FaceID
class FaceIDAuthentication:UIViewController  {
    
    enum authenticationState {
        case loggedIn, loggedOut
    }
    
    var state = authenticationState.loggedOut
    
    func Authentication() {
        
        if state == .loggedIn {
            state = .loggedOut
        } else {
            let context = LAContext()
            var error: NSError?
            context.localizedCancelTitle = "Enter Username/Password"
            // checking the device policy and if it allowed then authentication will be placed on app
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
