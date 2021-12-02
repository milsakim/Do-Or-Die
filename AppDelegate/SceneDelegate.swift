//
//  SceneDelegate.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>)")
        
        /*
        if window == nil {
            print("window nil")
        }
        
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            print("fail to get nav controlelr")
            return
        }

        guard let rvc: ViewController = navigationController.viewControllers[0] as? ViewController else {
            print("fail1")
            return
        }
        guard let url: URL = URLContexts.first?.url else {
            print("fail2")
            return
        }
        
        print(url)
        
        do {
            let fileManage: FileManager = FileManager.default
            let documentsURL: URL = try fileManage.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            var destinationURL: URL = documentsURL.appendingPathComponent(url.lastPathComponent)
            
            if fileManage.fileExists(atPath: destinationURL.path) {
                print("\(destinationURL.lastPathComponent) exist")
                
                var count: Int = 1
                
                while fileManage.fileExists(atPath: destinationURL.path + " (\(count))") {
                    count += 1
                }
                
                destinationURL = documentsURL.appendingPathComponent(url.lastPathComponent + " (\(count))")
            }
            
            try fileManage.copyItem(at: url, to: destinationURL)
            
            rvc.displayText(url: destinationURL)
        }
        catch {
            print("fail3")
            return
        }
        */
    }
}

