//
//  NotificationScheduler.swift
//  GreenHouse
//
//  Created by student on 4/1/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import Foundation
import Foundation
import UserNotifications
class NotificationScheduler {
    private var waterFrequancy : Int
    private var waterTimeFrame : String
    private var sunlightDuration : Int
    private var sunlightTimeFrame: String
    
    init(waterFrequancy : Int, waterTimeFrame : String,sunlightDuration : Int, sunlightTimeFrame: String) {
        self.waterFrequancy = waterFrequancy
        self.waterTimeFrame = waterTimeFrame
        self.sunlightDuration = sunlightDuration
        self.sunlightTimeFrame = sunlightTimeFrame
    }
    
    func schedule() -> Void
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                 let center = UNUserNotificationCenter.current()
                       center.removeAllPendingNotificationRequests()
                       let content = UNMutableNotificationContent()

                       content.title = "Pour Water to Plant"
                       content.body = "remainder for pouring water"
                       content.categoryIdentifier = "Remainder"
                       content.sound = .default
                       
//                       var dateComponents = DateComponents()
//                       dateComponents.hour = 09
//                       dateComponents.minute = 00
                       let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                       
                       //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                       //center.add(request)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
       // print("schedule")
       
        
}
}
