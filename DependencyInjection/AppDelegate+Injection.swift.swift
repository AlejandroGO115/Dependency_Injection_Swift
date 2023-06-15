//
//  AppDelegate+Injection.swift.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
	
	public static func registerAllServices() {
		registerFeatureListDependencies()
	}
}
