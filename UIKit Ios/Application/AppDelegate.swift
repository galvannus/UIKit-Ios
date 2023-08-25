//
//  AppDelegate.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 13/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var context: Context?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Vista inicializada
        window = UIWindow(frame: UIScreen.main.bounds)
        //ViewController de inicio que es UINav
        window?.rootViewController = UINavigationController()
        
        //El contexto es el root del UINav
        context = Context(width: window?.rootViewController as! UINavigationController)
        //Se inicializa el AppCoordinator con el contexto actual
        context?.initialize(coordinator: AppCoordinator(context: context!))
        window?.makeKeyAndVisible()

        return true
    }
}
