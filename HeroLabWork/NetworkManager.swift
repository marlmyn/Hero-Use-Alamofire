//
//  NetworkManager.swift
//  HeroLabWork
//
//  Created by Akmaral Ergesh on 09.12.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func updateHero(with model: HeroModelResponse)
}
struct NetworkManager{
    var delegate: NetworkManagerDelegate?
    
    func getHero(by id: Int){
        let urlString = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id/\(id).json"
        AF.request(urlString).responseDecodable(of: HeroModelResponse.self){ response in
            switch response.result{
            case .success(let heroModel):
                delegate?.updateHero(with: heroModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
