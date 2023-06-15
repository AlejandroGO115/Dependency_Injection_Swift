//
//  ErrorHandler.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation

class ErrorHandler {
	class func mapError(apiError: ApiError) -> DomainError {
		switch apiError {
			case .apiException:
				return .HttpError
			case .decodingException:
				return .IOError
		}
	}
}
