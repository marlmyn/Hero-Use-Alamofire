//
//  HeroModelResponse.swift
//  HeroLabWork
//
//  Created by Akmaral Ergesh on 09.12.2022.
//

import Foundation

struct HeroModelResponse: Decodable{
    let name: String
    let images: HeroImage
    let biography: biographyInfo
}
struct HeroImage: Decodable{
    let sm: String
}

struct biographyInfo: Decodable{
    let fullName: String
    let placeOfBirth: String
    let publisher: String
    let alterEgos: String
}
