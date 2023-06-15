//
//  FeatureList+Injection.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation
import Resolver

extension Resolver {
	
	public static func registerFeatureListDependencies() {
		register { ApiPokemonService() }
		
		register { PokemonRepositoryImp(api: resolve()) }
			.implements(PokemonRepositoryProtocol.self)
		
		register { GetPokemonUseCase(repository: resolve()) }
		
		register { ViewModel(getPokemonUseCase: resolve()) }
	}
}
