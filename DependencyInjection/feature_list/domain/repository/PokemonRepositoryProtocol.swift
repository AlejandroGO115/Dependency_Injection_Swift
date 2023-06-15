//
//  PokemonRepository.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

protocol PokemonRepositoryProtocol {
	func getPokemons(offset: Int, limit: Int, completion: @escaping(Result<ResponseModel,DomainError>) -> Void)
}
