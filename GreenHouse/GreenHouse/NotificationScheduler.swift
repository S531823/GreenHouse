//
//  NotificationScheduler.swift
//  GreenHouse
//
//  Created by student on 4/1/20.
//  Copyright © 2020 S531823. All rights reserved.
//
import Foundation
import UserNotifications

class NotificationScheduler  {
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
    
    func RequestPermission()  {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("permission granted")
                self.schedule()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func schedule() {
     
                      let center = UNUserNotificationCenter.current()
                      center.removeAllPendingNotificationRequests()
        
                      let content = UNMutableNotificationContent()
                      
                      content.title = "Pour Water to Plant"
                      content.body = "remainder for pouring water"
                      content.categoryIdentifier = "Remainder"
                      content.sound = .default
                      
                      var dateComponents = DateComponents()
                      //switch between week and day of pickview
                      switch self.waterTimeFrame {
                      case "day":
                          // var time = 0
                          let  time = 24 / self.waterFrequancy
                          var tempHour = 1
                          for _ in 1...self.waterFrequancy
                          {
                              dateComponents.hour = tempHour
                              dateComponents.minute = 00
                              //                       let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                              //                       print("trigger")
                              let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                              UNUserNotificationCenter.current().add(request) {(error) in
                                     if let error = error {
                                         print("error: \(error)")
                                     } else {
                                         print("Scheduled Notification")
                                     }

                                 }
                              tempHour += time
                              if tempHour >= 24
                              {
                                  tempHour = 0
                              }
                              //print("completeday" + String(tempHour))
                          }
                      default:
                          var day : Double = Double(7.0 / Double(self.waterFrequancy))
                          let check : Int = 7 / self.waterFrequancy
                          if day-Double(check) > 0
                          {
                              day+=1
                          }
                          var tempDay = 0
                          for _ in 1...self.waterFrequancy
                          {
                              
                              dateComponents.weekday = Int(day)
                              dateComponents.hour = 09
                              dateComponents.minute = 00
                              //                       let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                              //                       print("trigger")
                              let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                              UNUserNotificationCenter.current().add(request) {(error) in
                                     if let error = error {
                                         print("error: \(error)")
                                     } else {
                                         print("Scheduled Notification")
                                     }

                                 }
                              tempDay += Int(day)
                              if tempDay > 7
                              {
                                  tempDay = 1
                              }
                              //print("completeweek" + String(tempDay))
                              
                          }
                      }
                      
                   
              }
        
    }
    
