//
//  SearchResponse.swift
//  JSON
//
//  Created by Gor Grigoryan on 10/27/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}
