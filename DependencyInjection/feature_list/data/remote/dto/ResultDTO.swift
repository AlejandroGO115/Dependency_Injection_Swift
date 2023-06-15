//
//  ResultDTO.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

struct ResultDTO: Decodable {
	let name: String
	let url: String
	
	func toModel() -> ResultModel {
		return ResultModel(name: self.name, url: self.url)
	}
}
