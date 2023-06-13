//
//  ViewController.swift
//  HeroLabWork
//
//  Created by Akmaral Ergesh on 09.12.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, NetworkManagerDelegate {
    
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroPlaceOfBirth: UILabel!
    @IBOutlet weak var heroPublisher: UILabel!
    @IBOutlet weak var heroAlterEgos: UILabel!

    var networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
    }
    @IBAction func getHeroButton(_ sender: UIButton){
        let randomId = Int.random(in: 1...731)
        networkManager.getHero(by: randomId)
    }
    func updateHero(with model: HeroModelResponse) {
        heroName.text = model.name
        heroFullName.text = model.biography.fullName
        heroPlaceOfBirth.text = model.biography.placeOfBirth
        heroPublisher.text = model.biography.publisher
        heroAlterEgos.text = model.biography.alterEgos
        let imageUrl = URL(string: model.images.sm)
        heroImage.kf.setImage(with: imageUrl)
    }
}

