//
//  Track.swift
//  JSON
//
//  Created by Gor Grigoryan on 10/27/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

struct Track: Decodable {
    var artistName: String
    var collectionName: String
    var trackName: String
    var artworkUrl60: String?
}
