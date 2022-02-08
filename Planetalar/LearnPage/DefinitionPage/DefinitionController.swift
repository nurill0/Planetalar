//
//  DefinitionController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit
import Comets
import AVFoundation

@available(iOS 13.0, *)
class DefinitionController: UIViewController, AVAudioPlayerDelegate {
    
    let planetImage = UIImageView()
    let definitionTV = UITextView()
    let favouriteButton = UIButton()
    let backImage = UIImageView()
    let definitionLabel = UITextView()
    let playButton = UIButton()
    var favouriteIsTapped = true
    var imageName: String?
    var navtitle: String?
    var definition: String?
    var type = 0
    var audioName = ""
    let model = DefinitionData()
   static var player = AVAudioPlayer()
    override func viewWillAppear(_ animated: Bool) {
        FavouritesController.player.stop()
    }
    override func viewDidDisappear(_ animated: Bool) {
        DefinitionController.player.stop()

    }
    var audioPlayer = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = navtitle
        navigationItem.backBarButtonItem?.title = "Ortga"
        navigationItem.backButtonTitle  = "Ortga"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Marker Felt", size: 30)
        ]
        initViews()
        initComets()
    }
    
    private func initViews(){
        view.addSubview(planetImage)
        view.addSubview(definitionTV)
        view.addSubview(favouriteButton)
        view.addSubview(backImage)
        view.sendSubviewToBack(backImage)
        backImage.image = UIImage(named: "back")
        backImage.contentMode = .scaleAspectFill
        backImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        favouriteButton.setImage(UIImage(named: "star128")?.withTintColor(.white), for: .normal)
        
        favouriteButton.imageView?.contentMode = .scaleAspectFit
        favouriteButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-20)
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(40)
            make.height.equalTo(50)
        }
        favouriteButton.addTarget(self, action: #selector(tapFavourite), for: .touchUpInside)
        planetImage.image = UIImage(named: imageName!)
        planetImage.contentMode = .scaleAspectFit
        planetImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
        view.addSubview(definitionLabel)
        definitionLabel.text = definition
        definitionLabel.textColor = .black
        definitionLabel.textAlignment = .left
        definitionLabel.isEditable = false
        definitionLabel.showsVerticalScrollIndicator = false
        
        // definitionLabel.adjustsFontSizeToFitWidth = true
        definitionLabel.backgroundColor = .white.withAlphaComponent(0.4)
        definitionLabel.snp.makeConstraints { make in
            make.top.equalTo(planetImage.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        definitionLabel.layer.cornerRadius = 18
        definitionLabel.layer.borderColor = UIColor.white.cgColor
        definitionLabel.layer.borderWidth = 1
        definitionLabel.clipsToBounds = true
        
        view.addSubview(playButton)
        playButton.setImage(UIImage(named: "play"), for: .normal)
        playButton.imageView?.contentMode = .scaleAspectFit
        playButton.addTarget(self, action: #selector(playButtonSound), for: .touchUpInside)
        if self.view.frame.height>740{
            definitionLabel.font = .systemFont(ofSize: 25, weight: .semibold)
            
            playButton.snp.makeConstraints { make in
                make.top.equalTo(definitionLabel.snp.bottom).offset(60)
                make.width.height.equalTo(90)
                make.centerX.equalToSuperview()
            }
        }else{
            definitionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
            
            playButton.snp.makeConstraints { make in
                make.top.equalTo(definitionLabel.snp.bottom).offset(20)
                make.width.height.equalTo(90)
                make.centerX.equalToSuperview()
            }
        }
        
        
        
    }
    
    func playAudioFromProject() {
        let url = Bundle.main.url(forResource: audioName, withExtension: "m4a")
        DefinitionController.player = try! AVAudioPlayer(contentsOf: url!)
        DefinitionController.player.play()
    }
    
    @objc func playButtonSound(){
        playAudioFromProject()
    }
    
    @objc func tapFavourite(){
        
        if favouriteIsTapped{
            //MARK: SHU YERDA USER DEFAULTSGA QO`SHISH KERAK
            UserDefaultS.shared.userDF.set(model.getItem(index:type).imageName, forKey: "image_name")
            UserDefaultS.shared.userDF.set(model.getItem(index:type).definitionText, forKey: "definition_text")
           
            UserDefaultS.shared.userDF.set(model.getItem(index:type).audioName, forKey: "audio_name")
            
            favouriteButton.setImage(UIImage(named: "star64"), for: .normal)
            favouriteIsTapped = false
            
            
        }else{
            favouriteButton.setImage(UIImage(named: "star128")?.withTintColor(.white), for: .normal)
            favouriteIsTapped = true
            
        }
    }
    
}





















@available(iOS 13.0, *)
extension DefinitionController{
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
