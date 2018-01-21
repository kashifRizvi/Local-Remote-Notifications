//
//  ViewController.swift
//  Notifications
//
//  Created by Kashif Rizvi on 21/01/18.
//  Copyright © 2018 Kashif Rizvi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var showNotificationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showNotificationPressed(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification test!"
        content.subtitle = "New Notification Arrived!"
        content.body = "You have got your first notificaiton, congrats!"
        content.categoryIdentifier = "testCategory"
        content.sound = UNNotificationSound.default()
        
        UNUserNotificationCenter.current().delegate = self
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let requestIdentifier = "notificationTest"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "optionOne":
            print("Selected first response =========OptionOne========")
            showNotificationButton.titleLabel?.text = "OptionOne Selected"
        case "optionTwo":
            print("Selected second response ==========OptionTwo========")
            showNotificationButton.titleLabel?.text = "OptionTwo Selected"
        case "optionThree":
            print("Selected Third response ==========OptionThree=========")
            showNotificationButton.titleLabel?.text = "OptionThree Selected"
        default:
            print("=========== Selected Default response ==========")
        }
        view.layoutIfNeeded()
    }
    

}

