//
//  ResponseDTO.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

struct ResponseDTO: Decodable {
	let count: Int
	let next: String?
	let previous: String?
	let results: [ResultDTO]
	
	func toModel() -> ResponseModel {
		return ResponseModel(count: self.count, result: self.results.map({dto in
			dto.toModel()
		}))
	}
}
