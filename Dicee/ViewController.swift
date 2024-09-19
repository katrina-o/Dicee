//
//  ViewController.swift
//  Dicee
//
//  Created by Катя on 11.06.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    let imageBack: UIImageView = {
        let imageBack = UIImageView()
        imageBack.image = UIImage(named: "newbackground")
        imageBack.contentMode = .scaleAspectFill
        return imageBack
    }()
    
    let imageLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "diceeLogo")
        imageLogo.contentMode = .scaleAspectFit
        return imageLogo
    }()
    
    let imageOne: UIImageView = {
        let imageOne = UIImageView()
        imageOne.image = UIImage(named: "dice1")
        imageOne.contentMode = .scaleAspectFit
        return imageOne
    }()
    
    let imageTwo: UIImageView = {
        let imageTwo = UIImageView()
        imageTwo.image = UIImage(named: "dice2")
        imageTwo.contentMode = .scaleAspectFit
        return imageTwo
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.addTarget (self, action: #selector(askButtonPress), for: .touchUpInside)
        
        return button
    }()
    @objc func askButtonPress (_ sender: UIButton) {
        let diceArrays = [UIImage(named: "dice1"),
                          UIImage(named: "dice2"),
                          UIImage(named: "dice3"),
                          UIImage(named: "dice4"),
                          UIImage(named: "dice5"),
                          UIImage(named: "dice6")]
        imageOne.image = diceArrays[Int.random(in: 0...5)]
        
        imageTwo.image = diceArrays[Int.random(in: 0...5)]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    func initialize () {
        view.addSubview(imageBack)
        view.addSubview(imageLogo)
        view.addSubview(imageOne)
        view.addSubview(imageTwo)
        view.addSubview(button)
        
        imageBack.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        imageLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.trailing.leading.equalToSuperview().inset(35)
        }
        imageOne.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(250)
            make.top.equalTo(imageLogo).inset(180)
        }
        imageTwo.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(250)
            make.top.equalTo(imageLogo).inset(180)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(150)
        }
    }

}

