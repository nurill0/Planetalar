//
//  HomeCell.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit
import Comets


class HomeCell: UICollectionViewCell{
    let backView = UIView()
    let planetImage = UIImageView()
    let titleLabel = UILabel()
    static let identifier = "cell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        initViews()
    }
    private func initViews(){
        self.addSubview(backView)
        self.addSubview(planetImage)
        self.addSubview(titleLabel)
        self.sendSubviewToBack(backView)
        
        backView.backgroundColor = .clear.withAlphaComponent(0.1)
        backView.layer.cornerRadius = 18
        backView.layer.borderColor = UIColor.white.cgColor
        backView.layer.borderWidth = 1
        backView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        planetImage.image = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        planetImage.contentMode = .scaleAspectFit
        planetImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.centerY.equalTo(backView.snp.top)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        titleLabel.text = "weffwe"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Marker Felt", size: 37)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backView.snp.bottom).offset(-20)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(70)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
    }
  
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
