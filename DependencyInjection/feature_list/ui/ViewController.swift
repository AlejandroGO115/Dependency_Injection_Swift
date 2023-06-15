//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Alejandro García Olivo on 13/06/23.
//

import UIKit
import Resolver

class ViewController: UIViewController {
	
	@Injected var viewModel: ViewModel
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel.stateSuccess = { model in
			for result in model.result {
				print("{ name: \(result.name), url: \(result.url)")
			}
		}
		
		viewModel.eventError = { error in
			print(error)
		}
		
		viewModel.getPokemons()
	}


}

