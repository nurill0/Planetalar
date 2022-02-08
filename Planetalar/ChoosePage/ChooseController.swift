//
//  ChooseController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 21/01/22.
//

import UIKit
import Comets
import SnapKit

@available(iOS 11.0, *)
class ChooseController: UIViewController {

    let titleLabel  =  UILabel()
    let infoButton  = UIButton()
    let shareButton = UIButton()
    let learnButton = UIButton(type: .system)
    let quizButton  = UIButton(type: .system)
    
    override func viewWillAppear(_ animated: Bool) {
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.setHidesBackButton(true, animated: true)
        initViews()
        initComets()
        addTargets()
        navigationItem.backButtonTitle  = "Ortga"
    }
    
    private func initViews(){
        view.addSubview(titleLabel)
        view.addSubview(infoButton)
        infoButton.setImage(UIImage(named: "astronaut")?.withRenderingMode(.alwaysOriginal), for: .normal)
        infoButton.imageView?.contentMode = .scaleAspectFill
        infoButton.backgroundColor = .black
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-20)
            make.left.equalToSuperview().inset(5)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        view.addSubview(shareButton)
        shareButton.setImage(UIImage(named: "success")?.withRenderingMode(.alwaysOriginal), for: .normal)
        shareButton.imageView?.contentMode = .scaleAspectFill
        shareButton.backgroundColor = .black
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-20)
            make.right.equalToSuperview().inset(5)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        titleLabel.text = "Sayyoralar"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Chalkduster", size: 50)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.infoButton.snp.bottom).offset(0)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(90)
        }
        view.addSubview(learnButton)
        learnButton.backgroundImage(for: .normal)
        learnButton.backgroundColor = .clear.withAlphaComponent(0.3)
        learnButton.setTitle("O`rganish", for: .normal)
        learnButton.layer.cornerRadius = 20
        learnButton.setTitleColor(.white, for: .normal)
        learnButton.layer.borderColor = UIColor.white.cgColor
        learnButton.layer.borderWidth = 1
        learnButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 35)
        learnButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-30)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(80)
        }
        view.addSubview(quizButton)
        quizButton.backgroundImage(for: .normal)
        quizButton.backgroundColor = .clear.withAlphaComponent(0.3)
        quizButton.setTitleColor(.white, for: .normal)
        quizButton.setTitle("Test", for: .normal)
        quizButton.layer.cornerRadius = 20
        quizButton.layer.borderColor = UIColor.white.cgColor
        quizButton.layer.borderWidth = 1
        quizButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 35)
        quizButton.snp.makeConstraints { make in
            make.top.equalTo(learnButton.snp.bottom).offset(30)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(80)
        }
       
    }
    
    func addTargets(){
        infoButton.addTarget(self, action: #selector(goInfo), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareApp), for: .touchUpInside)
        learnButton.addTarget(self, action: #selector(goLearnPage), for: .touchUpInside)
        quizButton.addTarget(self, action: #selector(goQuiz), for: .touchUpInside)
    }
    
    @objc func goLearnPage(){
        let vc = HomeTabBarController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goQuiz(){
        let vc = QuizController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goInfo(){
        let vc = InfoController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
   
    @objc func shareApp()->Void{
            let someText:String = "Sayyoralarni birgalikda o`rganamiz"
            let objectsToShare:URL = URL(string: "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)")!
            let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
            let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
            self.present(activityViewController, animated: true, completion: nil)
            
        }
}


@available(iOS 11.0, *)
extension ChooseController{
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

