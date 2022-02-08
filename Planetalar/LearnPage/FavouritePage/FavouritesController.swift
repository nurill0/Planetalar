//
//  FavouritesController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit
import Comets
import AVFoundation

@available(iOS 11.0, *)
class FavouritesController: UIViewController {
    
    let planetImage = UIImageView()
    let definitionTV = UITextView()
    let favouriteButton = UIButton()
    let backImage = UIImageView()
    let definitionLabel = UITextView()
    let playButton = UIButton()
    var favouriteIsTapped = true
    var imageName = UserDefaultS.shared.userDF.string(forKey: "image_name")
    var navtitle: String?
    static  var player = AVAudioPlayer()
    var definition = UserDefaultS.shared.userDF.string(forKey:"definition_text")
    var audioName = ""///UserDefaultS.shared.userDF.string(forKey:"audio_name")
    
    
    override func viewWillAppear(_ animated: Bool) {
        planetImage.image = UIImage(named: UserDefaultS.shared.userDF.string(forKey: "image_name") ?? "")
        definitionLabel.text = UserDefaultS.shared.userDF.string(forKey:"definition_text")
        audioName = UserDefaultS.shared.userDF.string(forKey: "audio_name") ?? ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initComets()
        navigationItem.backButtonTitle  = "Ortga"
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
        planetImage.image = UIImage(named: "1")
        planetImage.contentMode = .scaleAspectFit
        planetImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(180)
        }
        view.addSubview(definitionLabel)
        definitionLabel.text = "Saralangan ma`lumotlarga ma`lumot qo`shilmagan."
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
        if self.view.frame.height>740{
            definitionLabel.font = .systemFont(ofSize: 25, weight: .semibold)
            definitionLabel.snp.makeConstraints { make in
                make.top.equalTo(planetImage.snp.bottom).offset(10)
                make.right.left.equalToSuperview().inset(20)
                make.height.equalToSuperview().multipliedBy(0.4)
            }
            playButton.snp.makeConstraints { make in
                make.top.equalTo(definitionLabel.snp.bottom).offset(25)
                make.width.height.equalTo(90)
                make.centerX.equalToSuperview()
            }
        }else{
            definitionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
            definitionLabel.snp.makeConstraints { make in
                make.top.equalTo(planetImage.snp.bottom).offset(10)
                make.right.left.equalToSuperview().inset(20)
                make.height.equalToSuperview().multipliedBy(0.4)
            }
            playButton.snp.makeConstraints { make in
                make.top.equalTo(definitionLabel.snp.bottom).offset(5)
                make.width.height.equalTo(80)
                make.centerX.equalToSuperview()
            }
        }
        playButton.addTarget(self, action: #selector(playButtonSound), for: .touchUpInside)
    }
    func playAudioFromProject() {
        let url = Bundle.main.url(forResource: audioName, withExtension: "m4a")
        FavouritesController.player = try! AVAudioPlayer(contentsOf: url!)
        FavouritesController.player.play()
    }
    
    @objc func playButtonSound(){
        playAudioFromProject()
    }
    
}

//private func initViews(){
//    view.addSubview(collectionView)
//    collectionView.backgroundColor = .clear
//    collectionView.snp.makeConstraints { make in
//        make.edges.equalToSuperview()
//    }
//
//}
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
//        layout.scrollDirection = .vertical
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: FavouriteCell.identifier)
//        return collectionView
//    }()



















@available(iOS 11.0, *)
extension FavouritesController{
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
