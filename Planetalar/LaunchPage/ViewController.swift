//
//  ViewController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 21/01/22.
//

import UIKit
import Lottie
import Comets
@available(iOS 11.0, *)
class ViewController: UIViewController {
    var animationView: AnimationView?
    var timer        :         Timer!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimations()
        initTimer()
        initComets()
        
        //navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .black
      
    }
    
    private func initAnimations(){
        animationView = .init(name: "launch")
        animationView?.frame = view.bounds
        animationView?.animationSpeed = 1
        view.addSubview(animationView!)
        animationView?.play()
    }
    
    func initTimer(){
        timer = Timer.scheduledTimer(timeInterval: 4.99, target: self, selector: #selector(goWelcomeContoller), userInfo: nil, repeats: true)
    }
    
    @objc func goWelcomeContoller(){
        let vc = ChooseController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationController?.pushViewController(vc, animated: true)
        self.timer.invalidate()
    }

}
@available(iOS 11.0, *)
extension ViewController{
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


