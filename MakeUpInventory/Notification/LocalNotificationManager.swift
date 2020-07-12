//
//  LocalNotificationManager.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 12/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import Foundation
import SwiftUI

class LocalNotificationManager: ObservableObject {
    
     var notifications = [Notification]()

    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
         let content = UNMutableNotificationContent()
               content.title = title
               if let subtitle = subtitle {
                   content.subtitle = subtitle
               }
               content.body = body
        content.sound = UNNotificationSound.default
                  
        
        
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
            let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
        
            UNUserNotificationCenter.current().add(request)

    }
}
