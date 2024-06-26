//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by Marshanda Gwie on 21/04/24.
//

import WatchKit
import SwiftUI
import UserNotifications

//Logics untuk menampilkan notifikasi di watchOS

// Definisikan NotificationController sebagai pengendali notifikasi untuk menampilkan NotificationView
class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }


    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()


        let notificationData =
            notification.request.content.userInfo as? [String: Any]


        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String


        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
