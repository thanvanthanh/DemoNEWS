//
//  AppDelegate.swift
//  News_Thanh
//
//  Created by Thân Văn Thanh on 4/22/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // khởi tạo cửa sổ
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //  khởi tạo màn hình chính
        let mainVC = NewsViewController()
        
        // khởi tạo navigationController
//        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        
        // gán root ViewController
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        return true
    }
}
