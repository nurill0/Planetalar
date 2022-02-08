//
//  HomeTabBarController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit
import Comets
@available(iOS 11.0, *)
class HomeTabBarController: UITabBarController {
    
    override func viewDidDisappear(_ animated: Bool) {
        FavouritesController.player.stop()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        initComets()
        initViews()
        navigationItem.backButtonTitle  = "Ortga"

    }
    func initViews(){
        let home = HomeController()
        let favourite = FavouritesController()
            home.tabBarItem = UITabBarItem(title: "Asosiy", image: #imageLiteral(resourceName: "home24").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "home32").withRenderingMode(.alwaysOriginal))
            favourite.tabBarItem = UITabBarItem(title: "Sevimli", image: #imageLiteral(resourceName: "star24").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "star32").withRenderingMode(.alwaysOriginal))
        if self.view.frame.height>736{
            home.tabBarItem.setTitleTextAttributes([.font: UIFont(name: "Marker Felt", size: 18)], for: .normal)
            favourite.tabBarItem.setTitleTextAttributes([.font: UIFont(name: "Marker Felt", size: 18)], for: .normal)
        }
        else{
            home.tabBarItem.setTitleTextAttributes([.font: UIFont(name: "Marker Felt", size: 14)], for: .normal)
            favourite.tabBarItem.setTitleTextAttributes([.font: UIFont(name: "Marker Felt", size: 14)], for: .normal)
        }
       
        
        
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.backgroundColor = .white.withAlphaComponent(0.2)
        tabBar.isTranslucent = true
        tabBar.barStyle = .black
        tabBar.layer.cornerRadius = 18
        tabBar.clipsToBounds = true
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewControllers = [home,favourite]
    }
}
@available(iOS 11.0, *)
extension HomeTabBarController{
    func initComets() {
        // Customize your comet
        let width = view.bounds.width
        let height = view.bounds.height
        let comets = [Comet(startPoint: CGPoint(x: 100, y: 0),
                            endPoint: CGPoint(x: 0, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.8 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.2 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                            endPoint: CGPoint(x: 0, y: 0.25 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                            endPoint: CGPoint(x: 0.6 * width, y: height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width - 100, y: height),
                            endPoint: CGPoint(x: width, y: height - 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                            endPoint: CGPoint(x: width, y: 0.75 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white)]

        // draw line track and animate
        for comet in comets {
            view.layer.addSublayer(comet.drawLine())
            view.layer.addSublayer(comet.animate())
        }
    }
}
