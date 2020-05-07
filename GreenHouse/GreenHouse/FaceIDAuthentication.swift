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
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    var state = AuthenticationState.loggedout
    
    func tapButton() {
        
        if state == .loggedin {
            state = .loggedout
        } else {
            let context = LAContext()
            var error: NSError?
            context.localizedCancelTitle = "Enter Username/Password"
            
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
