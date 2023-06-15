//
//  ApiPokemonService.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation
import Alamofire

class ApiPokemonService {
	
	func getPokemons(offset: Int, limit: Int, completion: @escaping(Swift.Result<ResponseDTO, ApiError>) -> Void) {
		let request = AF.request("https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)")
		request.response { response in
			
			if response.error != nil {
				completion(.failure(.apiException))
				return
			}
			
			do {
				guard let data = response.data else {
					completion(.failure(.decodingException))
					return
				}
				
				let dto = try JSONDecoder().decode(ResponseDTO.self, from: data)
				completion(.success(dto))
				
			} catch {
				completion(.failure(.decodingException))
			}
			
		}
	}
	
}
