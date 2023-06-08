//
//  CharactersModel.swift
//  Game Characters
//
//  Created by TheGIZzz on 5/6/2566 BE.
//

import Foundation

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let champions: [ChampionElement]
    let page: Page
}

// MARK: - ChampionElement
struct ChampionElement: Codable {
    let node: Node
}

// MARK: - Node
struct Node: Codable {
    let publishDetails: PublishDetails
    let uid, url, championName: String
    let championSplash: String
    let recommendedRoles: [String]
    let difficulty: Int
    let champion: NodeChampion

    enum CodingKeys: String, CodingKey {
        case publishDetails = "publish_details"
        case uid, url
        case championName = "champion_name"
        case championSplash = "champion_splash"
        case recommendedRoles = "recommended_roles"
        case difficulty, champion
    }
}

// MARK: - NodeChampion
struct NodeChampion: Codable {
    let profileImage: ProfileImage?

    enum CodingKeys: String, CodingKey {
        case profileImage = "profile_image"
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let url: String
}

// MARK: - PublishDetails
struct PublishDetails: Codable {
    let locale: Locale
}

enum Locale: String, Codable {
    case enUs = "en-us"
}

// MARK: - Page
struct Page: Codable {
    let start, end, totalCount: Int
}
