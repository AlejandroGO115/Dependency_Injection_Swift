//
//  ViewModel.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

class ViewModel {
	
	private let getPokemonUseCase: GetPokemonUseCase
	private var offset = 0
	private let LIMIT = 20
	
	var stateSuccess: ((ResponseModel) -> Void)?
	var eventError: ((String) -> Void)?
	
	init(getPokemonUseCase: GetPokemonUseCase) {
		self.getPokemonUseCase = getPokemonUseCase
	}
	
	func getPokemons() {
		self.getPokemonUseCase.excecute(offset: self.offset, limit: self.LIMIT) { result in
			switch result {
				case .success(let pokemons):
					self.stateSuccess?(pokemons)
				case .failure(_):
					self.eventError?("Ocurrió un error")
			}
		}
	}
}
