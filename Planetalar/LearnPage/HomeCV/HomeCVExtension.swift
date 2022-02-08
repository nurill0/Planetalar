//
//  HomeCVExtension.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit

@available(iOS 13.0, *)
extension HomeController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getSize()
    }
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.planetImage.image = UIImage(named: model.getItem(index: indexPath.item).imageName)
        DefinitionController.player.pause()

        cell.titleLabel.text = model.getItem(index: indexPath.item).title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-20, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DefinitionController()
        vc.modalPresentationStyle = .fullScreen
        vc.type = indexPath.item
        vc.imageName = model.getItem(index: indexPath.item).imageName
        vc.navtitle = model.getItem(index: indexPath.item).title
        vc.definition = model2.getItem(index: indexPath.item).definitionText
        vc.audioName = model2.getItem(index: indexPath.item).audioName
       // UserDefaultS.shared.userDF.set(model2.getItem(index:indexPath.item).audioName, forKey: "audio_name")

        navigationController?.pushViewController(vc, animated: false)
    }
    
}
