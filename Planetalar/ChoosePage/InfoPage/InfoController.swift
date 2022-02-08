//
//  InfoController.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 07/02/22.
//

import UIKit
import Comets 
@available(iOS 11.0, *)
class InfoController: UIViewController {

    let defTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        initViews()
        initComets()
    }
    
    
    private func initViews(){
        view.addSubview(defTextView)
        defTextView.text = """
    Dastur haqida

Ushbu dastur quyosh tizimidagi sayyoralar haqida axborot beradi.Dasturimizda qisqacha yozuvdagi ma`lumot va ovozli ma`lumot mavjud.Bularni o`rganib o`ziga bilim yig`gan foydalanuvchi dasturdagi sayyoralarga oid testimizni ishlashi mumkin bo`ladi.

    Dasturchi haqida

Tuzuvchi: Domlajonov Nurillo

Email: nurillod23@mail.ru

Linkedin: linkedin.com/in/nurillo-domlajonov-609a69226

Github: https://github.com/nurill0

"""
        defTextView.backgroundColor = .white.withAlphaComponent(0.4)
        defTextView.textColor = .white
        defTextView.isEditable = false
        defTextView.showsVerticalScrollIndicator = false
        defTextView.textAlignment = .center
        defTextView.font = UIFont(name: "Times New Roman", size: 25)
        defTextView.layer.cornerRadius = 18
        defTextView.layer.borderColor = UIColor.white.cgColor
        defTextView.layer.borderWidth = 1
        defTextView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    

}
@available(iOS 11.0, *)
extension InfoController{
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
