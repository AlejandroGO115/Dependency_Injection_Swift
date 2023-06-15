//
//  PokemonRepositoryImp.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

class PokemonRepositoryImp: PokemonRepositoryProtocol {
	private let api: ApiPokemonService
	
	init(api: ApiPokemonService) {
		self.api = api
	}
	
	func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<ResponseModel, DomainError>) -> Void) {
		self.api.getPokemons(offset: offset, limit: limit) { result in
			switch result {
				case .success(let response):
					let model = response.toModel()
					completion(.success(model))
				case .failure(let error):
					let domainError = ErrorHandler.mapError(apiError: error)
					completion(.failure(domainError))
			}
		}
	}
}
